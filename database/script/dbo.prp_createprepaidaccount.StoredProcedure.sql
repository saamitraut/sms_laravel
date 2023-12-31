USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[prp_createprepaidaccount]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prp_createprepaidaccount](@bou_tab as prp_AcctBouqe readonly,@accountId as bigint,@subop_op as bit=1,@UserId as bigint,@remark as varchar(250)='')            
As            
Begin            
if(exists(Select * from SMS_SUBSCRIBERACCOUNTS where Id=@accountId and Status=1))            
Begin            
  Begin Try            
	if(OBJECT_ID('tempdb.dbo.#temp_trans_1') is not null)
	drop table #temp_trans_1
	if(OBJECT_ID('tempdb.dbo.#temp_trans_2') is not null)
	drop table #temp_trans_2
	if(OBJECT_ID('tempdb.dbo.#temp_trans_3') is not null)
	drop table #temp_trans_3
	if(OBJECT_ID('tempdb.dbo.#temp_bou_to_assign') is not null)
	drop table #temp_bou_to_assign
	-----------------------------------Taking care of deactivation date of Addon Packs---------------------
	declare @DeactivationDate as date;
	select * into #temp_trans_3 from PRP_ACCOUNTTRANSACTION where AccountId=@accountId and DeactivationDate>CAST(GETDATE() AS DATE);
	
	select * into #temp_bou_to_assign from @bou_tab;
	
	select @DeactivationDate=max(DeactivationDate) from #temp_trans_3 where BouqueId in (select id from PRP_BOUQUE where AType=1 and Status=1);
	Update #temp_bou_to_assign set e_date=case when e_date>@DeactivationDate then @DeactivationDate else e_date end;
	-----------------------------------Taking care of deactivation date of Addon Packs---------------------

	/*
	declare @isNcf as int;
	if exists(select * from PRP_ACCOUNTTRANSACTION where AccountId=@accountId and DeactivationDate>CAST(GETDATE() AS DATE))
	begin
	select top 1 @isNcf=ISNULL(IsNcf,1) from PRP_BOUQUE where Id in (select distinct BouqueId from #temp_trans_3) and Atype=1;
	end
	else
	begin
	select top 1 @isNcf=ISNULL(IsNcf,1) from PRP_BOUQUE where Id in (select distinct BouqueId from t_prp_AcctBouqe) and Atype=1; 
	end
	*/
	---------------------------------------------NCF Calculation Start------------------------------------------------------
	declare @NCFAmount as float;
	set @NCFAmount=0;
	/*
	if @isNcf=0
	BEGIN
	set @NCFAmount=0;
	END
	else
	BEGIN
	declare @bouStrNew Varchar(8000);
	SELECT @bouStrNew=STUFF((SELECT ',' + cast(BouqueId as varchar) FROM t_prp_AcctBouqe EE WHERE EE.bouqueId not in (select Id from PRP_BOUQUE where AType=1)
	and EE.AccountId=Erpr.AccountId and SessionId=@SessionId
	FOR XML PATH('')),1,1,'') FROM t_prp_AcctBouqe Erpr where bouqueId not in (select Id from PRP_BOUQUE where AType=1) 
	and AccountId=@accountId and SessionId=@SessionId GROUP BY Erpr.AccountId;

	select @NCFAmount=dbo.[NCFChannelAmount](@bouStrNew,@accountId);
    END
	*/
	---------------------------------------------NCF Calculation Stop------------------------------------------------------

	select *,round((Rate/30)*noDays,2)+dbo.AllTaxAmt(round((Rate/30)*noDays,2))as Amt,
	round((LCOSharing/30)*noDays,2) as LCOSharingAmt,cast(0 as float) as NCFAmount,cast(0 as float) as NCF_LCOSharing,
	@accountId as accountId into #temp_trans_1 from (select x.* ,(DATEDIFF(DAY,x.activationdate,x.ExpiryDate)/30) as noMonths,
	DATEDIFF(DAY,x.activationdate,x.ExpiryDate) as noDays from(        
	Select a.id as BouqueId,a.AType,a.BouqueName,a.Rate,a.LCOSharing,b.s_date as activationdate,b.e_date as ExpiryDate        
	from PRP_BOUQUE a left outer join #temp_bou_to_assign b on a.Id=b.bouqueId where b.bouqueId is not null and b.IsDemo=0)x        
	cross apply dbo.[fn_getYMDbtwndates](x.activationdate,x.ExpiryDate)z)y;

	Update #temp_trans_1 set NCFAmount=0,NCF_LCOSharing=0 from #temp_trans_1 
	where BouqueId in (select top 1 BouqueId from #temp_trans_1 order by rate asc);

  declare @subscriberId as bigint
  declare @opId as bigint
  declare @castypeId as bigint

  select @subscriberId=subscriberId,@castypeId=CASTYPEID from sms_view_SubscriberAccountList where Id=@accountId;
  Select @opId=OperatorId from SMS_SUBSCRIBERS where Id=@subscriberId;

  select a.* into #temp_trans_2 from #temp_trans_1 a            
  left outer join PRP_ACCOUNTTRANSACTION b on a.accountId=b.AccountId and a.activationdate=b.ActivationDate            
  and a.ExpiryDate=b.DeactivationDate and a.BouqueId=b.BouqueId and b.Status=1  where b.Id is null
  and a.ExpiryDate>a.activationdate; -- to remove addon bouquets already running on the box

  if(exists(Select * from #temp_trans_2))
	begin
		if(exists(select * from prp_view_operator_ledger_balance where operatorId=@opId and Balance>=(select SUM(Amt+NCFAmount) from #temp_trans_2)))		
		Begin                                                        

		declare @session as bigint	
		select @session=isnull(MAX(SessionFlag),0)+1 from PRP_ACCOUNTTRANSACTION where accountid=@accountId;

		insert into PRP_ACCOUNTTRANSACTION(AccountId,BouqueId,Rate,Amount,LCOSharing,NCFAmount,NCF_LCOSharing,Status,ActivationDate,DeactivationDate,CreatedOn,CreatedBy,Remark,SessionFlag,OperatorId,CASStatus)
		Select accountId,BouqueId,Rate,Amt,LCOSharingAmt,0 as NCFAmount,0 as NCF_LCOSharing,1,activationdate,ExpiryDate,GETDATE(),@UserId,@remark,@session,@opId,0 from #temp_trans_2;

		Select 'Selected Bouquets assigned Successfully ' as msg,'false' as error;            
		End    
		Else            
		Begin     
		Select 'NcfAmount: '+CAST(@NCFAmount as varchar(50))+ ' is added please check your balance.Afer adding NCF balance is less than Total Amount' as msg,'true' as error;              
		return            
		End             
	end
  else
	begin
	Select 'No bouquets assigned since already running' as msg,'false' as error; 
	end     

	if(OBJECT_ID('tempdb.dbo.#temp_trans_1') is not null)    
		drop table #temp_trans_1  
	
	if(OBJECT_ID('tempdb.dbo.#temp_trans_2') is not null)    
		drop table #temp_trans_2  
         
		exec prp_activate_prepaid @accountId,@UserId,@remark='prp_createprepaidaccount'
		update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId;
  end Try             

  Begin Catch               
  select 'Error in PRP_CREATE '+cast(ERROR_PROCEDURE() as varchar)+' at  line '+ cast(ERROR_LINE() as varchar)+'             
  <br> ' +ERROR_MESSAGE()  as msg,'true' as error;            
  end Catch            
End            
else            
Begin            
 select 'Prepaid Bouquets cannot be assigned as The Selected Account is Inactive<br>Please Activate the Account first'  as msg,'false' as error;            
End                        
End
GO

USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[prp_createprepaidaccount_session]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prp_createprepaidaccount_session](@SessionId as varchar(250),@accountId as bigint,
@subop_op as bit=1,@UserId as bigint,@remark as varchar(250)='prp_createprepaidaccount_session')            
As            
Begin            

if(exists(Select * from SMS_SUBSCRIBERACCOUNTS where Id=@accountId and Status=1))            
Begin            
  Begin Try            

	if(OBJECT_ID('tempdb.dbo.#temp_trans_1') is not null)    
	drop table #temp_trans_1  

	if(OBJECT_ID('tempdb.dbo.#temp_trans_2') is not null)    
	drop table #temp_trans_2 

	declare @castypeId as bigint      
	Select @castypeId=CASTYPEID from sms_view_SubscriberAccountList where Id=@accountId 

	-----------------------------------Taking care of deactivation date of Addon Packs---------------------
	declare @DeactivationDate as date;
	if(OBJECT_ID('tempdb.dbo.#temp_trans_3') is not null)    
	drop table #temp_trans_3
	select * into #temp_trans_3 from PRP_ACCOUNTTRANSACTION where AccountId=@accountId
	select @DeactivationDate=max(DeactivationDate) from #temp_trans_3 where BouqueId in (select id from PRP_BOUQUE where AType=1 and Status=1)
	Update t_prp_AcctBouqe set e_date=case when e_date>@DeactivationDate then @DeactivationDate else e_date end where AccountId=@accountId and SessionId=@SessionId;
	-----------------------------------Taking care of deactivation date of Addon Packs---------------------

	---------------------------------------------NCF Calculation Start------------------------------------------------------
	declare @NCFAmount as float;
	declare @bouStrNew Varchar(8000);
	SELECT @bouStrNew=STUFF((SELECT ',' + cast(BouqueId as varchar) FROM t_prp_AcctBouqe EE WHERE EE.AccountId=Erpr.AccountId and SessionId=@SessionId
	FOR XML PATH('')),1,1,'') FROM t_prp_AcctBouqe Erpr where AccountId=@accountId and SessionId=@SessionId GROUP BY Erpr.AccountId;

	select @NCFAmount=dbo.[NCFChannelAmount](@bouStrNew,@accountId);
    ---------------------------------------------NCF Calculation Stop------------------------------------------------------
 
	select *,round((Rate/30)*noDays,2) as Amt,round((LCOSharing/30)*noDays,2) as LCOSharingAmt,cast(0 as float) as NCFAmount,cast(0 as float) as NCF_LCOSharing,
	@accountId as accountId into #temp_trans_1 from (select x.* ,(DATEDIFF(DAY,x.activationdate,x.ExpiryDate)/30) as noMonths,
	DATEDIFF(DAY,x.activationdate,x.ExpiryDate) as noDays from(        
	Select a.id as BouqueId,a.AType ,a.BouqueName,a.Rate,a.LCOSharing,b.s_date as activationdate,b.e_date as  ExpiryDate        
	from PRP_BOUQUE a left outer join t_prp_AcctBouqe b on a.Id=b.bouqueId        
	where b.bouqueId is not null and b.IsDemo=0 and b.SessionId=@SessionId and b.AccountId=@accountId)x        
	cross apply dbo.[fn_getYMDbtwndates](x.activationdate,x.ExpiryDate)z )y  

	Update #temp_trans_1 set NCFAmount=0,NCF_LCOSharing=0 from #temp_trans_1 
	where BouqueId in (select top 1 BouqueId from #temp_trans_1 order by rate asc)
	
	declare @subscriberId as bigint             
	declare @opId as bigint              
	declare @lastid as bigint          

	select @subscriberId=subscriberId from SMS_SUBSCRIBERACCOUNTS where Id=@accountId               
	Select @opId=Case @subop_op when 1 then OperatorId else ParentOperatorId end from sms_view_subscribers where id=@subscriberId            

	select a.* into #temp_trans_2 from #temp_trans_1 a            
	left outer join PRP_ACCOUNTTRANSACTION b on a.accountId=b.AccountId and a.activationdate=b.ActivationDate            
	and a.ExpiryDate=b.DeactivationDate and a.BouqueId=b.BouqueId and b.Status=1 where b.Id is null                 

	if(exists(Select * from #temp_trans_2))            
	begin
		if(exists(select * from prp_view_operator_ledger_balance where operatorId=@opId and Balance>=(select SUM(Amt+NCFAmount) from #temp_trans_2)))		
		Begin                                                        

		declare @session as bigint	
		select @session=isnull(MAX(SessionFlag),0)+1 from PRP_ACCOUNTTRANSACTION where accountid=@accountId              

		insert into PRP_ACCOUNTTRANSACTION(AccountId,BouqueId,Rate,Amount,LCOSharing,NCFAmount,NCF_LCOSharing,Status,ActivationDate,DeactivationDate,CreatedOn,CreatedBy,Remark,SessionFlag,OperatorId)            
		Select accountId,BouqueId,Rate,Amt,0 as LCOSharingAmt,0 as NCFAmount,0 as NCF_LCOSharing,1,activationdate,ExpiryDate,GETDATE(),@UserId,'prp_createprepaidaccount_session',@session,@opId from #temp_trans_2                  
       
		Select 'Selected Bouquets assigned Successfully ' as msg,'false' as error;            
		End    
		Else            
		Begin     
		Select 'NcfAmount: '+@NCFAmount+ ' is added please check your balance.Afer adding NCF balance is less than Total Amount' as msg,'true' as error;              
		return            
		End             
	End                     
  
	if(OBJECT_ID('tempdb.dbo.#temp_trans_1') is not null)    
		drop table #temp_trans_1  
	
	if(OBJECT_ID('tempdb.dbo.#temp_trans_2') is not null)    
		drop table #temp_trans_2  
         
	if(@castypeId=1) --ABV
	Begin
		exec [cas_abv_sms_update_entitlement] @accountId,@UserId
		update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId 
	ENd 
	 
	end Try             
		Begin Catch            
		select 'Error in PRP_CREATE_SESSION '+cast(ERROR_PROCEDURE() as varchar)+' at  line '+ cast(ERROR_LINE() as varchar)+'<br> ' +ERROR_MESSAGE()  as msg,'true' as error;            
		end Catch            
	End            
	else            
	Begin            
	 select 'Prepaid Bouquets cannot be assigned as The Selected Account is Inactive<br>Please Activate the Account first'  as msg,'false' as error;            
	End             
End
GO

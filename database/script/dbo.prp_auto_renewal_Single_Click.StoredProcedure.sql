USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[prp_auto_renewal_Single_Click]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prp_auto_renewal_Single_Click](@accountId as bigint,@UserId as bigint,@remark as varchar(250)='')            
As            
Begin            

if(exists(Select * from SMS_SUBSCRIBERACCOUNTS where Id=@accountId and Status=1))            
Begin            
  Begin Try            

	if(OBJECT_ID('tempdb.dbo.#temp_trans_1') is not null)    
	drop table #temp_trans_1
	if(OBJECT_ID('tempdb.dbo.#temp_trans_2') is not null)    
	drop table #temp_trans_2

	declare @castypeId as bigint;
	declare @opId as bigint;
	Select @castypeId=CASTYPEID,@opId=b.OperatorId from sms_view_SubscriberAccountList a 
	left join SMS_SUBSCRIBERS b on a.SubscriberId=b.Id where a.Id=@accountId 

	if exists(select top 1 id from PRP_ACCOUNTTRANSACTION where AccountId=@accountId)
	Begin
		if exists(select top 1 id from PRP_ACCOUNTTRANSACTION where AccountId=@accountId and
			BouqueId in (select id from PRP_BOUQUE where AType=1))
		Begin
			declare @deactivationDate as date;
			select top 1 @deactivationDate=cast(DATEADD(D,30,DeactivationDate) as date) from (select AccountId,max(DeactivationDate) as DeactivationDate,BouqueId,
			OperatorId from PRP_ACCOUNTTRANSACTION where AccountId=@accountId and
			BouqueId in (select id from PRP_BOUQUE where AType=1) group by AccountId,BouqueId,OperatorId)x 

			if(OBJECT_ID('tempdb.dbo.#t_prp_AcctBouqe') is not null)    
				drop table #t_prp_AcctBouqe

				select AccountId,Activationdate as s_date,@deactivationDate as e_date,BouqueId into #t_prp_AcctBouqe from 
				(select AccountId,max(DeactivationDate) as Activationdate,BouqueId from PRP_ACCOUNTTRANSACTION where AccountId=@accountId and
				BouqueId in (select distinct BouqueId from PRP_ACCOUNTTRANSACTION where AccountId=@accountId)
				group by AccountId,BouqueId)x 

				select *,round((Rate/30)*noDays,2) as Amt,round((LCOSharing/30)*noDays,2) as LCOSharingAmt,cast(0 as float) as NCFAmount,
				cast(0 as float) as NCF_LCOSharing,@accountId as accountId into #temp_trans_1 from 
				(select x.* ,(DATEDIFF(DAY,x.activationdate,x.ExpiryDate)/30) as noMonths,DATEDIFF(DAY,x.activationdate,x.ExpiryDate) as noDays from(        
				Select a.id as BouqueId,a.AType ,a.BouqueName,a.Rate,a.LCOSharing,b.s_date as activationdate,b.e_date as ExpiryDate        
				from PRP_BOUQUE a left outer join #t_prp_AcctBouqe b on a.Id=b.bouqueId where b.bouqueId is not null and b.AccountId=@accountId)x
				cross apply dbo.[fn_getYMDbtwndates](x.activationdate,x.ExpiryDate)z )y

				---------------------------------------------NCF Calculation Start For Advance Renewal------------------------------------------------------
				declare @NCFAmount as float;
				declare @bouStrNew Varchar(8000);
				declare @NCFChSlab bigint=0;
				SELECT @bouStrNew=STUFF((SELECT ',' + cast(BouqueId as varchar) FROM #t_prp_AcctBouqe EE WHERE EE.AccountId=Erpr.AccountId
				FOR XML PATH('')),1,1,'') FROM #t_prp_AcctBouqe Erpr where AccountId=@accountId GROUP BY Erpr.AccountId;

				select @NCFChSlab=dbo.[NCFChannelCntSlab](dbo.[NCFChannelCount](@bouStrNew));
				select @NCFAmount=(@NCFChSlab*20+(@NCFChSlab*20)*0.18);
				---------------------------------------------NCF Calculation Stop------------------------------------------------------

--				Update #temp_trans_1 set NCFAmount=round((@NCFAmount/30)*noDays,2),NCF_LCOSharing=Round(((@NCFAmount/30)*noDays)*0.7,2) from #temp_trans_1 
				Update #temp_trans_1 set NCFAmount=0,NCF_LCOSharing=0 from #temp_trans_1 

				where BouqueId in (select top 1 BouqueId from #temp_trans_1 order by rate asc)
			
				if(exists(select * from prp_view_operator_ledger_balance where operatorId=@opId and Balance>=(select SUM(Amt+NCFAmount) from #temp_trans_1)))
				Begin
					insert into PRP_ACCOUNTTRANSACTION(AccountId,BouqueId,Rate,Amount,LCOSharing,NCFAmount,NCF_LCOSharing,Status,ActivationDate,DeactivationDate,
					CreatedOn,CreatedBy,Remark,OperatorId,CASStatus,IsAutoRenew,SessionFlag)            
					Select accountId,BouqueId,Rate,Amt,LCOSharingAmt,NCFAmount,NCF_LCOSharing,1,activationdate,ExpiryDate,
					GETDATE(),@UserId,'prp_auto_renewal_Single_Click1',@opId,0,0,1 from #temp_trans_1 

					Select 'Advance Renewal Done Successfully ' as msg,'false' as error;   
				End
				else
				Begin
					Select 'please check your balance. Insufficient Balance' as msg,'true' as error;   
				end
			End
			ELSE
			BEGIN 
				Select 'IsAutoRenew Is not True' as msg,'true' as error;
			END
	End
	else 
	Begin 

		if(OBJECT_ID('tempdb.dbo.#t_prp_AcctBouqe2') is not null)    
			drop table #RmEXTRA
		if(OBJECT_ID('tempdb.dbo.#t_prp_AcctBouqe2') is not null)    
			drop table #RmEXTRA

			select @accountId as AccountId,GETDATE() as s_date,cast(DATEADD(D,30,GETDATE()) as date) as e_date,BouqueId into #t_prp_AcctBouqe2 from 
			(select distinct BouqueId from PRP_ACCOUNTTRANSACTION_HISTORY where AccountId=@accountId and Remark='Expire Bouquet Remove' and 
			InsertedOn>DATEADD(D,-25,getdate()))x 

			if exists(select * from #t_prp_AcctBouqe2 where BouqueId in (select id from PRP_BOUQUE where AType=1 and Status=1))
			begin
			 select ROW_NUMBER()OVER(PARTITION by Accountid order by BouqueId desc) as RID,BouqueId,Accountid into #RmEXTRA
			 from #t_prp_AcctBouqe2 where BouqueId in (select id from PRP_BOUQUE where AType=1)

			 delete from #t_prp_AcctBouqe2 where BouqueId in (select id from PRP_BOUQUE where AType=1) and BouqueId not in (select BouqueId from #RmEXTRA where RID=1)
			end
			else
			begin 
			 delete from #t_prp_AcctBouqe2
			end

			select *,round((Rate/30)*noDays,2) as Amt,round((LCOSharing/30)*noDays,2) as LCOSharingAmt,cast(0 as float) as NCFAmount,
			cast(0 as float) as NCF_LCOSharing,@accountId as accountId into #temp_trans_2 from 
			(select x.* ,(DATEDIFF(DAY,x.activationdate,x.ExpiryDate)/30) as noMonths,DATEDIFF(DAY,x.activationdate,x.ExpiryDate) as noDays from(        
			Select a.id as BouqueId,a.AType ,a.BouqueName,a.Rate,a.LCOSharing,b.s_date as activationdate,b.e_date as ExpiryDate        
			from PRP_BOUQUE a left outer join #t_prp_AcctBouqe2 b on a.Id=b.bouqueId where b.bouqueId is not null and b.AccountId=@accountId)x
			cross apply dbo.[fn_getYMDbtwndates](x.activationdate,x.ExpiryDate)z )y

			---------------------------------------------NCF Calculation Start For Advance Renewal------------------------------------------------------
			declare @NCFAmount2 as float;
			declare @bouStrNew2 Varchar(8000);
			declare @NCFChSlab2 bigint=0;
			SELECT @bouStrNew2=STUFF((SELECT ',' + cast(BouqueId as varchar) FROM #t_prp_AcctBouqe2 EE WHERE EE.AccountId=Erpr.AccountId
			FOR XML PATH('')),1,1,'') FROM #t_prp_AcctBouqe2 Erpr where AccountId=@accountId GROUP BY Erpr.AccountId;

			select @NCFChSlab2=dbo.[NCFChannelCntSlab](dbo.[NCFChannelCount](@bouStrNew2));
			select @NCFAmount2=(@NCFChSlab2*20+(@NCFChSlab2*20)*0.18);
			---------------------------------------------NCF Calculation Stop------------------------------------------------------

			--Update #temp_trans_2 set NCFAmount=round((@NCFAmount2/30)*noDays,2),NCF_LCOSharing=Round(((@NCFAmount2/30)*noDays)*0.7,2) from #temp_trans_2
			Update #temp_trans_2 set NCFAmount=0,NCF_LCOSharing=0 from #temp_trans_2 
			where BouqueId in (select top 1 BouqueId from #temp_trans_2 order by rate asc)
			
			if(exists(select * from prp_view_operator_ledger_balance where operatorId=@opId and Balance>=(select SUM(Amt+NCFAmount) from #temp_trans_2)))
			Begin
				insert into PRP_ACCOUNTTRANSACTION(AccountId,BouqueId,Rate,Amount,LCOSharing,NCFAmount,NCF_LCOSharing,Status,ActivationDate,DeactivationDate,
				CreatedOn,CreatedBy,Remark,OperatorId,CASStatus,IsAutoRenew,SessionFlag)            
				Select accountId,BouqueId,Rate,Amt,LCOSharingAmt,NCFAmount,NCF_LCOSharing,1,activationdate,ExpiryDate,
				GETDATE(),@UserId,'prp_auto_renewal_Single_Click2',@opId,0,0,1 from #temp_trans_2

				Select 'Advance Renewal Done Successfully ' as msg,'false' as error;   
			End
			else
			Begin
				Select 'please check your balance. Insufficient Balance' as msg,'true' as error;   
			end  
	End

	if(OBJECT_ID('tempdb.dbo.#temp_trans_1') is not null)    
		drop table #temp_trans_1  
	if(OBJECT_ID('tempdb.dbo.#temp_trans_2') is not null)    
		drop table #temp_trans_2
	if(OBJECT_ID('tempdb.dbo.#t_prp_AcctBouqe') is not null)    
		drop table #t_prp_AcctBouqe  
	if(OBJECT_ID('tempdb.dbo.#t_prp_AcctBouqe2') is not null)    
		drop table #t_prp_AcctBouqe2 
	if(OBJECT_ID('tempdb.dbo.#RmEXTRA') is not null)    
		drop table #RmEXTRA 
              
	exec prp_activate_prepaid @accountId,@UserId,@remark='prp_auto_renewal_Single_Click'
	update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId      
	 
	end Try             
		Begin Catch            
		select 'Error in prp_auto_renewal_Single_Click '+cast(ERROR_PROCEDURE() as varchar)+' at  line '+ cast(ERROR_LINE() as varchar)+'<br> ' +ERROR_MESSAGE()  as msg,'true' as error;            
		end Catch            
	End            
	else            
	Begin            
	 select 'Prepaid Bouquets cannot be assigned as The Selected Account is Inactive<br>Please Activate the Account first'  as msg,'false' as error;            
	End             
End
GO

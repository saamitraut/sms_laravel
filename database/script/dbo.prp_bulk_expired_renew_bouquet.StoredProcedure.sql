USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[prp_bulk_expired_renew_bouquet]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prp_bulk_expired_renew_bouquet](@AccountIdAll as varchar(8000),@UserId as bigint,@RenewDays as int)     as
Begin 
	if(OBJECT_ID('tempdb.dbo.#AssignBouq') is not null)  
	drop table #AssignBouq

	Declare @AccountId bigint
	Declare @subscriberId bigint	
	Declare @opId bigint	
	Declare @TotalAccount int
	Declare @Done int	

	Select a.id as AccountId,a.IsPrimary,a.SubscriberId,b.OperatorId into #AssignBouq         
	from SMS_SUBSCRIBERACCOUNTS a
	inner join SMS_SUBSCRIBERS b on a.SubscriberId=b.Id 
	cross apply dbo.SplitToColoumn(@AccountIdAll,',') c          
	where a.Id=CAST(c.items AS BIGINT) and a.Status=1;

	
	Select @TotalAccount=count(AccountId),@Done=0 from #AssignBouq;

	while(exists(Select AccountId from #AssignBouq ))    
	Begin

	Select top 1 @subscriberId=SubscriberId,@AccountId=AccountId,@opId=OperatorId from #AssignBouq 
	
	
	if(OBJECT_ID('tempdb.dbo.#tprp') is not null)  
	drop table #tprp 

	if(OBJECT_ID('tempdb.dbo.#tact') is not null)  
		drop table #tact  	
 	
	
	select * into #tprp from (
	select ROW_NUMBER() over (partition by accountId,BouqueId order by Id desc)as rid,* from PRP_ACCOUNTTRANSACTION_HISTORY 
	where  AccountId=@AccountId and CAST(InsertedOn as date)>DATEADD(D,-25,CAST(getdate() as date)))x where x.rid=1


	select b.*, AcctDate=CAST(GETDATE() as date), DAcctDate=dateadd(d,@RenewDays,CAST(GETDATE() as date)),SessFlag=1 into #tact
	from #tprp b 

	if(OBJECT_ID('tempdb.dbo.#temp_trans_1') is not null)  
	drop table #temp_trans_1  
	
		select *,round((Rate/30)*noDays,2) as Amt,round((LCOSharing/30)*noDays,2) as LCOSharingAmt,cast(0 as float) as NCFAmount,
		cast(0 as float) as NCF_LCOSharing,@accountId as accountId into #temp_trans_1 from 
		(select x.* ,--(DATEDIFF(DAY,x.activationdate,x.ExpiryDate)/30) as noMonths,
		DATEDIFF(DAY,x.activationdate,x.ExpiryDate) as noDays
		from(Select b.id as BouqueId,b.AType,b.BouqueName,b.Rate,b.LCOSharing,a.AcctDate as activationdate,a.DAcctDate as ExpiryDate        
		from #tact a left outer join PRP_BOUQUE b on a.BouqueId=b.Id where b.Status=1 and a.bouqueId is not null
		and a.AccountId=@accountId)x cross apply dbo.[fn_getYMDbtwndates](x.activationdate,x.ExpiryDate)z )y


	if(exists(Select BouqueId from #temp_trans_1))            
	Begin            
		if(exists(select * from prp_view_operator_ledger_balance where operatorId=@opId and Balance>=(select SUM(Amt+NCFAmount)
		 from #temp_trans_1)))
			
		Begin                                                        
			declare @session as bigint            
			select @session=isnull(MAX(SessionFlag),0)+1 from PRP_ACCOUNTTRANSACTION where accountid=@AccountId      
      
			insert into PRP_ACCOUNTTRANSACTION(AccountId,BouqueId,Rate,Amount,LCOSharing,NCFAmount,NCF_LCOSharing,Status,ActivationDate,DeactivationDate,
			CreatedOn,CreatedBy,Remark,OperatorId,CASStatus,IsAutoRenew,SessionFlag)            
			Select accountId,BouqueId,Rate,Amt,LCOSharingAmt,NCFAmount,NCF_LCOSharing,1,activationdate,ExpiryDate,
			GETDATE(),@UserId,CAST(@RenewDays as varchar)+'Days_BULK_EXPIRED_BUQUETES_ACTIVATION_',@opId,0,0,1 from #temp_trans_1                  

			Select @Done=@Done+1
			/*
			declare @CasTypeId as bigint;
			Select @CasTypeId=CASTYPEID from sms_view_accounts_pairings where Id=@AccountId
			if(@castypeId=4)
			begin 
				exec prp_activate_prepaid @accountId,@UserId,@remark='BULK_BOUUETES_ACTIVATION_'
				update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId      
			end
			if(@castypeId=1)
			begin 
				exec prp_activate_prepaid @accountId,@UserId,@remark='BULK_BOUUETES_ACTIVATION_'
				update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId      
			end
			*/


			exec prp_activate_prepaid @accountId,@UserId,@remark='BULK_EXPIRED_BUQUETES_ACTIVATION_'
			update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@AccountId 	            
		End
	End

	Delete from #AssignBouq where AccountId=@AccountId

	End
	
	Select 'Total- '+cast(@TotalAccount as varchar)+ '  Successfully-'+ cast(@Done as varchar) as msg

End
GO

USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[PRP_TRANS_ISAUTORENEW]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[PRP_TRANS_ISAUTORENEW]
As            
Begin            

	if(OBJECT_ID('tempdb.dbo.#operLoop') is not null)    
	drop table #operLoop

	select id into #operLoop from SMS_OPERATOR where STATUS=1

	declare @opid as bigint;
	while exists(select id from #operLoop)
	Begin
		 select top 1 @opid=id from #operLoop
		 declare @counter as bit=1;
		 while exists(select OperatorId from prp_view_operator_ledger_balance where operatorId=@opId and Balance>100 and @counter=1)
		 begin
		 	declare @acciddd as bigint=0;
		 	declare @deactivationDate as date;
			select top 1 @acciddd=isnull(AccountId,0),@deactivationDate=cast(DATEADD(D,30,x.DeactivationDate) as date) 
			from (select AccountId,max(DeactivationDate) as DeactivationDate,BouqueId,OperatorId 
			from PRP_ACCOUNTTRANSACTION where BouqueId in (select id from PRP_BOUQUE where AType=1) and IsAutoRenew=1 
			group by AccountId,BouqueId,OperatorId)x 
			left join SMS_SUBSCRIBERACCOUNTS b on x.AccountId=b.id
			where x.DeactivationDate<dateadd(D,3,cast(getdate() as date)) and OperatorId=@opid and b.Status=1
			
			if (@acciddd!=0)
			begin

				if(OBJECT_ID('tempdb.dbo.#t_prp_AcctBouqe') is not null)    
				drop table #t_prp_AcctBouqe

				if(OBJECT_ID('tempdb.dbo.#temp_trans_1') is not null)    
				drop table #temp_trans_1

				select AccountId,Activationdate as s_date,@deactivationDate as e_date,BouqueId into #t_prp_AcctBouqe from 
				(select AccountId,max(DeactivationDate) as Activationdate,BouqueId from PRP_ACCOUNTTRANSACTION 
				where AccountId=@acciddd and IsAutoRenew=1 and Status=1
				group by AccountId,BouqueId)x 

				select *,round((Rate/30)*noDays,2) as Amt,round((LCOSharing/30)*noDays,2) as LCOSharingAmt,cast(0 as float) as NCFAmount,
				cast(0 as float) as NCF_LCOSharing,@acciddd as accountId into #temp_trans_1 from 
				(select x.* ,(DATEDIFF(DAY,x.activationdate,x.ExpiryDate)/30) as noMonths,DATEDIFF(DAY,x.activationdate,x.ExpiryDate) as noDays from(        
				Select a.id as BouqueId,a.AType ,a.BouqueName,a.Rate,a.LCOSharing,b.s_date as activationdate,b.e_date as  ExpiryDate        
				from PRP_BOUQUE a left outer join #t_prp_AcctBouqe b on a.Id=b.bouqueId where b.bouqueId is not null and b.AccountId=@acciddd)x
				cross apply dbo.[fn_getYMDbtwndates](x.activationdate,x.ExpiryDate)z )y

				---------------------------------------------NCF Calculation Start For Advance Renewal------------------------------------------------------
				declare @NCFAmount as float;
				declare @bouStrNew Varchar(8000);
				declare @NCFChSlab bigint=0;
				SELECT @bouStrNew=STUFF((SELECT ',' + cast(BouqueId as varchar) FROM #t_prp_AcctBouqe EE WHERE EE.AccountId=Erpr.AccountId
				FOR XML PATH('')),1,1,'') FROM #t_prp_AcctBouqe Erpr where AccountId=@acciddd GROUP BY Erpr.AccountId;

				select @NCFChSlab=dbo.[NCFChannelCntSlab](dbo.[NCFChannelCount](@bouStrNew));
				select @NCFAmount=(@NCFChSlab*20+(@NCFChSlab*20)*0.18);
				---------------------------------------------NCF Calculation Stop------------------------------------------------------

				Update #temp_trans_1 set NCFAmount=0,NCF_LCOSharing=0 from #temp_trans_1 
				where BouqueId in (select top 1 BouqueId from #temp_trans_1 order by rate asc)

				insert into PRP_ACCOUNTTRANSACTION(AccountId,BouqueId,Rate,Amount,LCOSharing,NCFAmount,NCF_LCOSharing,Status,ActivationDate,DeactivationDate,
				CreatedOn,CreatedBy,Remark,OperatorId,CASStatus,IsAutoRenew,SessionFlag)            
				Select accountId,BouqueId,Rate,Amt,LCOSharingAmt,0 as NCFAmount,0 as NCF_LCOSharing,1,activationdate,ExpiryDate,
				GETDATE(),1,'PRP_TRANS_ISAUTORENEW',@opId,0,1,1 from #temp_trans_1                
       
			end
			else 
			begin 
			set @counter=0
			end 

		 end
		 delete from #operLoop where id=@opid
	End 
	select distinct a.AccountId into #ActCmds
	 from PRP_ACCOUNTTRANSACTION a 
	left join sms_view_SubscriberAccountList b on a.AccountId=b.id
	 where b.CASTYPEID in (5) and CASStatus=0
	declare @accountId as bigint
	while exists (select * from #ActCmds)
	Begin
		select top 1 @accountId=AccountId from #ActCmds
		exec [prp_activate_prepaid] @accountId,1,'PRP_TRANS_ISAUTORENEW'
		delete from #ActCmds where AccountId=@accountId
	END
End
GO

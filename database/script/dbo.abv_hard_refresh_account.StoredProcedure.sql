USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[abv_hard_refresh_account]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[abv_hard_refresh_account] @accountId as bigint,@UserId as bigint
As
Begin					
	Declare @msg as varchar(200)
	Declare @pairingId as bigint
	Declare @ScId as bigint			
	Declare @STbId as bigint	
				
	Select @pairingId=Id,@ScId=SmartcardId,@STbId=StbId,@msg='SmartcardNo-'+SmartcardNo+' and STB-'+STBNo from sms_view_pairing	where AccountId=@accountId and CASTYPEID=4
				
	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
	select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,Id,'RCANBDSC',7,dbo.cas_abv_formatcmd(dbo.cas_abv_UnBindSmartcard(SmartcardNo))
	,'d_refresh_account',Getdate(),GETDATE(),@UserId,4 from sms_view_accounts_pairings where Id=@accountId
	
	WAITFOR DELAY '00:00:02';
	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
	CreatedOn,CreatedBy,CASTYPE)
	select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,Id,'RDELSC',2,dbo.cas_abv_formatcmd(dbo.cas_abv_deleteSmartcard(SmartcardNo))
	,'d_refresh_account',Getdate(),GETDATE(),@UserId,4 from sms_view_accounts_pairings where Id=@accountId
	
	--update PRP_ACCOUNTTRANSACTION set CASSTATUS=0 where AccountId=@accountId

	--exec cas_abv_sms_activate_account @accountId,@UserId,1,'R'

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,isnull(ActivationDate,GETDATE()) as CommandDate,@UserId as CreatedBy 
	into #temp_pairings from sms_view_accounts_pairings b where Id=@accountid and CASTYPEID=1

	if exists(select * from #temp_pairings)
	Begin
		---ADDSC Add Smartcard to CAS
		WAITFOR DELAY '00:00:02';
		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'R'+'ADDSC',1,dbo.cas_abv_formatcmd(dbo.cas_abv_addSmartcard(SmartcardNo))
		,'Refresh_cas_abv_sms_activate_account',DATEADD(SECOND,15,GETDATE()),GETDATE(),@UserId,'1' from #temp_pairings

		---BINDSC 45 6  Smartcard on CAS --precautional
		WAITFOR DELAY '00:00:02';
		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'R'+'BINDSC',6,dbo.cas_abv_formatcmd(dbo.cas_abv_BindSmartcard(SmartcardNo,STBNo))
		,'Refresh_cas_abv_sms_activate_account',DATEADD(SECOND,15+6,GETDATE()),GETDATE(),@UserId,'1' from #temp_pairings
	End

	select ROW_NUMBER()over(order by Id,IsAlacarte ) as RId,* into #temp_entitlements
	 FROM (
	select  ProductId as Id,CasCode as CasCode,right(dbo.[fn_varbintostr](a.CasCode),4) as LinkId,a.IsAlacarte as IsAlacarte,
	Min(ActivationDate) as ActivationDate,Max(DeactivationDate) as DeactivationDate,a.ProductId
	from sms_view_prp_account_transaction a
	 WHERE a.AccountId=@accountId  and DeactivationDate>=CAST(GETDATE() as date)
	 group by AccountId,CasCode,a.IsAlacarte,a.ProductId)X

	if exists(select * from #temp_entitlements)
	Begin
		select NTILE((Select cast(ceiling(COUNT(RID)/255.0)as int) from #temp_entitlements))over(order by RID) as Nid,* 
		into #temp_entitlement_f from #temp_entitlements

		select a.*,b.SmartcardNo into #temp from #temp_entitlement_f a,#temp_pairings b 

		select COUNT(*) as LinkCount,
		LinkIds=cast(substring 
		((SELECT (' '+t.LinkId+dbo.[getNdigit_str](t.LinkId,16))
		from #temp t
		WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid and a.ActivationDate=t.ActivationDate and a.DeactivationDate=t.DeactivationDate
		ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000)),PackageIds=cast(substring 
		((SELECT (','+cast(t.ProductId as varchar))
		from #temp t
		WHERE a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid and a.ActivationDate=t.ActivationDate and a.DeactivationDate=t.DeactivationDate and t.IsAlacarte=0
		ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000)),AlacarteIds=cast(substring 
		((SELECT (','+cast(t.ProductId as varchar))
		from #temp t
		WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid and a.ActivationDate=t.ActivationDate and a.DeactivationDate=t.DeactivationDate and t.IsAlacarte=1
		ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000))										
		,SmartcardNo,ActivationDate,DeactivationDate,Nid,dbo.fn_getHexdate(isnull(ActivationDate,GETDATE())) as StartDate,
		dbo.fn_getHexdate(isnull(DeactivationDate,GETDATE())) as EndDate,
		dbo.fn_getHexdateTime(dateadd(second,15,isnull(GETDATE(),GETDATE()))) as MsgDate
		into #temp_f  from #temp a group by SmartcardNo,Nid,ActivationDate,DeactivationDate
	 
		select *,dbo.cas_abv_formatcmd(dbo.[cas_abv_UpdateEmtitlement](SmartcardNo,LinkCount,LinkIds,MsgDate,StartDate,EndDate)) as Command
		into #t from #temp_f a
	 
		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,ActivationDate,DeactivationDate,PackageIds,AlacarteIds,CASTYPE)
		select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.AccountId,'R'+'ENTUPD',9,a.Command,'Refresh_abv_hard_refresh_account',
		dbo.returnGreaterdate (DATEADD(SECOND,10,GETDATE()),ActivationDate),GETDATE(),@UserId,ActivationDate,DeactivationDate,PackageIds,AlacarteIds,'1'
		from #t a left outer join #temp_pairings b on a.SmartcardNo=b.SmartcardNo
		where b.SubscriberId is not null
End
	update PRP_ACCOUNTTRANSACTION set CASSTATUS=1 where AccountId=@accountId					 

	Select 'Account Refereshed' as msg,1 as result,@ScId as lastScId,@STbId as lastStbId
End
GO

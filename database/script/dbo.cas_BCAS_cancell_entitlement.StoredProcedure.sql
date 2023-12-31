USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_BCAS_cancell_entitlement]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[cas_BCAS_cancell_entitlement] @accountId as bigint,@UserId as bigint,@CAS_STATUS as int=null,@Remark as varchar(50)='cas_BCAS_cancell_entitlement' 
as
Begin

	if(OBJECT_ID('tempdb.dbo.#temp_pairingggs2') is not null)    
			drop table #temp_pairingggs2
	if(OBJECT_ID('tempdb.dbo.#temp_bouqq2') is not null)    
			drop table #temp_bouqq2 
	if(OBJECT_ID('tempdb.dbo.#temp_trannns2') is not null)    
			drop table #temp_trannns2
	if(OBJECT_ID('tempdb.dbo.#t_assets2') is not null)    
			drop table #t_assets2

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,GETDATE() as CommandDate,@UserId as CreatedBy,CASTYPEID 
	into #temp_pairingggs2 from sms_view_accounts_pairings b where Id=@accountid

	select AccountId,BouqueId,ActivationDate as ActivationDate,DeactivationDate as DeactivationDate into #temp_bouqq2
	from PRP_ACCOUNTTRANSACTION where AccountId=@accountId and (CASStatus=@CAS_STATUS or @CAS_STATUS is null)

	select * into #t_assets2 from prp_view_Bou_pack_channel_cascode a where a.BouqueId in (Select BouqueId from #temp_bouqq2)

	select a.AccountId,a.ActivationDate,a.DeactivationDate,b.* into #temp_trannns2 from #temp_bouqq2 a left outer join #t_assets2 b on a.BouqueId=b.BouqueId
	
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.AccountId,'CANCEL_ENTITLEMENT' as CommandName,
	0 as Status,@Remark as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy,
	'020E'+'02'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo+'170004'+dbo.fn_varbintostr_(CasCodeBCAS,4) as Command, c.ActivationDate,c.DeactivationDate as DeactivationDate,
	case when IsAlacarte='0' then c.CasCodeBCAS else '0'end as PackageIds,case when IsAlacarte='1' then c.CasCodeBCAS else '0' end AS AlacarteIds,b.CASTYPEID	
	from #temp_pairingggs2 b left outer join #temp_trannns2 c on b.AccountId=c.AccountId where b.SubscriberId is not null and c.AccountId is not null	
	
	if(OBJECT_ID('tempdb.dbo.#temp_pairingggs2') is not null)    
			drop table #temp_pairingggs2 
	if(OBJECT_ID('tempdb.dbo.#temp_bouqq2') is not null)    
			drop table #temp_bouqq2 
	if(OBJECT_ID('tempdb.dbo.#temp_trannns2') is not null)    
			drop table #temp_trannns2
	if(OBJECT_ID('tempdb.dbo.#t_assets2') is not null)    
			drop table #t_assets2
ENd
GO

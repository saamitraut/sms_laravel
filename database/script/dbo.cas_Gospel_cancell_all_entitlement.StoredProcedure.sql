USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_Gospel_cancell_all_entitlement]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[cas_Gospel_cancell_all_entitlement] @accountId as bigint,@UserId as bigint,@CAS_STATUS as int=null 
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
	from PRP_ACCOUNTTRANSACTION where AccountId=@accountId and CASStatus=7

	select * into #t_assets2 from prp_view_Bou_pack_channel_cascode a where a.BouqueId in (Select BouqueId from #temp_bouqq2)

	select a.AccountId,a.ActivationDate,a.DeactivationDate,b.* into #temp_trannns2 from #temp_bouqq2 a left outer join #t_assets2 b on a.BouqueId=b.BouqueId

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Status,Attempts,ActivationDate,DeactivationDate,
	PackageIds,AlacarteIds,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
	Select  b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.AccountId,'DELENTL-GOSPELL',9,
	dbo.cas_abv_formatcmd(dbo.cas_Gospel_UpdateEntitlement_multi(b.SmartcardNo,'01',(''+'01'+'00'+''+right(dbo.[fn_varbintostr](c.CasCodeGospel),4)+
	dbo.fn_getUTCHexdateTime(c.DeactivationDate)+dbo.fn_getUTCHexdateTime(c.DeactivationDate)+'11'+'43414E43454E544C2046524F4D20534D53'))) as Command ,
	0 as Status,0 as Attempts,c.ActivationDate,c.DeactivationDate,
	case c.IsAlacarte when 0 then cast(c.ProductId as varchar) else '0' end as PackageIds,case c.IsAlacarte when 1 then cast(c.ProductId as varchar) else '0' end as ChannelIds,
	'cas_Gospel_cancell_entitlement' as Remark,GETDATE() as CommandDate,GETDATE() as CreatedOn,@UserId as CreatedBy,CASTYPEID as CASTYPE
	from #temp_pairingggs2 b left outer join #temp_trannns2 c on c.AccountId=b.AccountId
	where b.AccountId=@accountId and c.AccountId is not null

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

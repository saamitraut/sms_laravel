USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_catvision_cancell_all_entitlement]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[cas_catvision_cancell_all_entitlement] @accountId as bigint,@UserId as bigint,@CAS_STATUS as int=null 
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

	--Commpand Param (0):PO TYpe 0-To order, 1-To cancel order
	--Command Param (1): CUID CAS Code of Product
	


	insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,
	Status,Command_Param,Remark,CommandDate,CreatedOn,CreatedBy,Command,ActivationDate,DeactivationDate,PackageIds,AlacarteIds)
	select TOP 1 b.SmartcardNo as SmartCardNo,b.SmartCardId as SmartCardId,b.STBNo as STBNo,StbId as StbId,b.SubscriberId,b.AccountId as AccountId,
	'101' as CommandId,
	'Subscriber_entitle_delete' as CommandName,
	0 as Status,'101' as Command_Param,'Subscriber_entitle_delete' as Remark,getdate() as CommandDate,getdate() as CreatedOn,-1 as CreatedBy,
	SmartcardNo,getdate() as ActivationDate,c.DeactivationDate as DeactivationDate,
	case when IsAlacarte=0 then c.CasCodeCatVision else 0 end as PackageIds,
	case when IsAlacarte=1 then c.CasCodeCatVision else  0 end AS AlacarteIds
	from #temp_pairingggs2 b left outer join #temp_trannns2 c on c.AccountId=b.AccountId where b.AccountId=@accountId and c.AccountId is not null



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

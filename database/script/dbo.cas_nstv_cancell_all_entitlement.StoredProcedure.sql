USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_nstv_cancell_all_entitlement]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[cas_nstv_cancell_all_entitlement] @accountId as bigint,@UserId as bigint,@CAS_STATUS as int=null
as  
Begin

	if(OBJECT_ID('tempdb.dbo.#temp_pairings3') is not null)    
		drop table #temp_pairings3
	if(OBJECT_ID('tempdb.dbo.#temp_bouq3') is not null)    
		drop table #temp_bouq3 
	if(OBJECT_ID('tempdb.dbo.#t_assets3') is not null)    
		drop table #t_assets3
	if(OBJECT_ID('tempdb.dbo.#temp_trans3') is not null)    
		drop table #temp_trans3

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,GETDATE() as CommandDate,@UserId as CreatedBy,CASTYPEID into #temp_pairings3
	from sms_view_accounts_pairings b where Id=@accountid

	select AccountId,BouqueId,ActivationDate as ActivationDate,DeactivationDate as DeactivationDate into #temp_bouq3
	from PRP_ACCOUNTTRANSACTION where AccountId=@accountId and CASStatus=7

	select * into #t_assets3 from prp_view_Bou_pack_channel_cascode a where a.BouqueId in (Select BouqueId from #temp_bouq3)

	select a.AccountId,a.ActivationDate,a.DeactivationDate,b.* into #temp_trans3 from #temp_bouq3 a left outer join #t_assets3 b on a.BouqueId=b.BouqueId

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,  
	CreatedOn,CreatedBy,ActivationDate,DeactivationDate,PackageIds,AlacarteIds,CASTYPE,LinkIds,LinkCount)  
	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.AccountId, 'SMS_CA_DENTITLE_REQUEST',9,'','SMS_CA_DENTITLE_REQUEST',  
	GETDATE(),GETDATE(),@UserId,c.ActivationDate,c.DeactivationDate,case c.IsAlacarte when 0 then cast(c.ProductId as varchar) else '0' end as PackageIds,
	case c.IsAlacarte when 1 then cast(c.ProductId as varchar) else '0' end as ChannelIds,CASTYPEID,c.CasCodeNSTV,1   
	from #temp_pairings3 b left outer join #temp_trans3 c on b.AccountId=c.AccountId  
	where b.AccountId=@accountId and c.AccountId is not null

	if(OBJECT_ID('tempdb.dbo.#temp_pairings3') is not null)    
		drop table #temp_pairings3
	if(OBJECT_ID('tempdb.dbo.#temp_bouq3') is not null)    
		drop table #temp_bouq3 
	if(OBJECT_ID('tempdb.dbo.#t_assets3') is not null)    
		drop table #t_assets3
	if(OBJECT_ID('tempdb.dbo.#temp_trans3') is not null)    
		drop table #temp_trans3
End  
GO

USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_NSTV_hardRefresh]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc[dbo].[cas_sms_get_NSTV_hardRefresh] @AreapairingId as varchar(8000)=Null,@UserId as bigint as   
Begin  
	
	Select row_number() over (order by a.id desc) as Rid,a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId, 
	a.AccountId as AccountId,'' as AreaName,0 as AreaId,0 as AreaCasCode,@UserId as CreatedBy,CASTYPEID into #temp_pairings from sms_view_pairing a  
	left outer join dbo.Split_coma(@AreapairingId) b on a.Id=CAST(b.items as bigint) where b.items is not null  

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)	
	select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'SMS_CA_STOP_ACCOUNT_REQUEST',2,'','SMS_CA_STOP_ACCOUNT_REQUEST',  
	Getdate(),GETDATE(),@UserId,CASTYPEID from #temp_pairings

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
	select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'SMS_CA_OPEN_ACCOUNT_REQUEST',1,'','SMS_CA_OPEN_ACCOUNT_REQUEST',
	GETDATE(),GETDATE(),@UserId,CASTYPEID from #temp_pairings

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
	select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'SMS_CA_REPAIR_REQUEST',1,'','SMS_CA_REPAIR_REQUEST',
	GETDATE(),GETDATE(),@UserId,CASTYPEID from #temp_pairings

	select AccountId,BouqueId,min(ActivationDate) as ActivationDate,max(DeactivationDate) as DeactivationDate into #temp_bouq from PRP_ACCOUNTTRANSACTION where AccountId in (
	select AccountId from #temp_pairings) group by AccountId,BouqueId;

	select * into #t_assets from prp_view_Bou_pack_channel_cascode a where a.BouqueId in (Select BouqueId from #temp_bouq)

	select a.AccountId,a.ActivationDate,a.DeactivationDate,b.* into #temp_trans from #temp_bouq a left outer join #t_assets b on a.BouqueId=b.BouqueId

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,
	ActivationDate,DeactivationDate,PackageIds,AlacarteIds,CASTYPE,LinkIds,LinkCount)  
	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.Id,'SMS_CA_ENTITLE_REQUEST',9,'','d_hard_refresh',GETDATE(),GETDATE(),@UserId,
	cast(GETDATE() as date),c.DeactivationDate,case c.IsAlacarte when 0 then cast(c.ProductId as varchar) else '0' end as PackageIds,
	case c.IsAlacarte when 1 then cast(c.ProductId as varchar) else '0' end as ChannelIds,CASTYPEID,c.CasCodeNSTV,1 
	from sms_view_SubscriberAccountList b left outer join #temp_trans c on b.id=c.AccountId where b.SubscriberId is not null and c.AccountId is not null

	declare @msg as varchar(200)  

	Set @msg='Hard Refresh Done' 
	Select @msg as msg  
End 
GO

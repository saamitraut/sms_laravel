USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_Gospel_hardRefresh]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc[dbo].[cas_sms_get_Gospel_hardRefresh] @AreapairingId as varchar(8000)=Null,@UserId as bigint as   
Begin  
	
	Select row_number() over (order by a.id desc) as Rid,a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId, 
	a.AccountId as AccountId,'' as AreaName,0 as AreaId,0 as AreaCasCode,@UserId as CreatedBy,CASTYPEID into #temp_pairings from sms_view_pairing a  
	left outer join dbo.Split_coma(@AreapairingId) b on a.Id=CAST(b.items as bigint) where b.items is not null  

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
	select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'ADDinDATATBASE',1,dbo.cas_abv_formatcmd('02'+'0A'+dbo.fn_varbintostr_(LEN(dbo.cas_Gospel_convert_smartcard(SmartcardNo)+'01'+'00000000'+'01'+'00000000'+'00000000'+'0001'+'01'+'00000001'+
	dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+
	dbo.fn_getUTCHexdateTime(DATEADD(DAY,7,GETDATE())))/2,4)+dbo.cas_Gospel_convert_smartcard(SmartcardNo)+'01'+
	'00000000'+'01'+'00000000'+'00000000'+'0001'+'01'+'00000001'+dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+
	dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+dbo.fn_getUTCHexdateTime(DATEADD(Day,7,GETDATE())))
	,'d_hard_refresh',GETDATE(),GETDATE(),CreatedBy,CASTYPEID from #temp_pairings;

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
	select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'ADDSC',1,dbo.cas_abv_formatcmd(dbo.cas_Gospel_activateSmartcard(SmartcardNo,DATEADD(d,7,getdate())))
	,'d_hard_refresh',GETDATE(),GETDATE(),CreatedBy,CASTYPEID from #temp_pairings;

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
	select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'BINDSC',6,dbo.cas_abv_formatcmd(dbo.cas_Gospel_PairingSmartcard(SmartcardNo,STBNo,DATEADD(MONTH,6,getdate())))
	,'d_hard_refresh',dateadd(s,3,GETDATE()),GETDATE(),CreatedBy,CASTYPEID from #temp_pairings;


	select AccountId,BouqueId,ActivationDate as ActivationDate,DeactivationDate as DeactivationDate into #temp_bouq from PRP_ACCOUNTTRANSACTION where AccountId in (
	select AccountId from #temp_pairings);

	select * into #t_assets from prp_view_Bou_pack_channel_cascode a where a.BouqueId in (Select BouqueId from #temp_bouq)

	select a.AccountId,a.ActivationDate,a.DeactivationDate,b.* into #temp_trans from #temp_bouq a left outer join #t_assets b on a.BouqueId=b.BouqueId

	insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,Command,Status,Attempts,Command_Param,ActivationDate,
	DeactivationDate,PackageIds,AlacarteIds,Remark,CommandDate,SendedOn,CreatedOn,CreatedBy,FLAG,MSG_MAP_ID,Status_msg,CASTYPE)
	Select  b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.AccountId as AccountId,9 as CommandId,'GOSPELENTUPD' as CommandName,
	dbo.cas_abv_formatcmd(dbo.[cas_Gospel_UpdateEntitlement_multi](b.SmartcardNo,1,'0101'+right(dbo.[fn_varbintostr](c.CasCodeGospel),4)+
	dbo.fn_getUTCHexdateTime(c.ActivationDate)+dbo.fn_getUTCHexdateTime(c.DeactivationDate)+dbo.fn_varbintostr_(LEN(dbo.fn_stringtohexStr('ENTL FROM SMS'))/2,2)
	+dbo.fn_stringtohexStr('ENTL FROM SMS'))) as Command ,0 as Status,0 as Attempts,'d_hard_refresh' as CommandParam,c.ActivationDate,c.DeactivationDate,
	case c.IsAlacarte when 0 then cast(c.ProductId as varchar) else '0' end as PackageIds,
	case c.IsAlacarte when 1 then cast(c.ProductId as varchar) else '0' end as ChannelIds,'d_refresh_entitlement' as Remark,GETDATE() as CommandDate,
	GETDATE() as SendedOn,GETDATE() as CreatedOn,@UserId as CreatedBy,0 as FLAG,0 as MSG_MAP_ID,0 as Status_msg,CASTYPEID as CASTYPE
	from #temp_pairings b left outer join #temp_trans c on c.AccountId=b.AccountId
	where c.AccountId is not null

	declare @msg as varchar(200)  

	Set @msg='Hard Refresh Done' 
	Select @msg as msg  
End 
GO

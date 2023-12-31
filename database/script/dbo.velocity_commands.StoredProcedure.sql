USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[velocity_commands]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	create procedure [dbo].[velocity_commands] 
	as
	Begin
	select a.Id,b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,a.AccountId,'GOSPELENTUPD' as CommandName,9 as CommandId,
	dbo.cas_abv_formatcmd(dbo.[cas_Gospel_UpdateEntitlement_multi](b.SmartcardNo,1,
	'0101'+right(dbo.[fn_varbintostr](a.ProductId),4)+dbo.fn_getUTCHexdateTime(a.StartDate)+dbo.fn_getUTCHexdateTime(a.EndDate)+dbo.fn_varbintostr_(LEN(dbo.fn_stringtohexStr('ENTL FROM SMS'))/2,2)+dbo.fn_stringtohexStr('ENTL FROM SMS')
		)) as Command,
	'cas_Gospel_Velocity_entitlement' as Remark,
	a.StartDate as CommandDate,GETDATE() as CreatedOn,-1 as CreatedBy,a.StartDate as ActivationDate,a.EndDate as Deactivationdate
	,'0' as PacageIds,a.ProductId as AlacarteIds,1 as CasType into #Commands
	 from velocity a left join sms_view_SubscriberAccountList b on a.AccountId=b.Id
	where b.Id is not null and a.Status=0
	
	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
	CreatedOn,CreatedBy,ActivationDate,DeactivationDate,PackageIds,AlacarteIds,CASTYPE)
	Select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.AccountId,a.CommandName,a.CommandId,a.Command,a.Remark,a.CommandDate,
	a.CreatedOn,a.CreatedBy,a.ActivationDate,a.Deactivationdate,a.PacageIds,a.AlacarteIds,a.CasType
	from #Commands a
	
	Update a set a.Status=1
	from velocity a left join #Commands b on a.Id=b.Id
	where a.Status=0 and b.Id is not null
End


GO

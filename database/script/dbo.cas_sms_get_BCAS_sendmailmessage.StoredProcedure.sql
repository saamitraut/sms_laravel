USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_BCAS_sendmailmessage]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc[dbo].[cas_sms_get_BCAS_sendmailmessage] --0 to All global 1- area 2 to SC
@FpTo as tinyint=0 
,@AreapairingId as varchar(8000)=Null
,@endTime as datetime
,@startTime as datetime
,@sName as varchar(20)
,@Title as varchar(20)
,@mData as varchar(1024)
,@UserId as bigint
,@strid as bigint
as 
Begin
		Select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId,
		a.AccountId as AccountId,'' as AreaName,0 as AreaId,0 as AreaCasCode,@UserId as CreatedBy ,a.CASTYPEID
		into #temp_pairings
		from sms_view_pairing a
		left outer join dbo.Split_coma(@AreapairingId) b on a.Id=CAST(b.items as bigint)
		where b.items is not null

		
if(@FpTo=2)
Begin
		select a.*,
		'0301'+'02'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo+'15'+dbo.fn_varbintostr_(len(dbo.fn_varbintostr_(@strid,8)+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@startTime,120), '-', ''), ':', ''),' ','')+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@endTime,120), '-', ''), ':', ''),' ','')+dbo.fn_varbintostr_(len(@Title),2)+@Title+dbo.fn_varbintostr_(len(@mData),4)+@mData+dbo.fn_varbintostr_(len(@sName),2)+@sName),4)+dbo.fn_varbintostr_(@strid,8)+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@startTime,120), '-', ''), ':', ''),' ','')+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@endTime,120), '-', ''), ':', ''),' ','')+dbo.fn_varbintostr_(len(@Title),2)+@Title+dbo.fn_varbintostr_(len(@mData),4)+@mData+dbo.fn_varbintostr_(len(@sName),2)+@sName
as tcommand
	into  #t_f from #temp_pairings a
		
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE,MessageId)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.AccountId as AccountId,'SEND_EMAIL_MESSAGE' as CommandName, 0 as Status,'Send Email Message' as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy, tcommand as Command, '' as ActivationDate,'' as DeactivationDate, 0 as PackageIds,0 as AlacarteIds,b.CASTYPEID, @strid
	from #t_f b where b.SubscriberId is not null
End
else 
Begin
		select '--' as SmartCardNo,'--' as STBNo,0 as SubscriberId,0 as AccountId,5 as CASTYPEID,
		'0301'+'02'+'090009000000000'+'15'+dbo.fn_varbintostr_(len(dbo.fn_varbintostr_(@strid,8)+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@startTime,120), '-', ''), ':', ''),' ','')+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@endTime,120), '-', ''), ':', ''),' ','')+dbo.fn_varbintostr_(len(@Title),2)+@Title+dbo.fn_varbintostr_(len(@mData),4)+@mData+dbo.fn_varbintostr_(len(@sName),2)+@sName),4)+dbo.fn_varbintostr_(@strid,8)+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@startTime,120), '-', ''), ':', ''),' ','')+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@endTime,120), '-', ''), ':', ''),' ','')+dbo.fn_varbintostr_(len(@Title),2)+@Title+dbo.fn_varbintostr_(len(@mData),4)+@mData+dbo.fn_varbintostr_(len(@sName),2)+@sName
as tcommand
	into  #t_f_global
		
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE,MessageId)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.AccountId as AccountId,'SEND_EMAIL_MESSAGE_GLOBAL' as CommandName, 0 as Status,'Send Email Message' as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy, tcommand as Command, '' as ActivationDate,'' as DeactivationDate, 0 as PackageIds,0 as AlacarteIds,b.CASTYPEID, @strid
	from #t_f_global b 
End

	Select 'Email Message sent successfully' as msg
		
End
GO

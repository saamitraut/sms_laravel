USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_BCAS_flashmessage]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc[dbo].[cas_sms_get_BCAS_flashmessage]--x01
@FpTo as tinyint=0 ,@AreapairingId as varchar(8000)=Null
,@expiryTime as datetime
,@startTime as datetime
,@OSD_Duration int
,@OSD_Repitition int 
,@fcolor as char(1)
,@bgcolor as char(1)
,@OSD_Data as varchar(255)
,@channelId as varchar(8000)=null
,@UserId as bigint
,@scrolltype  as char(1)
,@strid as bigint
,@CancelOSD as char(1)='0'
as 
Begin
	
	Declare @messageId as bigint

	if(@FpTo=2)
	begin	
		Select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId,a.AccountId as AccountId,'' as AreaName,0 as AreaId,
		0 as AreaCasCode,@UserId as CreatedBy,CASTYPEID into #temp_pairings
		from sms_view_pairing a
		left outer join dbo.Split_coma(@AreapairingId) b on a.Id=CAST(b.items as bigint)
		where b.items is not null
	end
	
	if(@CancelOSD=1)
	Begin
	select top 1 @messageId=isnull(MessageId,0) from SMS_BCAS_CMDS where CommandName='SEND_OSD' order by id desc
	End

		if(@FpTo=2)
Begin
	--Channel Count is set to 0
	select a.*,case when @CancelOSD='0' then 
'0302'+'02'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo+'16'+dbo.fn_varbintostr_((73+len(@OSD_Data)),4)+dbo.fn_varbintostr_(@strid,8)+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@startTime,120), '-', ''), ':', ''),' ','')+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@expiryTime,120), '-', ''), ':', ''),' ','')+REPLACE(convert(varchar(5),@startTime,108),':','')+dbo.fn_varbintostr_(@OSD_Duration,4)+dbo.fn_varbintostr_(@OSD_Repitition,4)+'0000'+@scrolltype+dbo.fn_varbintostr_(@fcolor,2)+dbo.fn_varbintostr_(@bgcolor,2)+dbo.fn_varbintostr_(len(@OSD_Data),4)+@OSD_Data
else '0303'+'01'+'170008'+dbo.fn_varbintostr_(@messageId,8) end as tcommand
	into  #t_f from #temp_pairings a
		
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE,MessageID)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.AccountId as AccountId,case when @CancelOSD='0' then 'SEND_OSD' else 'CANCEL_OSD' end as CommandName, 0 as Status,case when @CancelOSD='0' then 'Send OSD' else 'Cancel OSD' end as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy, tcommand as Command, '' as ActivationDate,'' as DeactivationDate, 0 as PackageIds,0 as AlacarteIds,b.CASTYPEID	,@strid
	from #t_f b where b.SubscriberId is not null
End
else 
Begin
select '--' as SmartcardNo,'--' as STBNo,0 as SubscriberId,0 as AccountId,5 as CASTYPEID,case when @CancelOSD='0' then 
'0302'+'02'+'090009000000000'+'16'+dbo.fn_varbintostr_((73+len(@OSD_Data)),4)+dbo.fn_varbintostr_(@strid,8)+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@startTime,120), '-', ''), ':', ''),' ','')+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@expiryTime,120), '-', ''), ':', ''),' ','')+REPLACE(convert(varchar(5),@startTime,108),':','')+dbo.fn_varbintostr_(@OSD_Duration,4)+dbo.fn_varbintostr_(@OSD_Repitition,4)+'0000'+@scrolltype+dbo.fn_varbintostr_(@fcolor,2)+dbo.fn_varbintostr_(@bgcolor,2)+dbo.fn_varbintostr_(len(@OSD_Data),4)+@OSD_Data
else '0303'+'01'+'170008'+dbo.fn_varbintostr_(@messageId,8) end as tcommand
	into  #t_f_global 
		
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE,MessageID)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.AccountId as AccountId,case when @CancelOSD='0' then 'SEND_OSD_GLOBAL' else 'CANCEL_OSD_GLOBAL' end as CommandName, 0 as Status,case when @CancelOSD='0' then 'Send OSD' else 'Cancel OSD' end as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy, tcommand as Command, '' as ActivationDate,'' as DeactivationDate, 0 as PackageIds,0 as AlacarteIds,b.CASTYPEID	,@strid
	from #t_f_global b 
End	
	
	Select 'Flashmessage sent successfully' as msg
	
	
End
GO

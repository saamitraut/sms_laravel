USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_BCAS_mailmessage]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc[dbo].[cas_sms_get_BCAS_mailmessage] --0 to All global 1- area 2 to SC
@FpTo as tinyint=0 
,@AreapairingId as varchar(8000)=Null
,@endTime as datetime
,@postype as char(1)='0'
,@x_axis as int=400
,@y_axis as int=300
,@duration as int
,@fcolor as char(6)
,@bgcolor as char(6)
,@UserId as bigint
,@f_size as int=255
,@force as char(1)
,@reference as char(1)
,@layout as char(1)
,@strid as bigint
,@CancelMsg as char(1)
,@message as varchar(500)
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
		select a.*,case when @CancelMsg='0' then 
'0309'+'02'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo+'1C'+dbo.fn_varbintostr_((57+len(@message)),4)+@force+REPLACE(REPLACE(REPLACE(convert(varchar(19),@endTime,120), '-', ''), ':', ''),' ','')+dbo.fn_varbintostr_(@duration,4)+dbo.fn_varbintostr_(@f_size,2)+@layout+@reference+'FFFFFFFF'+case when @postype=1 then 'FFFF' else dbo.fn_varbintostr_(@x_axis,4) end+case when @postype=1 then 'FFFF' else dbo.fn_varbintostr_(@y_axis,4) end+@fcolor+@bgcolor+'00'+dbo.fn_varbintostr_(len(@message),4)+@message
else '030A'+'01'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo end as tcommand
	into  #t_f from #temp_pairings a
		
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.AccountId as AccountId,case when @CancelMsg='0' then 'SEND_MESSAGE' else 'CANCEL_MESSAGE' end as CommandName, 0 as Status,case when @CancelMsg='0' then 'Send Message' else 'Cancel Message' end as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy, tcommand as Command, '' as ActivationDate,'' as DeactivationDate, 0 as PackageIds,0 as AlacarteIds,b.CASTYPEID	
	from #t_f b where b.SubscriberId is not null
End
else 
Begin
		select '--' as SmartCardNo,'--' as STBNo,0 as SubscriberId,0 as AccountId,5 as CASTYPEID,case when @CancelMsg='0' then 
'0309'+'02'+'0C0002FF'+'1C'+dbo.fn_varbintostr_((57+len(@message)),4)+@force+REPLACE(REPLACE(REPLACE(convert(varchar(19),@endTime,120), '-', ''), ':', ''),' ','')+dbo.fn_varbintostr_(@duration,4)+dbo.fn_varbintostr_(@f_size,2)+@layout+@reference+'FFFFFFFF'+case when @postype=1 then 'FFFF' else dbo.fn_varbintostr_(@x_axis,4) end+case when @postype=1 then 'FFFF' else dbo.fn_varbintostr_(@y_axis,4) end+@fcolor+@bgcolor+'00'+dbo.fn_varbintostr_(len(@message),4)+@message
else '030A'+'01'+'0C0002FF' end as tcommand
	into  #t_f_global 
		
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.AccountId as AccountId,case when @CancelMsg='0' then 'SEND_MESSAGE_GLOBAL' else 'CANCEL_MESSAGE_GLOBAL' end as CommandName, 0 as Status,case when @CancelMsg='0' then 'Send Message' else 'Cancel Message' end as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy, tcommand as Command, '' as ActivationDate,'' as DeactivationDate, 0 as PackageIds,0 as AlacarteIds,b.CASTYPEID	
	from #t_f_global b 

End	

	Select 'Message sent successfully' as msg
		
End

GO

USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_BCAS_fingerprint]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc[dbo].[cas_sms_get_BCAS_fingerprint] --0 to All global 1- area 2 to SC
@FpTo as tinyint=0 
,@AreapairingId as varchar(8000)=Null
,@startTime as datetime
,@postype as char(1)='0'
,@x_axis as int=400
,@y_axis as int=300
,@duration as int
,@repitition as int
,@period as int
,@fcolor as char(6)
,@bgcolor as char(6)
,@channelId as varchar(8000)
,@UserId as bigint
,@Encrypted as char(1)
,@flash as char(1)
,@showtype as char(1)
,@showitem as char(1)
,@f_size as int=255
,@force as char(1)
,@reference as char(1)
,@layout as char(1)
,@strid as bigint
,@CancelFP as char(1)
as 
Begin
	Select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId,a.AccountId as AccountId,'' as AreaName,0 as AreaId,0 as AreaCasCode,@UserId as CreatedBy ,a.CASTYPEID
	into #temp_pairings	from sms_view_pairing a left outer join dbo.Split_coma(@AreapairingId) b on a.Id=CAST(b.items as bigint)
	where b.items is not null
	
	Declare @channelcascode as char(4)
	if(@channelId is not null or @channelId!='')
	Begin
		Select @channelcascode=dbo.fn_varbintostr_(CasCodeBCas,4) 
		from SMS_CHANNEL a left outer join (Select * from dbo.Split_coma(@channelId)) b on a.Id=CAST(b.items as bigint)
		where b.items is not null
	end
		
--59180100 0088 0000000E 0305 03
--14 000E 2018 08 01 000000 07000800000001 1A 004A 13000800000001 1 0 0 0 000A 100A 0005 16 0 0 FFFF FFFF FFFF FFFF 000000 FFFFFF 00 0 0005 HELLO 00000000
if(@FpTo=2)
Begin
	select a.*,case when @CancelFP='0' then 
'0305'+'03'+'14000E'+REPLACE(REPLACE(REPLACE(convert(varchar(19),@startTime,120), '-', ''), ':', ''),' ','')+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo +'1A004A'+'130008'+dbo.fn_varbintostr_(@strid,8)+@showtype+@Encrypted+@force+@flash+dbo.fn_varbintostr_(@duration,4)+dbo.fn_varbintostr_(@repitition,4)+dbo.fn_varbintostr_(@period,4)+dbo.fn_varbintostr_(@f_size,2)+@layout+@reference+'FFFFFFFF'+case when @postype=1 then 'FFFF' else dbo.fn_varbintostr_(@x_axis,4) end+case when @postype=1 then 'FFFF' else dbo.fn_varbintostr_(@y_axis,4) end+@fcolor+@bgcolor+'00'+@showitem+'0000' 
else '0306'+'01'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo end as tcommand
	into  #t_f from #temp_pairings a
		
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.AccountId as AccountId,case when @CancelFP='0' then 'SEND_FINGERPRINT' else 'CANCEL_FINGERPRINT' end as CommandName, 0 as Status,case when @CancelFP='0' then 'Send FP' else 'Cancel FP' end as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy, tcommand as Command, '' as ActivationDate,'' as DeactivationDate, 0 as PackageIds,0 as AlacarteIds,b.CASTYPEID	
	from #t_f b where b.SubscriberId is not null
End
else --Global FP
Begin
select '--' as SmartCardNo,'--' as STBNo,0 as SubscriberId,0 as AccountId,'' as ActivationDate,'' as DeactivationDate, 0 as PackageIds,0 as AlacarteIds,5 as CASTYPEID, 
case when @CancelFP='0' and @channelId='' then '0305'+'02'+'0C0002FF'+'1A004A'+'130008'+dbo.fn_varbintostr_(@strid,8)+@showtype+@Encrypted+@force+@flash+dbo.fn_varbintostr_(@duration,4)+dbo.fn_varbintostr_(@repitition,4)+dbo.fn_varbintostr_(@period,4)+dbo.fn_varbintostr_(@f_size,2)+@layout+@reference+'FFFFFFFF'+case when @postype=1 then 'FFFF' else dbo.fn_varbintostr_(@x_axis,4) end+case when @postype=1 then 'FFFF' else dbo.fn_varbintostr_(@y_axis,4) end+@fcolor+@bgcolor+'00'+@showitem+'0000' 
else case when @CancelFP!='0' and @channelId='' then '0306'+'01'+'0C0002FF' 
else case when @CancelFP='0' and @channelId!='' then '0307'+'02'+'1D0004'+@channelcascode+'1B0039'+@showtype+@Encrypted+@force+@flash+REPLACE(REPLACE(REPLACE(convert(varchar(19),@startTime,120), '-', ''), ':', ''),' ','')+dbo.fn_varbintostr_(@f_size,2)+@layout+@reference+'FFFFFFFF'+case when @postype=1 then 'FFFF' else dbo.fn_varbintostr_(@x_axis,4) end+case when @postype=1 then 'FFFF' else dbo.fn_varbintostr_(@y_axis,4) end+@fcolor+@bgcolor+'00'+@showitem+'0000' 
else case when @CancelFP!='0' and @channelId!='' then '0308'+'01'+'1D0004'+@channelcascode end 
end end end as tcommand
	into  #t_f_global
		
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.AccountId as AccountId,
	case when @CancelFP='0' and @channelId='' then 'SEND_FINGERPRINT_GLOBAL' 
	else case when @CancelFP!='0' and @channelId='' then 'CANCEL_FINGERPRINT_GLOBAL' 
	else case when @CancelFP='0' and @channelId!='' then 'SEND_FINGERPRINT_GLOBAL_CHANNEL' 
	else case when @CancelFP!='0' and @channelId!='' then 'CANCEL_FINGERPRINT_GLOBAL_CHANNEL' end end end end	
	as CommandName, 0 as Status,case when @CancelFP='0' then 'Send FP' else 'Cancel FP' end as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy, tcommand as Command, '' as ActivationDate,'' as DeactivationDate, 0 as PackageIds,@channelId as AlacarteIds,b.CASTYPEID	
	from #t_f_global b where b.SubscriberId is not null
End	

	Select 'Fingerprint sent successfully' as msg
		
End

GO

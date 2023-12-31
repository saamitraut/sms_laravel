USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[catvison_mailmessage]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc[dbo].[catvison_mailmessage]--x01
@AreapairingId as varchar(8000)=Null,
@OSD_Data as varchar(255),
@UserId as bigint

as 
Begin
	
declare @acc as bigint

Select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId,a.AccountId as AccountId,'' as AreaName,0 as AreaId,
0 as AreaCasCode,@UserId as CreatedBy,@OSD_Data as osd_data into #temp_pairings
from sms_view_pairing a
left outer join dbo.Split_coma(@AreapairingId) b on a.AccountId=CAST(b.items as bigint)
where b.items is not null and a.CASTYPEID=4

while exists(select * from #temp_pairings)
BEGIN

select top 1 @acc=AccountId from #temp_pairings;

insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,
Status,Command_Param,Remark,CommandDate,CreatedOn,CreatedBy,Command,message)
select SmartcardNo as SmartCardNo,SmartCardId as SmartCardId,STBNo as STBNo,StbId as StbId,SubscriberId,AccountId,'103' as CommandId,
'SendMail' as CommandName,0 as Status,'103' as Command_Param,'SendMail' as Remark,getdate() as CommandDate,getdate() as CreatedOn
,CreatedBy,SmartcardNo as Command,osd_data
from #temp_pairings where AccountId=@acc

Delete from #temp_pairings where AccountId=@acc;

END

	--select @msg='OSD Message Sent Succesfully!';

End
GO

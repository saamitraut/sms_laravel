USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[ecm_catvision_fingerprint]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc[dbo].[ecm_catvision_fingerprint]--x01
@AreapairingId as varchar(8000)=Null,
@flag as varchar(250),
@displayType as varchar(250),
@direction as varchar(250),
@length as varchar(250),
@transparency as varchar(250),
@Position as varchar(250),
@fcolor as varchar(250),
@bgcolor as varchar(250),
@unittime as varchar(250),
@pertime as varchar(250),
@tottaltime as varchar(250),
@Fsize as varchar(250),
@coordinate1 as varchar(250),
@coordinate2 as varchar(250),
@coordinate3 as varchar(250),
@coordinate4 as varchar(250),
@UserId as bigint,
@ChannelId as bigint

as 
Begin

declare @msg as varchar(500)
declare @acc as bigint

Select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId,a.AccountId as AccountId,'' as AreaName,0 as AreaId,
0 as AreaCasCode,@UserId as CreatedBy,@flag as flag,@displayType as Type,@direction as direction,@length as length,@transparency as transparency,
@Position as position,@fcolor as fcolor,@bgcolor as bgcolor,@unittime as unittime,@pertime as pertime,@tottaltime as totaltime,@Fsize as fsize,
@coordinate1 as co1,@coordinate2 as co2,@coordinate3 as co3,@coordinate4 as co4 into #temp_pairings
from sms_view_pairing a
left outer join dbo.Split_coma(@AreapairingId) b on a.Id=CAST(b.items as bigint)
where b.items is not null and a.CASTYPEID=4

DECLARE @ProgramNo as varchar(50)
select @ProgramNo=TSID from SMS_CHANNEL where Id=@ChannelId;

while exists(select * from #temp_pairings)
BEGIN

select top 1 @acc=AccountId from #temp_pairings;

insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,
Status,Command_Param,Remark,CommandDate,CreatedOn,CreatedBy,Command,FLAG,displayType,direction,length,transparency,Position,fcolor,bgcolor,unittime,pertime,tottaltime
,Fsize,coordinate1,coordinate2,coordinate3,coordinate4,serviceid)
select SmartcardNo as SmartCardNo,SmartCardId as SmartCardId,STBNo as STBNo,StbId as StbId,SubscriberId,AccountId,'103' as CommandId,
'SendFingerPrintByCard' as CommandName,0 as Status,'103' as Command_Param,'SendFingerPrintByCard' as Remark,getdate() as CommandDate,getdate() as CreatedOn
,CreatedBy,SmartcardNo as Command,flag,Type,direction,length,transparency,position,fcolor,bgcolor,unittime,pertime,totaltime,fsize,co1,co2,co3,co4,@ProgramNo
from #temp_pairings where AccountId=@acc

Delete from #temp_pairings where AccountId=@acc;


END





End


GO

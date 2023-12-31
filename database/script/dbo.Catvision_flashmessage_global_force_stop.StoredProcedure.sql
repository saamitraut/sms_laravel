USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[Catvision_flashmessage_global_force_stop]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc[dbo].[Catvision_flashmessage_global_force_stop]--x01
@Position as varchar(250),
@Duration as varchar(250),
@Fsize as varchar(250),
@fcolor as varchar(250),
@bgcolor as varchar(250),
@OSD_Data as varchar(255),
@UserId as bigint

as 
Begin
	
Select 0 as SmartcardNo,0 as SmartCardId,0 as STBNo,0 as StbId,0 as SubscriberId,0 as PairingId,0 as AccountId,'' as AreaName,0 as AreaId,
0 as AreaCasCode,@UserId as CreatedBy,@Position as position,@Duration as duration,@Fsize as fsize,@fcolor as fcolor,@bgcolor as bgcolor
,@OSD_Data as osd_data,127 as areacode into #temp_pairings

insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,
Status,Command_Param,Remark,CommandDate,CreatedOn,CreatedBy,Command,Position,tottaltime,Fsize,fcolor,bgcolor,message,areacode)
select SmartcardNo as SmartCardNo,SmartCardId as SmartCardId,STBNo as STBNo,StbId as StbId,SubscriberId,AccountId,'103' as CommandId,
'StopForcedOsd' as CommandName,0 as Status,'103' as Command_Param,'StopForcedOsd' as Remark,getdate() as CommandDate,getdate() as CreatedOn
,CreatedBy,'' as Command,position,duration,fsize,fcolor,bgcolor,osd_data,areacode
from #temp_pairings 

Delete from #temp_pairings 

END

GO

USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[catvision_fingerprint_global_stop]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc[dbo].[catvision_fingerprint_global_stop]--x01
@flag as varchar(50),
@displayType as varchar(50),
@direction as varchar(50),
@length as varchar(50),
@transparency as varchar(50),
@Position as varchar(50),
@fcolor as varchar(50),
@bgcolor as varchar(50),
@unittime as varchar(50),
@pertime as varchar(50),
@tottaltime as varchar(50),
@Fsize as varchar(50),
@coordinate1 as varchar(50),
@coordinate2 as varchar(50),
@coordinate3 as varchar(50),
@coordinate4 as varchar(50),
@UserId as bigint

as 
Begin

Select 0 as SmartcardNo,0 as SmartCardId,0 as STBNo,0 as StbId,0 as SubscriberId,0 as PairingId,0 as AccountId,'' as AreaName,0 as AreaId,
'127' as AreaCasCode,@UserId as CreatedBy,@flag as flag,@displayType as Type,@direction as direction,@length as length,@transparency as transparency,
@Position as position,@fcolor as fcolor,@bgcolor as bgcolor,@unittime as unittime,@pertime as pertime,@tottaltime as totaltime,@Fsize as fsize,
@coordinate1 as co1,@coordinate2 as co2,@coordinate3 as co3,@coordinate4 as co4,1 as areacode,0 as serviceid into #temp_pairings

insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,
Status,Command_Param,Remark,CommandDate,CreatedOn,CreatedBy,Command,FLAG,displayType,direction,length,transparency,Position,fcolor,bgcolor,unittime,pertime,tottaltime
,Fsize,coordinate1,coordinate2,coordinate3,coordinate4,areacode,serviceid)
select SmartcardNo as SmartCardNo,SmartCardId as SmartCardId,STBNo as STBNo,StbId as StbId,SubscriberId,AccountId,'103' as CommandId,
'StopGlobalFp' as CommandName,0 as Status,'103' as Command_Param,'StopGlobalFp' as Remark,getdate() as CommandDate,getdate() as CreatedOn
,CreatedBy,'60084707' as Command,flag,Type,direction,length,transparency,position,fcolor,bgcolor,unittime,pertime,totaltime,fsize,co1,co2,co3,co4,areacode,serviceid
from #temp_pairings 

Delete from #temp_pairings


END








GO

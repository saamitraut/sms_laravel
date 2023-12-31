USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_cas_message_log]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_cas_message_log] as 
Select m.Id, m.cmdName as CommandName,c.STBNo,c.SmartCardNo,c.Command,c.Response,
case when c.Status=0 then 'Pending' else 'Complete' end as Status,c.CommandDate as ScheduleDate,
c.CreatedOn as SendOn,c.CASTYPE
from SMS_CASMSG m left join SMS_CAS_CMDS c on m.Id=c.MSG_MAP_ID
where c.MSG_MAP_ID>0
GO

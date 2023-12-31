USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_cas_command_log]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_cas_command_log] as 
Select c.Id, c.CommandName as CommandName,c.STBNo,c.SmartCardNo,c.Command,c.Response,
case when c.Status=0 then 'Pending' else 'Complete' end as Status,CONVERT(VARCHAR(10),c.CommandDate,120) as ScheduleDate,
c.CreatedOn as SendOn,c.SubscriberId,c.AccountId,s.CustomerId,s.SubscriberName
from  SMS_CAS_CMDS c left join sms_view_subscribers s on s.Id=c.SubscriberId
where c.MSG_MAP_ID=0
GO

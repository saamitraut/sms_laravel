USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_cascommand_log]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_cascommand_log] As
select a.Id, a.SmartCardNo,a.STBNo,a.CommandName,a.Command,case when a.Status=0 then 'Pending' else 'Send' end as Status,
case when a.Response is null then 'Waiting..' else a.Response end as Response,
convert(varchar(10),a.CreatedOn,120) as AddedOn,b.NAME as AddedBy
from SMS_CAS_CMDS a left join SMS_ACCESS b on a.CreatedBy=b.ID
GO

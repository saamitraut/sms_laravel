USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_cascmd_log]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_cascmd_log]
as  
    select isnull(b.Description,'Unknown response') as 'ResponseMessage',a.* from SMS_CAS_CMDS a
  left outer join SMS_CAS_ABVERRORCODES b on
   ltrim(rtrim(right(ltrim(rtrim(isnull(cast(a.Response as varchar(8000)),'-1'))),2)))=b.Errorcode
GO

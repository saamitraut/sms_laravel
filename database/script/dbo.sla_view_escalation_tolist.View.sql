USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_escalation_tolist]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_escalation_tolist] as
Select a.*,b.NAME as UserName,b.LOGINID,b.Mobile,b.Email,b.DesignationId,b.Designation from SLA_ESCALATEDTO a
left outer join sla_view_userlist b on a.UserId=b.Id
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_callog_escalation]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_callog_escalation] as
Select a.*,b.Designation,b.DesignationCode,b.ParentId,b.PDesignationCode,b.PDesignation ,case when c.Id is null then 
'SLA-Admin' else c.Designation+'-'+c.LOGINID end as ForwardedBy
,EscalatedToId=cast(substring 
                          ((SELECT     (',' + cast(t2.UserId as varchar))
                              FROM         sla_view_escalation_tolist t2
                              WHERE     t2.EscalationId = a.Id
                              ORDER BY t2.id FOR XML PATH('')),2,8000) as text) 
,EscalatedTo=cast(b.Designation+'-'+substring 
                          ((SELECT     (',' + cast(t2.Loginid as varchar))
                              FROM         sla_view_escalation_tolist t2
                              WHERE     t2.EscalationId = a.Id
                              ORDER BY t2.id FOR XML PATH('')),2,8000) as text)                               
from SLA_ESCALATIONS a
left outer join sla_view_userdesignation b on a.DesignationId=b.id
left outer join sla_view_userlist c on a.CreatedBy=c.AccessId
GO

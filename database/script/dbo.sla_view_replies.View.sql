USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_replies]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_replies] as 
select a.*,dbo.getUserLoginId(a.EnteredFrom,a.CreatedBy) as RepliedBy from SLA_COMPLAINTREPLY a
GO

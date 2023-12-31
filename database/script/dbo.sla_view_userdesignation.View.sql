USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_userdesignation]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_userdesignation] as
select a.*,isnull(b.DesignationCode,'No Parent') as PDesignationCode,isnull(b.Designation,'No Parent') as PDesignation from SLA_USERDESIGNATION  a
left outer join SLA_USERDESIGNATION b on a.ParentId=b.Id
GO

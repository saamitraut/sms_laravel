USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_acess_list]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_acess_list] as
select a.*,isnull(b.Mobile,c.Mobile) as Mobile,isnull(b.Email,c.Email) as Email
,isnull(b.DesignationId,c.DesignationId) as DesignationId 
,isnull(b.Designation,c.Designation) as Designation,ISNULL(b.Id,ISNULL(c.Id,0))  as UEId
 from SLA_ACCESS a
left outer join [sla_view_userlist] b on a.OperatorID=b.Id and a.USERTYPE='User'
left outer join [sla_view_engineerlist] c on a.OperatorID=c.Id and a.USERTYPE='Engineer' 
--where ISNULL(b.Id,c.Id) is not null
GO

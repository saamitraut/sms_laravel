USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_engineerlist]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_engineerlist] as 
Select a.Id,a.NAME,a.Mobile,a.Email,a.PhoneNo,a.DesignationId,a.Description,a.Status,a.CREATEDON,a.UPDATEDON,
a.CREATEDBY,a.UPDATEDBY,a.Remark,a.Deleted,a.sla_id
,d.Designation,b.LOGINID,b.PASSWORD   ,b.ID as AccessId
from SLA_ENGINEER_DETAILS a 
left outer join SLA_ACCESS b on a.Id=b.OperatorId and b.USERTYPE='Engineer'
left outer join SLA_ENGINEER_DESIGNATION d on d.ID=a.Designationid
GO

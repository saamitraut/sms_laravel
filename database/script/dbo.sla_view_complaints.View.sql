USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_complaints]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sla_view_complaints] as 
Select a.*,d.CalltypeId,
a.CREATEDON as OpenedOn,dbo.getUserLoginId(a.EnteredFrom,a.CreatedBy) as OpenedBy,
d.Title  as SubCallType,d.Code as SubCallTypeCode,d.CallTypeTitle as CallType,d.CallTypeCode as CallTypeCode
from SLA_COMPLAINT a 
left join sla_view_calltypelist d on a.SubCallId=d.Id
GO

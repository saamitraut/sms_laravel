USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_complaintengineer]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_complaintengineer] as
select a.*,b.NAME as Enginner,b.Mobile,b.Email,b.PhoneNo,b.DesignationId,b.Designation
from SLA_COMPLAINTENGINEER a
left outer join sla_view_engineerlist b on a.EngineerId=b.Id
GO

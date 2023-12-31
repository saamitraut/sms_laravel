USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_calltypelist]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_calltypelist] as 
Select c.*,m.Code as CallTypeCode,m.Title as CallTypeTitle
from SLA_SUBCALLTYPE c  
left join SLA_CALLTYPE_MASTER m on m.ID=c.CalltypeId
GO

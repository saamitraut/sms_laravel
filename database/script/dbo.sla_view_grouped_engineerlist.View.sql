USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_grouped_engineerlist]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_grouped_engineerlist] as
Select top 100 percent ROW_NUMBER()over (order by DesignationId,Id,Name) as Rid,* from
(
	Select -1 as Id,a.Designation+' ('+CAST(Count(b.Id) as varchar)+')' as Name,a.Id as DesignationId	
from SLA_ENGINEER_DESIGNATION a
left outer join SLA_ENGINEER_DETAILS b on a.ID=b.DesignationId
group by a.Id,a.Designation having COUNT(b.Id)>0
	union
	Select a.ID as id,a.Name,a.DesignationId   from SLA_ENGINEER_DETAILS a
) x order by DesignationId,Id,Name
GO

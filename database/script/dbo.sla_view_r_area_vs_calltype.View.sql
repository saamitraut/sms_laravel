USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_r_area_vs_calltype]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_r_area_vs_calltype] as
SELECT Row_number()over(order by AreaName,Areaid) as Id,Areaid,AreaName, isnull([OREQUEST],0) as [OREQUEST],isnull([CREQUEST],0) as [CREQUEST],isnull([OComplaint],0) as [OComplaint],isnull([CComplaint],0) as [CComplaint],isnull([OQuery ],0) as [OQuery ],isnull([CQuery],0) as [CQuery],isnull([OInstallation],0) as [OInstallation],isnull([CInstallation],0) as [CInstallation],isnull([OWebQuery],0) as [OWebQuery],isnull([CWebQuery],0) as [CWebQuery]
FROM
(SELECT Cnt,CallType,Areaid,AreaName,State,CalltypeId FROM sla_view_r_areascalltype) AS SourceTable
PIVOT
(sum(Cnt) FOR State IN ( [OREQUEST],[CREQUEST],[OComplaint],[CComplaint],[OQuery] ,[CQuery],[OInstallation],[CInstallation],[OWebQuery],[CWebQuery])
) AS PivotTable
GO

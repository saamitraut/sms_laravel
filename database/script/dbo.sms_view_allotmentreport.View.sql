USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_allotmentreport]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_allotmentreport] as
SELECT AreaId as Id,AreaCode,ActionDate, [SDACTIVE], [HDACTIVE],[SDINACTIVE], [HDINACTIVE]
FROM
(SELECT AreaId,AreaCode,BoxType,BOXAccStatus,ActionDate ,AccountId FROM [sms_view_areawisestbcount]) AS SourceTable
PIVOT
(count(AccountId) FOR BOXAccStatus IN ([SDACTIVE], [HDACTIVE],[SDINACTIVE], [HDINACTIVE])
) AS PivotTable
GO

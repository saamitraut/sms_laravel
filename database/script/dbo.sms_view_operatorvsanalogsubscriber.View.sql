USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_operatorvsanalogsubscriber]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_operatorvsanalogsubscriber] as
SELECT Operator,Operatorid as ID,isnull([MActive],0) as [MActive],isnull([EActive],0) as [EActive],isnull([MInActive],0)as [MInActive],
isnull([EInActive],0) as [EInActive]
FROM
(SELECT Id,Operator,Operatorid,State FROM [sms_view_area_subscriberstatus_analog]) AS SourceTable
PIVOT
(count(Id) FOR State IN ( [MActive],[EActive],[MInActive],[EInActive])
) AS PivotTable
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_connection_status]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_connection_status] as 
SELECT AreaName,AreaId as ID,Actiondate, isnull([MSDNewConnection],0) as [MSDNewConnection] ,isnull([ESDNewConnection],0) as [ESDNewConnection] ,isnull([MHDNewConnection],0) as [MHDNewConnection] ,isnull([EHDNewConnection],0) as [EHDNewConnection] ,isnull([MHDDeactivation],0) as [MHDDeactivation] ,isnull([EHDDeactivation],0) as [EHDDeactivation] ,isnull([MSDDeactivation],0) as [MSDDeactivation] ,isnull([ESDDeactivation],0) as [ESDDeactivation] ,isnull([MSDActivated],0) as [MSDActivated] ,isnull([ESDActivated],0) as [ESDActivated] ,isnull([MHDActivated],0) as [MHDActivated] ,isnull([EHDActivated],0) as [EHDActivated] ,isnull([MSDDisconnected],0) as [MSDDisconnected] ,isnull([ESDDisconnected],0) as [ESDDisconnected] ,isnull([MHDDisconnected],0) as [MHDDisconnected] ,isnull([EHDDisconnected],0) as [EHDDisconnected] 
FROM
(SELECT AccountId,AreaName,AreaId,BoxType,Actions,Actiondate FROM sms_view_connection) AS SourceTable
PIVOT
(count(AccountId) FOR Actions IN ([MSDNewConnection],[ESDNewConnection],[MHDNewConnection],[EHDNewConnection],[MHDDeactivation],[EHDDeactivation],[MSDDeactivation],[ESDDeactivation],[MSDActivated],[ESDActivated],[MHDActivated],[EHDActivated],[MSDDisconnected],[ESDDisconnected],[MHDDisconnected],[EHDDisconnected])
) AS PivotTable
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_connection_analog_status]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_connection_analog_status] as 
SELECT AreaName,AreaId as ID,Actiondate, [MNewInstallation],[ENewInstallation],[MReconnection],[EReconnection]  ,
[MDeactivation],[EDeactivation],[MDisconnection],[EDisconnection]
FROM
(SELECT AccountId,AreaName,AreaId,Actions,Actiondate FROM sms_view_analog_connection) AS SourceTable
PIVOT
(count(AccountId) FOR Actions IN ( [MNewInstallation],[ENewInstallation],[MReconnection],[EReconnection]  ,
[MDeactivation],[EDeactivation],[MDisconnection],[EDisconnection])
) AS PivotTable
GO

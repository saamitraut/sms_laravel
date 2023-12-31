USE [MNSMS]
GO
/****** Object:  View [dbo].[v_PendingCommandsCatVision]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_PendingCommandsCatVision]
AS
SELECT TOP (100) PERCENT  CASE WHEN PackageIds=0 THEN AlacarteIds ELSE PackageIds END AS ProductId,CommandName as Command_Name,*
FROM dbo.SMS_CATVISION_CMDS nolock
WHERE id>84801 and (Status = 0) AND (Attempts <2 )and  (ActivationDate is null or ActivationDate<=cast(GETDATE() as date))
ORDER BY id DESC
GO

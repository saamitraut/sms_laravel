USE [MNSMS]
GO
/****** Object:  View [dbo].[v_BCASPendingCommands]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[v_BCASPendingCommands] AS
SELECT TOP (100) PERCENT Id AS id, CommandName AS command_name, Command AS command FROM dbo.SMS_BCAS_CMDS nolock
WHERE ((Status=0) or (Attempts=0)) AND (CommandDate IS NULL OR CommandDate <= GETDATE()) and CASTYPE=5 ORDER BY id ASC
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[v_GospelPendingCommands]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_GospelPendingCommands] AS
SELECT TOP (100) PERCENT Id AS id, CommandName AS command_name, Command AS command FROM dbo.SMS_CAS_CMDS nolock
WHERE ((Status=0) or (Attempts=0)) AND (CommandDate IS NULL OR CommandDate <= GETDATE()) and CASTYPE!=6 ORDER BY id ASC
GO

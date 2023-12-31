USE [MNSMS]
GO
/****** Object:  View [dbo].[v_TelelynxPendingCommands]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[v_TelelynxPendingCommands] AS
SELECT TOP (100) PERCENT Id AS id, CommandName AS command_name, SmartcardNo,STBNO, ActivationDate,DeactivationDate,StartTime,ExpiryTime,Command_Param
FROM dbo.TELELYNX_CAS_CMDS WHERE Status = 0 and CommandName<>'OpenCASInterfaceSocket' ORDER BY id 
GO

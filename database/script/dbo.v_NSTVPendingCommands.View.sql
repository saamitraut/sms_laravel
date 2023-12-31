USE [MNSMS]
GO
/****** Object:  View [dbo].[v_NSTVPendingCommands]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_NSTVPendingCommands] AS
SELECT TOP (100) PERCENT Id AS id, CommandName AS command_name, Command AS command,SmartCardNo,
dbo.[fn_varbintostr_](DATEDIFF(ss,'1970-01-01 00:00:00',convert(varchar(20),ActivationDate,120))+(DATEDIFF(ss,GetDate(),GetUTCDate())-9000),8) as ActivationDate,
dbo.[fn_varbintostr_](DATEDIFF(ss,'1970-01-01 00:00:00',convert(varchar(20),dateadd(D,0,DeactivationDate),120))+    
(DATEDIFF(ss,GetDate(),GetUTCDate())-9000),8) as DeactivationDate ,PackageIds ,AlacarteIds,LinkCount,LinkIds,STBNo,Command_Param FROM dbo.SMS_CAS_CMDS 
WHERE ((Status=0) AND (Attempts=0)) AND (CommandDate IS NULL OR CommandDate <= GETDATE()) and CASTYPE='6' and SmartCardNo not like '10001000%' ORDER BY id DESC
GO

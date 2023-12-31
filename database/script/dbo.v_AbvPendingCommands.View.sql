USE [MNSMS]
GO
/****** Object:  View [dbo].[v_AbvPendingCommands]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_AbvPendingCommands]

AS
select TOP 100 Id AS id, command_name, Command AS command from (
Select  Id as id,Command as command,CommandName as command_name,
Case when CreatedBy=-1 then 0 else 1 end as Ord 
FROM  dbo.SMS_CAS_CMDS WHERE Status = 0 AND Response is null and CASTYPE='1' --and Id>1381866
 )x --and CreatedBy!=-1
order by x.Ord desc,x.id asc
GO

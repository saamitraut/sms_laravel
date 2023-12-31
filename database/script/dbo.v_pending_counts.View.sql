USE [MNSMS]
GO
/****** Object:  View [dbo].[v_pending_counts]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_pending_counts] as
select sum(countt) as cnt from (
select count(*) as countt,'CmdCount' as CmdCount from v_GospelPendingCommands
union all
select count(*) as countt,'CmdCount' as CmdCount from v_NSTVPendingCommands)x group by x.CmdCount
GO

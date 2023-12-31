USE [MNSMS]
GO
/****** Object:  View [dbo].[pendingCounts]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[pendingCounts] as  
select * from (
select count(*) as cnt,'GOSPELL' as gospending from v_GospelPendingCommands
union
select count(*) as cnt,'NSTV' as nstvpending from v_NSTVPendingCommands
)x
GO

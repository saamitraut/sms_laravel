USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_history_package_pd]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_history_package_pd] as
select top 100 Percent ROW_NUMBER()over(Order by DoneON)as RID,* from (
select 0 as ChType,Id,FId,FId as SubscriberId,DMLComments,DoneBy,DoneON,Remark,Channels from sms_his_package 
) a
GO

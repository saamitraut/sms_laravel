USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_broadcaster]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_broadcaster] as
select a.*,COUNT(b.Id) as NoOfChannels  from SMS_BROADCASTER a
left outer join SMS_CHANNEL b on a.ID=b.BroadcasterId and b.STATUS=1
group by a.ID,a.BROADCASTERNAME,a.BROADCASTERDESC,a.CREATEDON,a.UPDATEDON,a.CREATEDBY,
a.UPDATEDBY,a.STATUS,a.Deleted,a.Remark,a.sms_id
GO

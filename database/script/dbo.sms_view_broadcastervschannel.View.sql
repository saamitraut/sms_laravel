USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_broadcastervschannel]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sms_view_broadcastervschannel]
as
Select a.Id,a.BROADCASTERNAME,
cast(substring ((SELECT (','+cast(ChannelName as varchar)) from SMS_CHANNEL WHERE BroadcasterId=a.ID ORDER BY ChannelName FOR XML PATH('')),2,8000) as varchar(8000))	as Channels	 
from SMS_BROADCASTER a where 1=1 
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_subpackage]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[sms_view_subpackage]
as
select a.Id,ChannelName as Channel,BROADCASTERNAME as Broadcaster,a.PackageId,
'<input type="text" value="'+cast(BroadcasterPrice as varchar)+'" id="Broadcasteride'+cast(a.ChannelId as varchar)+'" name=Broadcasterid[] onkeypress="return isNumberKey(event)">' as BroadcasterPrice
,'{id:'+cast(a.ChannelId as varchar)+',pack:'+CAST(a.IsSubPack as varchar)+'}' As Action 
from SMS_CHANNELINPACKAGE a left outer join SMS_CHANNEL c on c.ID=a.ChannelId 
left outer join SMS_BROADCASTER b on c.BroadcasterId=b.Id where a.IsSubPack=0
union 
select e.Id,d.Name as Channel,d.BroadcasterName as Broadcaster,e.PackageId,
'<input type="text" value="'+cast(d.BroadcasterPrice as varchar)+'" id="Broadcasteride'+cast(e.ChannelId as varchar)+'" name="Broadcasterid[]" onkeypress="return isNumberKey(event)">' as BroadcasterPrice
,'{id:'+cast(e.ChannelId as varchar)+',pack:'+CAST(e.IsSubPack as varchar)+'}' As Action  
from SMS_CHANNELINPACKAGE e 
left outer join SMS_SUBSIDIARY_MASTER d on d.id=e.ChannelId
where e.issubpack=1


GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[wap_sms_subscriber_account]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[wap_sms_subscriber_account] as 
select b.Id, b.SubscriberId, b.STBNo, b.SmartcardNo, b.ConnectionId, b.Status, b.IsPrimary, b.Deleted,
c.CustomerId, c.AreaId, c.OperatorId, c.SocietyId,
c.SubscriberName, c.FlatNo, c.FloorNo, c.Wing, c.Building, c.Address, 
c.Area, c.SocietyName as Society, c.Email, c.MobileNo as Mobile
from sms_view_SubscriberAccountList b left join sms_view_subscribers c ON (c.Id = b.SubscriberId);
GO

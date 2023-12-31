USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_active_list_bulk]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_active_list_bulk] As
Select a.Id,a.CustomerId,a.SubscriberName,a.Operator,a.Area,a.MobileNo,b.CreatedOn as CreatedOn,b.STBNo as STBNo
,b.SmartcardNo as SmartcardNo ,b.Id as accountId,b.Status as AccountStatus,b.ActivationDate as Activationdate
,b.DeactivationDate as deactivationdate,a.OperatorId,b.BrandTitle
from sms_view_subscribers a 
inner join sms_view_SubscriberAccountList b on b.SubscriberId=a.Id 
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_inactive_list]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[sms_view_inactive_list] As  

Select a.Id,a.CustomerId,a.ParentOperatorId,a.SubscriberName,a.Operator,a.OperatorCode,a.Area,a.MobileNo,a.Address,a.Verify,b.SmartcardNo,b.STBNo,a.OperatorId,b.UpdatedOn as Suspended  
from sms_view_subscribers a inner join sms_view_SubscriberAccountList b on b.SubscriberId=a.Id  where b.Status=0 -- or b.Id  not in (select AccountID from PRP_ACCOUNTTRANSACTION)
GO

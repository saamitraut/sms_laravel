USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_Suspend_list]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[sms_view_Suspend_list] As  
Select a.Id,a.CustomerId,a.SubscriberName,a.Operator,a.Area,a.MobileNo,a.Address,a.Verify,a.OperatorId  
from sms_view_subscribers a where a.Id not in(select SubscriberId from sms_view_SubscriberAccountList)    
  
GO

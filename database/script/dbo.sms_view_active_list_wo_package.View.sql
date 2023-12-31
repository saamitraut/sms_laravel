USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_active_list_wo_package]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_active_list_wo_package] As  
Select a.Id,a.CustomerId,a.SubscriberName,a.Operator,a.Area,a.MobileNo,a.Address,a.Verify,b.SmartcardNo,b.STBNo,b.ActivationDate,a.OperatorId,
b.CASTYPE,b.BrandTitle,a.ParentOperator,b.Id as AccountId,a.OperatorCode,a.BranchName
from sms_view_subscribers a 
inner join sms_view_SubscriberAccountList b on b.SubscriberId=a.Id
where b.Status=1 and b.Id not in (select accountid from PRP_ACCOUNTTRANSACTION where GETDATE()  between ActivationDate and DeactivationDate)
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_list_wo_package]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_list_wo_package] As  
Select a.Id,a.CustomerId,a.SubscriberName,a.Operator,a.Area,a.MobileNo,a.Address,a.Verify,b.SmartcardNo,b.STBNo,
case when b.status=1 then 'Active' else 'Inactive' end as status,a.ParentOperatorId,b.ActivationDate,a.OperatorId,b.CASTYPE,b.BrandTitle,a.ParentOperator,b.Id as AccountId,a.OperatorCode,
a.BranchName from sms_view_subscribers a 
inner join sms_view_SubscriberAccountList b on b.SubscriberId=a.Id 
where b.Id not in (select distinct accountid from PRP_ACCOUNTTRANSACTION)
GO

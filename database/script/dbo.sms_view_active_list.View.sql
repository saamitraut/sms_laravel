USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_active_list]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_active_list] As  



Select a.Id,a.CustomerId,a.SubscriberName,a.BranchName,a.ParentOpCode,a.ParentOperator,a.Operator,a.OperatorCode,a.Area,a.MobileNo,a.Address,

a.Verify,b.SmartcardNo,b.STBNo,b.ActivationDate,a.OperatorId,b.CASTYPE,b.BrandTitle,a.ParentOperatorId

,case b.BoxType when 0 Then 'SD' else 'HD' end as BoxType

from sms_view_subscribers a inner join sms_view_SubscriberAccountList b on b.SubscriberId=a.Id  

where b.Status=1 and b.Id in (select accountid from PRP_ACCOUNTTRANSACTION where DeactivationDate>=CAST(GETDATE() as date))
GO

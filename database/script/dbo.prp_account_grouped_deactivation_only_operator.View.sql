USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_account_grouped_deactivation_only_operator]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_account_grouped_deactivation_only_operator]



as







select a.AccountId as Id, s.SubscriberName, s.CustomerId, s.Operator, s.OperatorCode, c.SmartcardNo, 

c.STBNo, a.BouqueName,a.BouqueId,s.OperatorId,a.ActivationDate,s.BranchName,

max(a.Deactivationdate) as DeActivationDate,c.CASTYPEID,cas.CASNAME,s.Address

from prp_account_prepaidbouquets a left outer join sms_view_subscriberaccountlist c on c.Id=a.AccountId

	left outer join sms_view_subscribers s on s.Id=c.SubscriberId 

	left outer join SMS_CAS_TABLE cas on cas.ID=c.CASTYPEID			

where c.Status=1 

group by a.AccountId,s.SubscriberName, s.CustomerId,a.ActivationDate,s.BranchName, s.Operator, s.OperatorCode, c.SmartcardNo, c.STBNo,a.BouqueName,a.BouqueId,s.OperatorId,c.CASTYPEID,cas.CASNAME,s.Address	
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_account_package_not_assigned]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[sms_view_account_package_not_assigned] as
--select a.Id as AccountId,b.*  from 
--sms_view_accounts_pairings a
--left outer join SMS_PACKAGE b on cast(a.BoxType as int)>=cast(b.PackageType as int)
--where b.Id is not null and a.Status=1
select a.Id as AccountId,b.*  from 
sms_view_accounts_pairings a, SMS_PACKAGE b 
where b.Id is not null and a.Status=1
except
Select a.AccountId,b.* from [sms_view_package_tranaction] a
left outer join SMS_PACKAGE b on a.ProductId=b.Id
where b.Id is not null and a.IsAlacarte=0 and a.Status=1

GO

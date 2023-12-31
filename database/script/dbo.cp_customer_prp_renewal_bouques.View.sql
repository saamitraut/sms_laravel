USE [MNSMS]
GO
/****** Object:  View [dbo].[cp_customer_prp_renewal_bouques]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[cp_customer_prp_renewal_bouques] as  
select a.Id as prp_id,d.SubscriberId as subscriber_id,a.AccountId as account_id,a.BouqueId as bouque_id,b.BouqueCode as bouque_code,b.BouqueName as bouque_name,
a.ActivationDate as activation_date,a.DeactivationDate as deactivation_date,DATEADD(D,1,a.DeactivationDate) as renewal_date,30 as days,
CASE d.ApplicableRate WHEN 1 THEN b.Rate WHEN 2 THEN b.Rate ELSE b.Rate END as price
from prp_view_account_bouque_transaction a left outer join prp_view_bouques b on a.BouqueId=b.id 
inner join (select MAX(Id) as MaxPrpId FROM prp_view_account_bouque_transaction GROUP BY AccountId)c on a.Id=c.MaxPrpId
left join SMS_SUBSCRIBERACCOUNTS d on a.AccountId=d.Id where b.Id is not null and a.ExpStatus=1 and d.IsPrimary=1


GO

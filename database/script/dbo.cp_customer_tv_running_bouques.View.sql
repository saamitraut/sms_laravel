USE [MNSMS]
GO
/****** Object:  View [dbo].[cp_customer_tv_running_bouques]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [dbo].[cp_customer_tv_running_bouques] as

select a.AccountId as account_id,0 as subscriber_id,a.BouqueId as bouque_id,a.BouqueName as bouque_name,a.ActivationDate as activation_date,

a.DeactivationDate as deactivation_date,a.ExpStatus as status,NULL as is_credit, a.AType as bouque_type, case ISNULL(a.PackageId, 0) when 0 then 1 else 0 end as is_alacarte

from prp_account_prepaidbouquets a 

where a.deleted=0;
GO

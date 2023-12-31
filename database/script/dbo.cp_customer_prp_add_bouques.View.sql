USE [MNSMS]
GO
/****** Object:  View [dbo].[cp_customer_prp_add_bouques]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[cp_customer_prp_add_bouques] as  
select a.BouqueId as bouque_id,a.BouqueCode as bouque_code,a.BouqueName as bouque_name,
null as activation_date,null as deactivation_date,null as renewal_date,30 as days,
a.Rate  as price,a.OperatorId as operator_id, a.AType as bouque_type, case ISNULL(b.PackageId, 0) when 0 then 1 else 0 end as is_alacarte
from prp_view_operator_prebouque a
left join PRP_BOUQUE_ASSETS b on a.BouqueId=b.BouqueId
--where a.BouqueId not in (186,189,205,201,218,219) ;

GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_b_a_rate_billstatement]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_b_a_rate_billstatement] as
select c.Id as Scheme_Id ,c.Name as Scheme,c.Code as SchemeCode,a.BasicCharge as PackageCharges,a.*,
cast(isnull((select  TaxAmount from SMS_B_A_INVOICETAXES where TaxId=1 and Invoiceid=a.Id),0) as money)as ServiceTax
,cast(isnull((select  TaxAmount from SMS_B_A_INVOICETAXES where TaxId=3 and Invoiceid=a.Id),0) as money)as [Edu.Cess]
,cast(isnull((select  TaxAmount from SMS_B_A_INVOICETAXES where TaxId=4 and Invoiceid=a.Id),0) as money) as [H.Edu.Cess]
,cast(isnull((select  TaxAmount from SMS_B_A_INVOICETAXES where TaxId=2 and Invoiceid=a.Id),0) as money) as [Ent.Tax]
from  SMS_CONNECTIONSCHEME c left join [sms_bp_a_invoice] a on a.SchemeId=c.Id
where c.ServiceType=0 and a.SubscriberId is not null
GO

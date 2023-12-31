USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_b_d_billstatement]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[sms_view_b_d_billstatement] as
select *,BasicCharge+PayPackageCharge as PackageCharges,
InvoiceAddonCharges=cast(substring 
                          ((SELECT     (',' +isnull(TagName,''))
                              FROM         SMS_B_D_INVOICE_ADDONCHARGES t
                              WHERE     t.Invoiceid = a.Id
                              ORDER BY t.TagName FOR XML PATH('')),2,8000) as varchar(8000)),
cast(isnull((select  TaxAmount from SMS_B_D_INVOICETAXES where TaxId=1 and Invoiceid=a.Id),0) as money)as ServiceTax
,cast(isnull((select  TaxAmount from SMS_B_D_INVOICETAXES where TaxId=2 and Invoiceid=a.Id),0) as money)as [Edu.Cess] 
,cast(isnull((select  TaxAmount from SMS_B_D_INVOICETAXES where TaxId=3 and Invoiceid=a.Id),0) as money) as [H.Edu.Cess] 
from [sms_bp_d_invoice]a


GO

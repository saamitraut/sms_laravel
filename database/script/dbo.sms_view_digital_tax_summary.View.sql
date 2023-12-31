USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_digital_tax_summary]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_digital_tax_summary] As
 select t.TaxTitle,t.TaxCode,cast(SUM(t.TaxAmount) as money) as TaxAmount,cast(SUM(t.TaxAmount) as int) as Id,t.TaxDescription
 from SMS_B_D_INVOICETAXES t 
 group by t.TaxTitle,t.TaxCode,t.TaxValue,t.TaxDescription
GO

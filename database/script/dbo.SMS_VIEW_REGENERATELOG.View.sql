USE [MNSMS]
GO
/****** Object:  View [dbo].[SMS_VIEW_REGENERATELOG]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[SMS_VIEW_REGENERATELOG] AS
Select 
(select COUNT(*)   from SMS_B_D_INVOICE where BillgenLogId=d.Id and NextBillId=0) AS digitalbillcnt,
d.*,DATENAME(MM, d.BillMonthYear) + ' ' + CAST(YEAR(d.BillMonthYear) AS VARCHAR(4))  AS BillMYear  from 
SMS_B_D_INVOICE_GEN_LOG d
GO

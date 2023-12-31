USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_bl_d_view_operator_wise_billtogen]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_bl_d_view_operator_wise_billtogen] as
select a.*,b.NAME as Operator from(
select count(Id) as Billcount,OperatorId,NextInvoiceMonth from [sms_b_d_view_nextinvoicemonth] group by OperatorId,NextInvoiceMonth) a
left outer join SMS_OPERATOR b on a.OperatorId=b.ID
GO

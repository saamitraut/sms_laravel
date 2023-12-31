USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_b_a_view_nextinvoicemonth_1]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_b_a_view_nextinvoicemonth_1] as
select dbo.[getFirstDate](isnull(b.NextMonthYear,a.BillingSMonth)) as NextInvoiceMonth,
isnull(b.InvoiceId,0)as LastInvoiceId, a.*
from sms_h_view_analog_accounts a
left outer join SMS_B_A_NEXTINVOICEMONTH b on a.Id=b.AccountId
left outer join sms_b_l_a_view_bglog_entries d on a.Id=d.AccountId and d.status=0
where d.Id is null
GO

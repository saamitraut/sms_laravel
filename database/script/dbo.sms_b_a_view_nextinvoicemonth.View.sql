USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_b_a_view_nextinvoicemonth]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_b_a_view_nextinvoicemonth]
as
select dbo.[getFirstDate](dbo.returnGreaterdate(isnull(b.NextMonthYear,a.BillingSMonth),e.BillingFrom)) as NextInvoiceMonth,
isnull(b.InvoiceId,0)as LastInvoiceId, a.*,c.OperatorId,c.SocietyId,c.CustomerId,c.Status as SubscriberStatus,c.AreaId
from sms_h_view_analog_accounts a
left outer join SMS_B_A_NEXTINVOICEMONTH b on a.Id=b.AccountId
left outer join sms_h_view_subscribers c on c.Id=a.SubscriberId
left outer join SMS_OPERATOR e on e.Id=c.OperatorId
left outer join sms_b_l_a_view_bglog_entries d on a.Id=d.AccountId and d.status=0
where c.Id is not null and d.id is null and
 ((a.Deleted=1 and dbo.[getFirstDate](isnull(b.NextMonthYear,a.BillingSMonth))<dbo.[getFirstDate](a.DeactivationDate)) 
 or a.Deleted=0) and c.OpTobeBilled=1
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_b_d_view_nextinvoicemonth]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[sms_b_d_view_nextinvoicemonth]    
as    
select dbo.[getFirstDate](dbo.returnGreaterdate(isnull(b.NextMonthYear,a.BillingSMonth),e.BillingFrom)) as NextInvoiceMonth,    
isnull(b.InvoiceId,0)as LastInvoiceId, a.*,c.OperatorId,c.SocietyId,c.CustomerId,c.Status as SubscriberStatus,c.AreaId    
from sms_h_view_digital_accounts a    
left outer join SMS_B_D_NEXTINVOICEMONTH b on a.Id=b.AccountId    
left outer join sms_h_view_subscribers c on c.Id=a.SubscriberId    
left outer join SMS_OPERATOR e on c.operatorid=e.ID    
left outer join sms_b_l_d_view_bglog_entries d on a.Id=d.AccountId and d.status=0    
where c.Id is not null and d.id is null  and b.Id  is not null   
and    
 ((a.Deleted=1 and dbo.[getFirstDate](dbo.returnGreaterdate(isnull(b.NextMonthYear,a.BillingSMonth),e.BillingFrom))<dbo.[getFirstDate](a.DeactivationDate))     
 or a.Deleted=0) and c.opTobeBilled=1 

GO

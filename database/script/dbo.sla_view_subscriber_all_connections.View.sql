USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_subscriber_all_connections]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sla_view_subscriber_all_connections] as
select a.Id as Id,1 as ServiceType,a.SubscriberId,b.AccountId as AccountId,
a.STBNo+' @ '+a.SmartcardNo+case Status when 1 then ' ---<span class="greenfnt">Active</span>'
 else '---<span class="redfnt">Inactive</span>'end+ '<br> '+ConnectionScheme+
' @ '+CAST(MonthlyCharge as varchar) as [text],
STBNo+' @ '+SmartcardNo+'<br>'+case Status when 1 then ' Active '+case BoxType when 1 then 'HD' else 'SD' end+' Digital Account '
 else ' Inactive '+case BoxType when 1 then 'HD' else 'SD' end+' Digital Accont ' end+ '<br> with Scheme  '+ConnectionScheme+
' @ '+CAST(MonthlyCharge as varchar) as [text1],
case BoxType when 1 then 'HD' else 'SD' end+ ' Digital Account' as title,Status,ConnectionScheme,MonthlyCharge,
isnull(b.BillAmount,0) as BillAmount,isnull(b.Id,0) as InvoiceId,isnull(b.BillNo,'--') as BillNo,b.BillMonthYear,b.CreatedBy
from sms_view_SubscriberAccountList a
left outer join SMS_B_D_INVOICE b on a.Id=b.AccountId and b.NextBillId=0
GO

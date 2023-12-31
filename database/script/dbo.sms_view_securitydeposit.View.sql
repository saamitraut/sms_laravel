USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_securitydeposit]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_securitydeposit] as
Select a.ID,b.CustomerId,b.SubscriberName,s.SmartcardNo,s.STBNo,e.Name as ConnectionScheme,a.Amount,
case when a.Status=0 then 'NotRefunded' else 'Refunded on '+convert(varchar(10),a.IsRefundedOn,120)+'<br>by '+
cast((Select Name from SMS_ACCESS where ID=a.IsRefundedBy) as varchar) end as Status,
b.AreaName+'<br>'+b.SocietyName as 'Area<br>Society',convert(varchar(10),a.CreatedOn,120) as AddedOn,
ac.NAME as AddedBy,b.AreaName as Area,b.SocietyName,a.Receiptno,a.ReceiptDate,b.Operator,
a.Status as pstatus,a.Remark
from SMS_Refund a 
left join sms_all_digital_account_details s on s.Id=a.AccountId
left outer join SMS_CONNECTIONSCHEME e on s.ConnectionId=e.Id
left join sms_all_view_subscribers b on b.Id=a.SubscriberId
left join SMS_ACCESS ac on ac.ID=a.CreatedBy
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_d_advancepayment_entries]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_d_advancepayment_entries] as
select a.*,c.ReasonTitle  from SMS_D_PAYMENTCREDIT_ENTRIES a
left outer join SMS_D_PAYMENTCREDITS b on a.CreditId=b.Id
left outer join SMS_REASON_MASTER c on b.ReasonId=c.Id
where b.isAdvancePayment=1 and b.Id is not null
GO

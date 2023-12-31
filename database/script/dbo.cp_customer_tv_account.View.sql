USE [MNSMS]
GO
/****** Object:  View [dbo].[cp_customer_tv_account]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[cp_customer_tv_account] AS

Select a.Id as account_id,a.SubscriberId as subscriber_id,c.CustomerId as customer_id, c.MobileNo as mobile, b.SmartcardNo as smartcard_no,b.STBNo as stb_no,

a.Status as status,c.Status as customer_status,a.IsPrimary as is_primary,a.PrePaidFlag as is_prepaid,a.ApplicableRate as rate_type

from SMS_SUBSCRIBERACCOUNTS a left join sms_view_pairing b on a.PairingId=b.Id left join SMS_SUBSCRIBERS c on a.SubscriberId=c.Id;
GO

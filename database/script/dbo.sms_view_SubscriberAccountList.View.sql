USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_SubscriberAccountList]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_SubscriberAccountList] AS
Select a.*,b.BoxType,b.BrandTitle,b.STBNo,b.SmartCardId,b.StbId,b.SmartcardNo,b.TimeShift as TimeShilftAvailable,b.Checkcode as Checkcode,b.Authcode as Authcode,
BouqueCount=isnull((Select count(distinct BouqueId) from prp_account_prepaidbouquets where AccountId=a.Id),0),c.Name as ConnectionScheme,
case when a.ApplicableRate=0 and a.IsPrimary=0 then c.MonthlyCharge2 else c.MonthlyCharge end as MonthlyCharge,b.StbBrandId,b.CASTYPEID ,b.CASTYPE
from SMS_SUBSCRIBERACCOUNTS a 
left join sms_view_pairing b on a.PairingId=b.Id
left outer join sms_view_ConnectionScheme c on a.ConnectionId=c.Id
GO

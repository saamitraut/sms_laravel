USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_all_view_pairing]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_all_view_pairing] as
Select a.*,b.STBNo,c.SmartcardNo,isnull(d.Id,0) as AccountId,isnull(d.SubscriberId,0) as SubscriberId 
,e.BoxType,e.BrandTitle,e.TimeShift,b.BrandId as StbBrandId from SMS_PAIRING a
left outer join SMS_STBS b on a.StbId=b.Id
left outer join SMS_SMARTCARDS c on a.SmartCardId=c.Id
left outer join SMS_STBSCBRAND e on b.BrandId=e.Id
left outer join sms_h_view_digital_accounts d on a.Id=d.PairingId
GO

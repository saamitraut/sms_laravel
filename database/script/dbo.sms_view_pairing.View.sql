USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_pairing]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_pairing] as

Select a.*,b.STBNo,c.SmartcardNo,'' as CSNNO,isnull(d.Id,0) as AccountId,isnull(d.SubscriberId,0) as SubscriberId,b.Checkcode as Checkcode,b.Authcode as Authcode,
ISNULL(f.CASNAME,'ABV') as CASTYPE
,e.BoxType,e.BrandTitle,e.TimeShift,b.BrandId as StbBrandId,e.CASTYPEID,b.Status as STBStatus,c.Status as SCStatus,d.Status as AccountStatus 
from SMS_PAIRING a
left outer join SMS_STBS b on a.StbId=b.Id
left outer join SMS_SMARTCARDS c on a.SmartCardId=c.Id
left outer join SMS_STBSCBRAND e on b.BrandId=e.Id
left outer join SMS_CAS_TABLE f on f.Id=e.CASTYPEID
left outer join SMS_SUBSCRIBERACCOUNTS d on a.Id=d.PairingId
GO

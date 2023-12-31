USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_pairing_his]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[sms_view_pairing_his] as
Select a.*,b.STBNo,c.SmartcardNo,'' as CSNNO,isnull(d.Id,0) as AccountId,isnull(d.SubscriberId,0) as SubscriberId,b.Checkcode as Checkcode,b.Authcode as Authcode,
f.CASNAME as CASTYPE
,e.BoxType,e.BrandTitle,e.TimeShift,b.BrandId as StbBrandId,e.CASTYPEID,b.Status as STBStatus,c.Status as SCStatus,d.Status as AccountStatus from SMS_PAIRING_HISTORY a
left outer join SMS_STBS b on a.StbId=b.Id
left outer join SMS_SMARTCARDS c on a.SmartCardId=c.Id
left outer join SMS_STBSCBRAND e on b.BrandId=e.Id
left outer join SMS_CAS_TABLE f on f.Id=e.CASTYPEID
left outer join SMS_SUBSCRIBERACCOUNTS_HISTORY d on a.FId=d.PairingId
GO

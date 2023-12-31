USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_stb]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_stb] as

Select a.*,d.BrandTitle as Brand,d.CharAllowed,d.Maxlength,d.BoxType,
isnull(b.Id,0)  as PairingId,d.SignificantDigits, 
isnull(b.AccountId,0) as AccountId,isnull(b.SubscriberId,0) as SubscriberId,d.CASTYPEID as CASTYPEID,e.CASNAME as CASNAME,
case isnull(b.SubscriberId,0) when 0 then '--' else (select CustomerId from SMS_Subscribers where Id=b.SubscriberId )
end as CustomerId,isnull(cast(b.Status as int),-1) as Pstatus,case when b.AccountId is  null then 0 else 1 end as isAssigned,b.SmartcardNo
from SMS_STBS a
left outer join SMS_STBSCBRAND d on a.BrandId=d.Id
left outer join SMS_cas_TABLE e on d.CASTYPEID=e.Id
left outer join 
(Select x.Id,x.Status,x.SmartCardId,x.StbId,y.SmartcardNo,c.SubscriberId,c.Id as AccountId from SMS_PAIRING x left outer join SMS_SMARTCARDS y on x.SmartCardId=y.Id
Left outer join SMS_SUBSCRIBERACCOUNTS c on x.Id=c.PairingId ) b on b.StbId=a.Id
GO

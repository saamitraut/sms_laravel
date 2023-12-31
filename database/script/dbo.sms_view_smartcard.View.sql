USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_smartcard]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_smartcard] as
Select a.*,d.BrandTitle as Brand,d.CharAllowed,d.SignificantDigits,d.Maxlength,isnull(b.Id,0)  as PairingId,isnull(c.Id,0) as AccountId,
isnull(c.SubscriberId,0) as SubscriberId,e.CASNAME as CASNAME,d.CASTYPEID,
case isnull(c.SubscriberId,0) when 0 then '--' else (select CustomerId from SMS_Subscribers where Id=c.SubscriberId )
end as CustomerId,isnull(cast(b.Status as int),-1) as Pstatus,case when c.Id is  null then 0 else 1 end as isAssigned,b.STBNo
from SMS_SMARTCARDS a
left outer join SMS_STBSCBRAND d on a.BrandId=d.Id
left outer join SMS_cas_TABLE e on d.CASTYPEID=e.Id
left outer join 
(Select x.Id,x.Status,x.SmartCardId,x.StbId,y.STBNo from SMS_PAIRING x left outer join SMS_STBS y on x.StbId=y.Id) b on b.SmartCardId=a.Id
Left outer join SMS_SUBSCRIBERACCOUNTS c on b.Id=c.PairingId
GO

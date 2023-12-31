USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_smartcard_faulty]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sms_view_smartcard_faulty]

as

select a.*, x.Name from sms_view_smartcard a 

left outer join 

(select b.SmartCardId,e.Name from SMS_PAIRING_HISTORY b 

left outer join 

(select SubscriberId,PairingId,Deleted from SMS_SUBSCRIBERACCOUNTS_HISTORY where UpdatedOn in 

 (select max(UpdatedOn) from SMS_SUBSCRIBERACCOUNTS_HISTORY where deleted=1 group by PairingId)) c on c.PairingId=b.FId

left outer join sms_SUBSCRIBERS d on d.Id=c.SubscriberId

left outer join SMS_OPERATOR e on e.Id=d.OperatorId where b.Deleted=1 and c.deleted=1) x on x.SmartCardId=a.Id

where a.status=3
GO

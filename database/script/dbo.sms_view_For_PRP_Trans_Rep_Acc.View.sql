USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_For_PRP_Trans_Rep_Acc]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_For_PRP_Trans_Rep_Acc] as  



select a.fid as AccountId,c.SmartcardNo,d.STBNo,e.CustomerId from SMS_SUBSCRIBERACCOUNTS_HISTORY a



left join SMS_PAIRING_HISTORY b on a.PairingId=b.FID



left join SMS_SMARTCARDS c on b.SmartCardId=c.id



left join SMS_STBS d on b.StbId=d.id



left join SMS_SUBSCRIBERS e on a.SubscriberId=e.id



where a.DMLAction=1 and b.DMLAction=1 and b.id is not null and e.id is not null
GO

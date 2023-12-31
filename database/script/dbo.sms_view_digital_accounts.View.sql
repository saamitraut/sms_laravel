USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_digital_accounts]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_digital_accounts] AS
Select a.*,b.BoxType,b.BrandTitle,b.STBNo,b.SmartCardId,b.StbId,b.SmartcardNo,b.TimeShift as TimeShilftAvailable,c.Name as ConnectionScheme,c.MonthlyCharge 
from SMS_SUBSCRIBERACCOUNTS a 
left join sms_view_pairing b on a.PairingId=b.Id
left outer join sms_view_ConnectionScheme c on a.ConnectionId=c.Id
GO

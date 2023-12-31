USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_accounts_pairings]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_accounts_pairings] as
select a.*,b.BoxType,b.BrandTitle,b.STBNo,b.StbId,b.SmartcardNo,b.SmartCardId,
b.StbBrandId,b.TimeShift as TimeShiftAvailable,b.CASTYPEID from SMS_SUBSCRIBERACCOUNTS a
left outer join sms_view_pairing b on b.Id=a.PairingId
where b.Id is not null
GO

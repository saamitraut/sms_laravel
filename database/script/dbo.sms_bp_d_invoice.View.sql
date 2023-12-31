USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_bp_d_invoice]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_bp_d_invoice] as
select a.*,c.FormNo,c.CustomerId,c.OperatorId,c.SocietyId,c.MobileNo,c.SubscriberName,c.FlatNo,c.FloorNo
,c.Wing,c.Building,c.Address,c.Gender,c.Zipcode,c.Phone,c.Operator,c.ParentOperatorId,c.ParentOperator,c.AreaId,c.Areacode,c.AreaName,c.SocietyName
,c.SocietyCode,d.STBNo,d.SmartcardNo from SMS_B_D_INVOICE a
left outer join SMS_SUBSCRIBERACCOUNTS_HISTORY b on a.HAccountId=b.Id
left outer join [sms_h_view_pairing] d on d.HId=a.HPairingId
left outer join sms_view_subscribers_h c on a.HSubscriberId=c.Id
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_his_d_accounts]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[sms_his_d_accounts] as
select a.*,b.BoxType,b.BrandId,b.BrandTitle,b.SmartcardNo,b.SmartCardId,b.SC_AccountId,b.SC_AccountStatus,b.SC_CStatus,b.SC_STBNo,b.SC_Status,b.SC_StbId
,b.SC_SubscriberId,b.STB_AccountId,b.STBNo,b.STB_AccountStatus,b.STB_CStatus,b.STB_SmartCardId,b.STB_SmartcardNo,b.STB_Status
,b.STB_SubscriberId from SMS_SUBSCRIBERACCOUNTS_HISTORY a
left outer join sms_view_archived_pairings b on a.PairingId=b.FId
GO

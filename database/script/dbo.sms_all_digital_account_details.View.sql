USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_all_digital_account_details]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_all_digital_account_details] as
Select a.*,b.SmartCardId,b.StbId,b.STBNo,b.SmartcardNo,b.BoxType,b.BrandTitle,b.BrandId as StbBrandId,
case a.Deleted when 1 then  -1 else a.Status end as CurrentStatus 
from sms_h_view_digital_accounts a
left outer join [sms_h_view_pairing] b on a.PairingId=b.Id
GO

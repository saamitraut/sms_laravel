USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_archived_pairings]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIew [dbo].[sms_view_archived_pairings] as
select a.*,b.SmartcardNo,b.Status as SC_Status,b.SC_CStatus,SC_PairingId,SC_STBNo,SC_StbId,SC_AccountId,SC_AccountStatus,SC_SubscriberId
,c.STBNo,c.Status as STB_Status,c.STB_CStatus,c.STB_PairingId,STB_SmartcardNo,STB_SmartCardId,STB_AccountId,STB_AccountStatus,STB_SubscriberId,
c.BoxType,c.BrandTitle,c.TimeShift,c.BrandId
 from(
select ROW_NUMBER()over(Partition By FId order by Id desc) as RID,* from SMS_PAIRING_HISTORY) a
left outer join sms_view_archived_smartcard b on a.SmartCardId=b.SmartcardId
left outer join sms_view_archived_stb c on a.StbId=c.STBId
where a.RID=1
GO

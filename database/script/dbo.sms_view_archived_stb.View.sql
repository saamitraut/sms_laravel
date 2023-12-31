USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_archived_stb]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_archived_stb] as
select  a.*,isnull(b.Status,-1) as STB_CStatus,isnull(b.Id,0) as STB_PairingId,isnull(b.SmartcardNo,'Not Paired') as STB_SmartcardNo,isnull(b.SmartCardId,0) as STB_SmartCardId,isnull(b.AccountId,0) as STB_AccountId,isnull(b.AccountStatus,0) as STB_AccountStatus,ISNULL(b.SubscriberId,0) as STB_SubscriberId
,e.BoxType,e.BrandTitle,e.TimeShift from(
select ROW_NUMBER()over(Partition By STBId order by Id desc) as RID,* from SMS_STBS_HISTORY) a
left outer join SMS_STBSCBRAND e on a.BrandId=e.Id
left outer join sms_view_pairing b on a.STBId=b.StbId

where RID=1
GO

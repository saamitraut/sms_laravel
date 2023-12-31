USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_archived_smartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_archived_smartcard] as
select  a.*,isnull(b.Status,-1) as SC_CStatus,isnull(b.Id,0) as SC_PairingId,isnull(b.STBNo,'Not Paired') as SC_STBNo,isnull(b.StbId,0) as SC_StbId
,isnull(b.AccountId,0) as SC_AccountId,isnull(b.AccountStatus,0) as SC_AccountStatus,ISNULL(b.SubscriberId,0) as SC_SubscriberId from(
select ROW_NUMBER()over(Partition By SmartcardId order by Id desc) as RID,* from SMS_SMARTCARDS_HISTORY) a
left outer join sms_view_pairing b on a.SmartcardId=b.SmartCardId
where a.RID=1
GO

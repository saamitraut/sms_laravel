USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_archived_alacarte]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_archived_alacarte] as
select Id as HID,Fid as ID,ChannelName,CasCode,LogoExt,Price,Price2,BillingCycle,BroadcasterId,BRate,CategoryId,ChannelType,IsAlacarte,Description,Status,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,Deleted,Remark,sms_id,InsertedOn,InsertedBy,PreviousId,DMLAction,DMLComments
from
(select ROW_NUMBER()over(Partition By FId order by Id desc) as RID,* from SMS_CHANNEL_HISTORY) a
where RID=1
GO

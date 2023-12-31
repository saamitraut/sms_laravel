USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[sms_brd_gen_brd_report_channelwise]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[sms_brd_gen_brd_report_channelwise] @repMonthYear as Date,@ChannelId as bigint
as
Begin

Declare @BroadcasterId as bigint
Declare @BroadcasterName as varchar(150)
Declare @PackageCount as int
Declare @PackageNames as varchar(8000) 

Select @BroadcasterId=BroadcasterId from SMS_CHANNEL where Id=@ChannelId

Select @BroadcasterName=BROADCASTERNAME from SMS_BROADCASTER where Id=@BroadcasterId

Select @PackageCount=COUNT(ID) from SMS_CHANNELINPACKAGE where ChannelId=@ChannelId 
and PackageId in (Select Id from SMS_PACKAGE where Status=1)

select @PackageNames=ltrim(rtrim(cast(substring 
          ((SELECT     (','+replace(t.PackageName,',',' ')+SPACE(1))
              FROM sms_view_channelinpackage t
              WHERE t.ChannelId= @ChannelId and t.PackageId in (Select Id from SMS_PACKAGE where Status=1)
              ORDER BY Id FOR XML PATH('')),2,8000) as varchar(8000)))) 

Declare @repMonth as date
Select @repMonth=dbo.[getFirstDate](@repMonthYear)

delete from SMS_BROADCASTER_REPORT_CHANNEL where Channel_Id=@ChannelId and RepMonth=@repMonth


insert into SMS_BROADCASTER_REPORT_CHANNEL
(BroadcasterId,BroadcasterName,RepMonth,Channel_Id,Channel_Name,Opening,Closing,Average,PackageCount,Package_Names,CREATEDON,CREATEDBY,Remark)

select x.BroadcasterId,@BroadcasterName,@repMonth,x.Id,x.ChannelName,ISNULL(SUM(x.Opening),0) as Opening,ISNULL(SUM(x.Closing),0) as Closing,
ISNULL(FLOOR((SUM(x.Opening)+SUM(x.Closing))/2),0) as Average,@PackageCount,@PackageNames,GETDATE(),'-1','AUTO GEN'
from(
select c.Id,c.ChannelName,c.BroadcasterId,(select SUM(Opening) from SMS_BROADCASTER_REPORT 
where BroadcasterId=@BroadcasterId and IsAlacarte=0 and RepMonth=@repMonth 
and Package_channel_id in (select PackageId from SMS_CHANNELINPACKAGE where ChannelId in(c.Id)))
as Opening,
(select SUM(Closing) from SMS_BROADCASTER_REPORT 
where BroadcasterId=@BroadcasterId and IsAlacarte=0 and RepMonth=@repMonth
and Package_channel_id in (select PackageId from SMS_CHANNELINPACKAGE where ChannelId in(c.Id)))
as Closing
from SMS_CHANNEL c where c.Status=1 and c.Id=@ChannelId
) x group by x.ChannelName,x.Id,x.BroadcasterId

End

GO

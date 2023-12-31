USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[print_broadcaster_report_trai]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[print_broadcaster_report_trai] @RepMonthYear as date
as
Begin
Declare @query as varchar(max)  
Declare @cols as varchar(100)

set @RepMonthYear=isnull(@RepMonthYear,dbo.getFirstDate(getdate()))

set @cols='['+cast(dateadd(d,6,@RepMonthYear) as varchar)+'],'+'['+cast(dateadd(d,13,@RepMonthYear) as varchar)+'],'+'['+cast(dateadd(d,20,@RepMonthYear) as varchar)+'],'+'['+cast(dateadd(d,27,@RepMonthYear) as varchar)+']'

set @query='
select BroadcasterId,BroadcasterName,Package_Channel_Id,Package_Channel_Name,IsAlacarte,BRate,ChannelCount,PayChannelCnt,PayChannels,Price1,Price2,'+@cols+' from (
select BroadcasterId,BroadcasterName,Package_Channel_Id,Package_Channel_Name,IsAlacarte,BRate,Closing,ChannelCount,PayChannelCnt,
cast(PayChannels as varchar(8000)) as PayChannels,
Price1,Price2,RepMonth 
from SMS_BROADCASTER_REPORT_TRAI
where dbo.getFirstDate(RepMonth)='''+cast(@RepMonthYear as varchar)+'''
)x pivot  
   (  
		sum(Closing) for RepMonth in ('+@cols+')  
   )p; ' 
--print(@query);  
execute(@query);  
End
GO

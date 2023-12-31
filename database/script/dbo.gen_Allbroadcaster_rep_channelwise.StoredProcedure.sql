USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[gen_Allbroadcaster_rep_channelwise]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[gen_Allbroadcaster_rep_channelwise] @date as date=NUll
As
Begin

select * into #t_channel from SMS_CHANNEL where Status=1

declare @channelId as bigint=0
while(exists(Select Id from #t_channel ))
Begin
	declare @date1 as date
	
	if(@date is null)
	set @date1=dateadd(m,-1,getdate())
	else
	set 	@date1=@date
			
	select top 1 @channelId=Id from #t_channel  order by ID asc
	exec sms_brd_gen_brd_report_channelwise @date1,@channelId
	print @channelId
	delete from #t_channel where ID=@channelId
end
End

GO

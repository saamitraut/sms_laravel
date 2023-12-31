USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[gen_Allbroadcaster_rep]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[gen_Allbroadcaster_rep] @date as date=NUll
As
Begin

select * into #t_br from sms_view_broadcaster where NoOfChannels>0

declare @brId as bigint=0
while(exists(Select Id from #t_br ))
Begin
	declare @date1 as date
	
	if(@date is null)
	set @date1=dateadd(m,-1,getdate())
	else
	set 	@date1=@date
			
	select top 1 @brId=Id from #t_br  order by ID asc
	exec sms_brd_gen_brd_report @date1,@brId
	print @brId
	delete from #t_br where ID=@brId
end
End
GO

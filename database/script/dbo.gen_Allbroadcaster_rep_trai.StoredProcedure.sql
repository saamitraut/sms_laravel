USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[gen_Allbroadcaster_rep_trai]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[gen_Allbroadcaster_rep_trai] @date as date=NUll
As
Begin

declare @datexxx as date

if(@date is null)
set @datexxx=cast(getdate() as date)
else
set @datexxx=@date

select * into #t_br from sms_view_broadcaster where NoOfChannels>0

declare @brId as bigint=0
while(exists(Select Id from #t_br ))
Begin
	declare @date1 as date
	declare @date2 as date
	declare @date3 as date
	declare @date4 as date		

	select @date1=DATEADD(D,6,dbo.getFirstDate(@datexxx));
	select @date2=DATEADD(D,13,dbo.getFirstDate(@datexxx));
	select @date3=DATEADD(D,20,dbo.getFirstDate(@datexxx));
	select @date4=DATEADD(D,27,dbo.getFirstDate(@datexxx));
	
	select top 1 @brId=Id from #t_br order by ID asc
	
	exec sms_brd_gen_brd_report_trai @date1,@brId;
	exec sms_brd_gen_brd_report_trai @date2,@brId;
	exec sms_brd_gen_brd_report_trai @date3,@brId;
	exec sms_brd_gen_brd_report_trai @date4,@brId;
	
	delete from #t_br where ID=@brId
end
End
GO

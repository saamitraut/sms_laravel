USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[print_unique_acc_report_trai]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[print_unique_acc_report_trai] @RepMonthYear as date
as
Begin
Declare @query as varchar(max)  
Declare @cols as varchar(100)
Declare @all as varchar(20)='ALL';
Declare @HD as varchar(20)='HD';

set @RepMonthYear=isnull(@RepMonthYear,dbo.getFirstDate(getdate()))

set @cols='['+cast(dateadd(d,6,@RepMonthYear) as varchar)+'],'+'['+cast(dateadd(d,13,@RepMonthYear) as varchar)+'],'+'['+cast(dateadd(d,20,@RepMonthYear) as varchar)+'],'+'['+cast(dateadd(d,27,@RepMonthYear) as varchar)+']'

/*
set @query='select '+''''+@all+''''+' as Type,'+@cols+' from (
select Closing,RepMonth from SMS_BRD_ALL_ACTIVE where dbo.getFirstDate(RepMonth)='''+cast(@RepMonthYear as varchar)+''' 
)x pivot
   (
		sum(Closing) for RepMonth in ('+@cols+')
   )p
UNION ALL
select '+''''+@HD+''''+' as Type,'+@cols+' from (
select HDClosing,RepMonth from SMS_BRD_ALL_ACTIVE where dbo.getFirstDate(RepMonth)='''+cast(@RepMonthYear as varchar)+''' 
)x pivot
   (
		sum(HDClosing) for RepMonth in ('+@cols+')
   )p;'
*/
set @query='select 0 as Type,'+@cols+' from (
select Closing,RepMonth from SMS_BRD_ALL_ACTIVE where dbo.getFirstDate(RepMonth)='''+cast(@RepMonthYear as varchar)+''' 
)x pivot
   (
		sum(Closing) for RepMonth in ('+@cols+')
   )p
UNION ALL
select 1 as Type,'+@cols+' from (
select HDClosing,RepMonth from SMS_BRD_ALL_ACTIVE where dbo.getFirstDate(RepMonth)='''+cast(@RepMonthYear as varchar)+''' 
)x pivot
   (
		sum(HDClosing) for RepMonth in ('+@cols+')
   )p;'
--print(@query);
execute(@query);
End
GO

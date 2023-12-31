USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[rep_b_a_bill_report_head]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[rep_b_a_bill_report_head] @where as varchar(8000)=null
as
Begin
DECLARE @q VARCHAR(8000)
if @where is null
set @where=' and BillmonthYear=''''2011-04-01'''''
set @q='
Select SchemeId into #temp  
from sms_view_bill_a_sch_grouped where 1=1 '+ISNULL(replace(@where,'''''',''''),'')+' group by SchemeId order by SchemeId;
select a.*,b.Name from #temp a
left outer join  SMS_CONNECTIONSCHEME b on a.SchemeId=b.Id
where b.Id is not null
'
exec (@q)
end
GO

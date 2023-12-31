USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[rep_b_d_bill_report]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[rep_b_d_bill_report] @where as varchar(8000)=null,@paging as varchar(500)='',@sort as varchar(1000)=null,@rec as bit=1
as
Begin

DECLARE @q VARCHAR(8000)
DECLARE @q3 VARCHAR(8000)
DECLARE @q1 VARCHAR(8000)
DECLARE @q2 VARCHAR(8000)
DECLARE @col VARCHAR(100)
set @col='RateCount'
if @rec=0
set @col='RateCountV'


if @where is null
set @where=' and BillmonthYear=''''2011-04-01'''''
--set @where=' and BillmonthYear='''+cast(dbo.getFirstDate(GETDATE()) as varchar)+''''

set @q='
Select SchemeId into #temp1  
from sms_view_bill_d_sch_grouped where 1=1 '+ISNULL(replace(@where,'''''',''''),'')+' group by SchemeId order by SchemeId;
select a.*,b.Name as Name into  #temp from #temp1 a
left outer join  SMS_CONNECTIONSCHEME b on a.SchemeId=b.Id
where b.Id is not null ;'

set @q3='if(exists (Select * from  #temp ) and OBJECT_ID(''tempdb..#temp '')is not null)
begin
DECLARE @listCol VARCHAR(8000);
DECLARE @listCol2 VARCHAR(8000);
DECLARE @listCol3 VARCHAR(8000);
DECLARE @q VARCHAR(8000);
DECLARE @q1 VARCHAR(8000);
SELECT  @listCol = STUFF(( SELECT 
                                ''],['' +cast(SchemeId as varchar)+''|1],['' +cast(SchemeId as varchar)+''|0''
                        FROM    #temp
                        group by SchemeId
                        ORDER BY ''],['' + cast(SchemeId as varchar)
                        FOR XML PATH('''')
                                    ), 1, 2, '''') + '']''
,@listCol2 = STUFF(( SELECT ''],isnull(['' +cast(SchemeId as varchar)+''|1],0) as ['' +Name+''|Main],isnull(['' +cast(SchemeId as varchar)+''|0],0) as ['' +NAME+''|Entension''
                        FROM    #temp
                        group by SchemeId,Name
                        ORDER BY ''],['' + cast(SchemeId as varchar)
                        FOR XML PATH('''')
                                    ), 1, 2, '''') + '']''                                    
,@listCol3 = STUFF(( SELECT 
                                ''],''''[''''+isnull(['' +cast(SchemeId as varchar)+''|1],0)+'''',''''+isnull(['' +cast(SchemeId as varchar)+''|0],0)+'''']'''' as [C'' +cast(SchemeId as varchar)
                        FROM    #temp
                        group by SchemeId
                        ORDER BY ''],['' + cast(SchemeId as varchar)
                        FOR XML PATH('''')
                                    ), 1, 2, '''') + '']'' ';

if(ltrim(rtrim(@sort))='' or @sort is null)
set @sort=null

set @q2= '
set @q=''
SELECT AreaName,BillMonthYear,AreaId,SchemeRate,'+@col+' into #t1
 FROM sms_view_bill_d_sch_grouped where 1=1 '+ISNULL(dbo.procsafe(@where),'')+';   
SELECT Row_number()over ( '+isnull(@sort,' order by AreaName,AreaId')+') as RowIndex ,AreaName,BillMonthYear,AreaId,''+@listCol2+'' 
into #t FROM(SELECT AreaName,BillMonthYear,AreaId,SchemeRate,'+@col+'
 FROM #t1 ) AS SourceTable PIVOT
(min('+@col+') FOR SchemeRate IN (''+@listCol+'')
) AS PivotTable '';
set @q1='''';
'
set @q1='';
if(@rec=1)
	begin
	set @q1='Set @q1=''Select count(RowIndex)  as [Records] from #t x;''
	 '
	end

if(@paging is not null or ltrim(rtrim(@paging))='')
 begin
	set @q1=@q1+'Set @q1=@q1+''Select * from #t x where 1=1 '+@paging+''';'
 end
 else
 set @q1=@q1+'Set @q1=@q1+''Select * from #t x where 1=1;'''
 	
Set @q1=@q1+'
print(@q+ @q1)
exec(@q+ @q1)
End
Else
Begin'
if(@rec=1)
	begin
		Set @q1=@q1+'
		select 0 as [Records]'
	end
		 Set @q1=@q1+'
		 select ''No Record Found'' as [No Record Found] 
		 End'
--exec(@q+''+ @q1)
print (@q+@q3+@q2+@q1)
exec (@q+@q3+@q2+@q1)
--exec(@q+ @q1)
end
GO

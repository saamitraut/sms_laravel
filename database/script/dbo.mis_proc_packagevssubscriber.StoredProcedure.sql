USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[mis_proc_packagevssubscriber]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[mis_proc_packagevssubscriber] @where as varchar(8000)=null,
@paging as varchar(500)='',@sort as varchar(1000)=null,@rec as bit=1
as
begin


DECLARE @q VARCHAR(8000)
DECLARE @q1 VARCHAR(8000)
DECLARE @q2 VARCHAR(8000)
if(ltrim(rtrim(@sort))='' or @sort is null)
set @sort=null

if(ltrim(rtrim(@where))='' or @where is null)
set @where=null

set @q2='Select Row_Number() over ( '+isnull(@sort,' order by PackageId')+') as RowIndex ,
 y.PackageId,y.PackageName,y.CasCode,y.PackageType,y.SubsCount as Subscribed into #t from 
(
select x.PackageId,x.PackageName,x.CasCode,x.PackageType,
x.SubsCount from 
( 
select p.Id as PackageId, p.PackageName,p.CasCode,
case p.PackageType when 1 then ''HD'' else ''SD'' end as PackageType, COUNT(t.Id) as SubsCount 
from SMS_PACKAGE p left join SMS_SUBSCRIBERTRANSACTIONS t on p.Id=t.ProductId and t.IsAlacarte=0 
where 1=1 '+ISNULL(@where,' and 1=1 ')+'
group by p.Id,p.PackageName,p.CasCode,p.PackageType )x 
left outer join sms_view_account_package_not_assigned b on x.PackageId=b.Id 
group by x.PackageId,x.PackageName,x.CasCode,x.PackageType,x.SubsCount  ) y;'

set @q1='';

if(@rec=1)
	begin
	set @q1='Select count(RowIndex)  as [Records] from #t  x ;'
		--exec (@q);		
	end
if(@paging is not null or ltrim(rtrim(@paging))='')
 begin
 Set @q='Select *,''{"packageid":"''+cast(PackageId as varchar)+''","packagename":"''+cast(PackageName as varchar)+''","sb":"1","c":"''+cast(Subscribed as varchar)+''"}'' as SubscribedCout
  from  #t  x where 1=1 '+@paging
	exec (@q2+@q1+@q);
	print(@q2+@q1+@q)
End
End
GO

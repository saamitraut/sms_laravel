USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[mis_proc_packagevssubscriber_exp]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[mis_proc_packagevssubscriber_exp] @where as varchar(8000)=null
as
begin
DECLARE @q VARCHAR(8000)
DECLARE @q1 VARCHAR(8000)
DECLARE @q2 VARCHAR(8000)
if(ltrim(rtrim(@where))='' or @where is null)
set @where=null
set @q2='Select Row_Number() over (order by PackageId) as RowIndex ,
 y.PackageId,y.PackageName,y.CasCodeBCAS,y.PackageType,y.SubsCount as Subscribed,
y.NotSubsCount as NotSubscriber into #t from 
(
select x.PackageId,x.PackageName,x.CasCodeBCAS,x.PackageType,
x.SubsCount, COUNT(b.accountId) as NotSubsCount from 
( 
select p.Id as PackageId, p.PackageName,p.CasCodeBCAS,
case p.PackageType when 1 then ''HD'' else ''SD'' end as PackageType, COUNT(t.Id) as SubsCount 
from SMS_PACKAGE p left join 
[sms_view_package_tranaction] t on p.Id=t.ProductId and t.IsAlacarte=0 
where  DeactivationDate>=CAST(getdate() as date)'+ISNULL(@where,' and 1=1 ')+'
group by p.Id,p.PackageName,p.CasCodeBCAS,p.PackageType )x 
left outer join sms_view_account_package_not_assigned b on x.PackageId=b.Id 
group by x.PackageId,x.PackageName,x.CasCodeBCAS,x.PackageType,x.SubsCount  ) y;'
set @q1='';
Set @q='Select RowIndex as Id,PackageId,PackageName,CasCodeBCAS,PackageType,Subscribed as SubscribedCout
, NotSubscriber as NotSubscriberCout from  #t  x where 1=1 '
	exec (@q2+@q1+@q);
	print(@q2+@q1+@q)
End



GO

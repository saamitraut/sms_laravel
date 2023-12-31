USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[mis_proc_bouquevssubscriber_exp]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[mis_proc_bouquevssubscriber_exp] @where as varchar(8000)=null
as
BEGIN
DECLARE @q VARCHAR(8000)
DECLARE @q1 VARCHAR(8000)
DECLARE @q2 VARCHAR(8000)

if(ltrim(rtrim(@where))='' or @where is null)
set @where=null
set @q2='Select Row_Number() over (order by BouqueId) as RowIndex ,
y.BouqueId,y.BouqueName,y.BouqueCode,y.SubsCount as Subscribed into #t from (select p.Id as BouqueId, p.BouqueName,p.BouqueCode, COUNT(t.Id) as SubsCount from PRP_BOUQUE p left join 
PRP_ACCOUNTTRANSACTION t on p.Id=t.BouqueId 
left outer join sms_view_SubscriberAccountList b on t.AccountId=b.Id
left outer join sms_view_subscribers s on b.SubscriberId=s.Id where t.DeactivationDate>=CAST(GETDATE() as DATE) '+ISNULL(@where,' and 1=1 ')+'
group by p.Id,p.BouqueName,p.BouqueCode)y;'
set @q1='';
Set @q='Select RowIndex as Id,BouqueId,BouqueName,BouqueCode,subscribed as SubscribedCout from  #t  x where 1=1 '

exec (@q2+@q1+@q);
--print(@q2+@q1+@q)
END
GO

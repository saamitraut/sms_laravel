USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[mis_proc_ActHistory]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[mis_proc_ActHistory] @where as varchar(8000)=null,@stWhere as varchar(8000)='' ,@opwhere as varchar(8000)='' 
as  
begin  
  
DECLARE @q VARCHAR(8000)  
DECLARE @q1 VARCHAR(8000)  
DECLARE @q2 VARCHAR(8000)  
	
	if(OBJECT_ID('tempdb.dbo.#t_act_his') is not null)            
	drop table  #t_act_his    


if(ltrim(rtrim(@where))='' or @where is null)  
set @where=' and convert(varchar(10),insertedon,120)<=convert(varchar(10),getdate(),120)';
  
set @q2='select y.Id,y.CustomerId,y.SubscriberName,y.Operator,y.Area,y.MobileNo,y.smartcardNo  as smartcardNo,OperatorId,
y.STbno as Stbno,y.Description ,y.InsertedOn into #t_act_his
from (
select ROW_NUMBER() over(Partition by FID order by Id desc) as RID ,x.*  from(    
select a.Id as Id,a.FID ,b.CustomerId as CustomerId,b.SubscriberName as SubscriberName,b.Operator,b.OperatorId ,a.InsertedOn    
,b.Area as Area,b.AreaId as Areaid,b.MobileNo,a.Deleted  ,a.DMLAction as DMLaction    
,ISNULL(c.SmartcardNo,''PairingDel'') AS SmartcardNo ,Isnull(c.STBNo,''PairingDel'') as STBNo,a.CreatedOn as CreatedOn,Case When DMLAction=1 and a.Status=1 then ''Active''     
when DMLAction=4 then ''Disconnected'' when DMLAction=3 and a.deleted =1 then ''Disconnected'' when DMLAction=2 and a.status=0 then ''Suspended''   
when DMLAction=2 and a.status=1  then ''Active''     
 end as Description    
from SMS_SUBSCRIBERACCOUNTS_HISTORY a    
left join sms_view_subscribers b on a.SubscriberId=b.Id    
left join sms_view_pairing c on a.PairingId=c.Id
where 1=1 '+@where+') x 
)y where RID =1  '+@stWhere+' '+@opwhere+';'  
  
set @q1='';  
  
Set @q='select OperatorId,Operator,isnull([Active],0) as [Active],isnull([Suspended],0) as [Suspended],isnull([Disconnected],0) as [Disconnected] from 
  (select operator,OperatorId,isnull(COUNT(Id),0) as Accounts,Description   from #t_act_his  x where 1=1 and OperatorId is not null
  group by operator,OperatorId,Description  
   ) source
  pivot
  ( sum(Accounts)
  for Description in ([Active],[Suspended],[Disconnected])
  ) as P '  
 exec (@q2+@q1+@q);  
 print(@q2+@q1+@q)  
End  

GO

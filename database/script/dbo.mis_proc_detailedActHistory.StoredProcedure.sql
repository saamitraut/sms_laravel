USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[mis_proc_detailedActHistory]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[mis_proc_detailedActHistory] @where as varchar(8000)=null,@stWhere as varchar(8000)='' ,@opwhere as varchar(8000)='' 
as  
begin  
  
DECLARE @q VARCHAR(8000)  
DECLARE @q1 VARCHAR(8000)  
DECLARE @q2 VARCHAR(8000)  
  
if(ltrim(rtrim(@where))='' or @where is null)  
set @where=' and convert(varchar(10),insertedon,120)<=convert(varchar(10),getdate(),120)';
  
set @q2='select y.Id,y.CustomerId,y.SubscriberName,y.Operator,y.Area,y.MobileNo,y.smartcardNo  as smartcardNo,OperatorId,
y.STbno as Stbno,y.Description ,y.CreatedOn into #t_act_his
from (
select ROW_NUMBER() over(Partition by FID order by Id desc) as RID ,*  from(    
select a.Id as Id,FID ,b.CustomerId as CustomerId,b.SubscriberName as SubscriberName,b.Operator,b.OperatorId ,a.InsertedOn    
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
  
Set @q='Select Id,CustomerId,SubscriberName,Operator,Area,MobileNo,smartcardNo  as smartcardNo,
STbno as Stbno,Description ,CreatedOn from  #t_act_his  x where 1=1 and Operator is not null'  
 exec (@q2+@q1+@q);  
 print(@q2+@q1+@q)  
End  
  

GO

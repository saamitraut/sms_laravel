USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[mis_proc_alacartevssubscriber_exp]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[mis_proc_alacartevssubscriber_exp] @where as varchar(8000)=null
as
begin
DECLARE @q VARCHAR(8000)
DECLARE @q1 VARCHAR(8000)
DECLARE @q2 VARCHAR(8000)

if(ltrim(rtrim(@where))='' or @where is null)
set @where=null

set @q2='Select Row_Number() over (order by ChannelName,ChannelId) as RowIndex ,
x.ChannelId,x.ChannelName,x.CasCodeBcas,x.Broadcaster,x.ChannelType,
x.SubsCount into #t from (
select p.Id as ChannelId, p.ChannelName,p.CasCodeBcas,p.BROADCASTERNAME as Broadcaster,
case p.ChannelType when 1 then ''HD'' else ''SD'' end as ChannelType, COUNT(t.Id) as SubsCount 
from (select a.*,b.BROADCASTERNAME from SMS_CHANNEL a
left outer join SMS_BROADCASTER b on a.BroadcasterId=b.ID
) p left join [sms_view_alacarte_tranaction] t on p.Id=t.ProductId and t.IsAlacarte=1 
where DeactivationDate>=CAST(getdate() as date) '+ISNULL(@where,' and 1=1 ')+'
group by p.Id,p.ChannelName,p.CasCodeBcas,p.BROADCASTERNAME,p.ChannelType )x where SubsCount>0 '

set @q1='';

 Set @q='Select RowIndex as Id,ChannelId,Channelname,CasCodeBcas,ChannelType,SubsCount as SubscribedCout   
  from  #t  x where 1=1 '
	
	print(@q2+@q1+@q)
	exec (@q2+@q1+@q);

End
GO

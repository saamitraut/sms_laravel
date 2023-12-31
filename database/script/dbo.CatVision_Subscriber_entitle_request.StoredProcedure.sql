USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[CatVision_Subscriber_entitle_request]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CatVision_Subscriber_entitle_request] @accountid bigint,@createdBy as bigint
AS
begin
--Open Account Request
insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,Status,Command_Param,ActivationDate,DeactivationDate,Remark,CommandDate,CreatedOn,CreatedBy,Command)
select top 1 '60005512' as SmartCardNo,-1 as SmartCardId,'60005512' as STBNo,-1 as StbId,a.SubscriberId,a.Id as AccountId,
'101' as CommandId,
'Subscriber_entitle_request' as CommandName,
Status,'103' as Command_Param,ActivationDate,DeactivationDate,Remark,getdate() as CommandDate,CreatedOn,CreatedBy,
dbo.fn_varbintostr_('2',2) --Protocol Version
+dbo.fn_varbintostr_('101',4) --Message Type
+dbo.fn_varbintostr_(Len('0001'+dbo.fn_varbintostr_(Len('101'),4)+'101'
+'0002'+dbo.fn_varbintostr_(len('60005512'),4)+cast('60005512' as varchar)
+'0003'+dbo.fn_varbintostr_(len('5A'+'1001'+dbo.fn_varbintostr_(datepart(year,dateadd(m,1,getdate())),4)
+dbo.fn_varbintostr_(datepart(month,dateadd(m,1,getdate())),2)+dbo.fn_varbintostr_(datepart(day,dateadd(m,1,getdate())),2)),4)
+'5A'+'1001'+dbo.fn_varbintostr_(datepart(year,dateadd(m,1,getdate())),4)
+dbo.fn_varbintostr_(datepart(month,dateadd(m,1,getdate())),2)+dbo.fn_varbintostr_(datepart(day,dateadd(m,1,getdate())),2)),4) 
--Message Length
--Para Type,para Len,para value
+'0001'+dbo.fn_varbintostr_(Len('101'),4)+'101' -- cascode
+'0002'+dbo.fn_varbintostr_(len('60005512'),4)+cast('60005512' as varchar) -- smart card no 
-- entitalment data
+'0003'+dbo.fn_varbintostr_(len('5A'+'1001'+dbo.fn_varbintostr_(datepart(year,dateadd(m,1,getdate())),4)
+dbo.fn_varbintostr_(datepart(month,dateadd(m,1,getdate())),2)+dbo.fn_varbintostr_(datepart(day,dateadd(m,1,getdate())),2)),4)
+'5A'+'1001'+dbo.fn_varbintostr_(datepart(year,dateadd(m,1,getdate())),4)
+dbo.fn_varbintostr_(datepart(month,dateadd(m,1,getdate())),2)+dbo.fn_varbintostr_(datepart(day,dateadd(m,1,getdate())),2)
from sms_view_SubscriberAccountList a where a.Id=1
End
GO

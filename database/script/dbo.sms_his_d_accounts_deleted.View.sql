USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_his_d_accounts_deleted]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sms_his_d_accounts_deleted] as
select top 100 Percent ROW_NUMBER()over(Order by DoneON)as RID,* from 
(
select a.*,isnull(b.LOGINID,'System') as DoneBy,cast(convert(varchar(16),InsertedOn,120)as Datetime) as DoneOn
from sms_his_d_accounts a
left outer join SMS_ACCESS b on a.InsertedBy=b.Id 
--where a.FId not in (Select ID from SMS_SUBSCRIBERACCOUNTS) 
)x
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_his_subscriber]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_his_subscriber] as
select a.*,isnull(b.LOGINID,'System') as DoneBy,cast(convert(varchar(16),InsertedOn,120)as Datetime) as DoneOn  from sms_his_subscriber_1 a
left outer join SMS_ACCESS b on a.InsertedBy=b.Id where a.DMLACTION=2
GO

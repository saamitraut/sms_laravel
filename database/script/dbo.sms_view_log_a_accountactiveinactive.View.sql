USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_log_a_accountactiveinactive]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_log_a_accountactiveinactive]   
as
Select a.* from SMS_Z_A_ACTIVEINACTIVE_LOG a
left outer join 
(
Select MAX(Id) as Mid,DateTime,accountId from SMS_Z_A_ACTIVEINACTIVE_LOG group by accountId,DateTime
) b on a.Id=b.Mid and a.accountId =b.accountId  where b.Mid is not null
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_complaintaccounts]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_complaintaccounts] as
select a.* ,b.text,b.title,b.Status
from SLA_COMPLAINTACCOUNTS a
left outer join sla_view_subscriber_all_connections b 
on a.Accountid=b.AccountId and a.ServiceType=b.ServiceType
where b.Id is not null
GO

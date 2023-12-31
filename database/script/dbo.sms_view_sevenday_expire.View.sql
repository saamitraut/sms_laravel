USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_sevenday_expire]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_sevenday_expire] as

select a.Id,a.BouqueCode,a.BouqueName,b.Operator,count(b.Id) as SubscriberCount,b.OperatorId from PRP_BOUQUE a 
left outer join prp_account_grouped_deactivation b on a.Id=b.BouqueId 
inner join prp_view_operator_prebouque c on b.BouqueId=c.BouqueId and b.OperatorId=c.OperatorId 
where b.Deactivationdate between getdate() and dateadd(D,8,getdate()) and a.Status=1 and 
b.Deactivationdate between getdate() and dateadd(D,8,getdate()) and a.Status=1
group by a.Id,a.BouqueCode,a.BouqueName,b.OperatorId,b.Operator

GO

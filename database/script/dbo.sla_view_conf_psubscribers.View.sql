USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_conf_psubscribers]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view[dbo].[sla_view_conf_psubscribers] as  
select a.* from sla_view_psubscribers a  
left outer join SMS_SUBSCRIBERS b on a.Id=b.ProspectId  
where b.Id is null  
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_complaintList]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_complaintList] as 
Select a.*,d.CalltypeId,
a.CREATEDON as OpenedOn,dbo.getUserLoginId(a.EnteredFrom,a.CreatedBy) as OpenedBy,
d.Title  as SubCallType,d.Code as SubCallTypeCode,d.CallTypeTitle as CallType,d.CallTypeCode as CallTypeCode,
isnull(b.Reply,'--') as LastReply,isnull(b.RepliedBy,'--') as LastRepliedBy,b.CreatedOn as LastRepliedOn
,isnull(c.Reply,'--') as ClosedReply,isnull(c.RepliedBy,'--') as ClosedBy,c.CreatedOn as ClosedOn
from SLA_COMPLAINT a 
left join sla_view_calltypelist d on a.SubCallId=d.Id
left join sla_view_replies b on a.LastReplyId=b.Id
left join sla_view_replies c on a.ClosedReplyId=c.Id
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_access]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_access] as
select a.ID,a.NAME,a.LOGINID,a.PASSWORD,a.STATUS,a.CREATEDON,a.UPDATEDON,a.CREATEDBY,a.UPDATEDBY,isnull(OperatorID,0) as OperatorID,
a.Remark,a.deleted,a.sms_id,USERTYPE,isnull(b.NAME,'') as OperatorName,isnull(b.ParentId,0) as ParentOperatorId 
from SMS_ACCESS a
left outer join SMS_OPERATOR b on a.OperatorID=b.id
GO

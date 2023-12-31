USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_operator]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_operator] as
SELECT a.AreaId as AreaId,a.ID,a.CODE,a.TobeBilled, a.NAME, a.CONTACTPERSON, a.ParentId, a.ADDRESS,a.MOBILE, a.Email, a.PHONE,a.branch as BranchId, 
a.STATUS,n.Name as Branch,a.CREATEDON, a.UPDATEDON,a.CREATEDBY,a.UPDATEDBY,a.Deleted,a.Remark,b.LOGINID,b.ID as AccessId,b.PASSWORD as [Password],a.BillingFrom,
c.NAME as ParentOperator,c.CODE as ParentOpCode FROM dbo.SMS_OPERATOR AS a
left outer join SMS_ACCESS b on a.ID=b.OperatorID
left outer join SMS_OPERATOR c on a.ParentId=c.ID
left outer join SMS_BRANCH n on n.ID=a.branch
GO

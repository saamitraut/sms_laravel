USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_d_b_collection]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_d_b_collection] as 
select SUM(Amount) as CollectedAmount,sum(c.BillAmount) as TotalBillAmount, COUNT(c.id) as TotalBill
,b.Operator as Operator,b.Area as Area,SUM(TaxAmount) as TaxAmount,SUM(c.CurrentCharges) as CurrentCharges
,b.AreaId as AreaId,b.OperatorId as OperatorId,b.SocietyName as SocietyName,b.ParentOperator as ParentOperator
,b.SocietyId as SocietyId,b.ParentOperatorId as ParentOperatorId
 from SMS_BILLCOLLECTION a
left outer join sms_view_subscribers b on a.SubscriberId=b.Id
left outer join SMS_B_D_INVOICE c on a.InvoiceId=c.Id
group by b.Operator,b.Area,b.OperatorId,b.AreaId,b.SocietyId,b.ParentOperatorId,b.SocietyName,b.ParentOperator
GO

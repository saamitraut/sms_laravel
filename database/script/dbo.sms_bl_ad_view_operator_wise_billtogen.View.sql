USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_bl_ad_view_operator_wise_billtogen]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_bl_ad_view_operator_wise_billtogen] as
 Select *
FROM(SELECT OperatorId,NextInvoiceMonth,Operator,Billcount,ServiceType
 FROM (
Select OperatorId,NextInvoiceMonth,Operator,Billcount,0 as ServiceType from  
sms_bl_a_view_operator_wise_billtogen a
union 
Select OperatorId,NextInvoiceMonth,Operator,Billcount,1 as ServiceType from  
sms_bl_a_view_operator_wise_billtogen a
) x  ) AS SourceTable PIVOT
(sum(Billcount) FOR ServiceType IN ([1],[0])
) AS PivotTable
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_bl_ad_view_area_wise_billtogen]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_bl_ad_view_area_wise_billtogen] as
SELECT Row_number()over (  order by Area,AreaId) as RowIndex ,AreaId,Area,NextInvoiceMonth,isnull([0] ,0) as Analog,isnull([1],0) as Digital
FROM(SELECT Area,NextInvoiceMonth,AreaId,Billcount,ServiceType
 FROM (
Select AreaId,Area,Billcount,NextInvoiceMonth,0 as ServiceType from  
[sms_bl_a_view_area_wise_billtogen] a
union 
Select AreaId,Area,Billcount,NextInvoiceMonth,1 as ServiceType from  
[sms_bl_d_view_area_wise_billtogen] a
) x  ) AS SourceTable PIVOT
(sum(Billcount) FOR ServiceType IN ([1],[0])
) AS PivotTable
GO

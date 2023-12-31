USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_bl_ad_view_soceity_wise_billtogen]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_bl_ad_view_soceity_wise_billtogen] as
SELECT SocietyId,NextInvoiceMonth,AreaId,SocietyName,SocietyCode,AreaName,isnull([0] ,0) as Analog,isnull([1],0) as Digital
FROM(SELECT SocietyId,NextInvoiceMonth,AreaId,SocietyName,SocietyCode,AreaName,Billcount,ServiceType
 FROM (
Select SocietyId,NextInvoiceMonth,AreaId,SocietyName,SocietyCode,AreaName,Billcount,0 as ServiceType from  
sms_bl_a_view_soceity_wise_billtogen a
union 
Select SocietyId,NextInvoiceMonth,AreaId,SocietyName,SocietyCode,AreaName,Billcount,1 as ServiceType from  
sms_bl_d_view_soceity_wise_billtogen a
) x  ) AS SourceTable PIVOT
(sum(Billcount) FOR ServiceType IN ([1],[0])
) AS PivotTable
GO

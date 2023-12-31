USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_brandvsstb]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[sms_view_brandvsstb] as 
Select  BrandId as ID,BrandTitle,Type,isnull([Issued],0) as[Issued] ,isnull([PairedQC],0) as[PairedQC] ,isnull([PairedStock],0) as[PairedStock] ,
isnull([Instock],0) as [Instock] ,isnull([Faulty],0) as [Faulty] ,isnull([BlackList],0) as [BlackList] ,
(isnull([Issued],0)+isnull([PairedQC],0)+isnull([PairedStock],0)+isnull([Instock],0)+isnull([Faulty],0)+isnull([BlackList],0)) as Total
from (
Select COUNT(STBNo) as STB, BrandId,BrandTitle,Type,Status from sms_view_stbdetailstaus
group by BrandId,BrandTitle,Type,Status
)as p 
pivot(
sum(STB) for Status in ([Issued],[PairedQC],[PairedStock],[Instock],[Faulty],[BlackList])
)AS PivotTable

GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_mview_inventory_summary_Gospel]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_mview_inventory_summary_Gospel] as 
SELECT ROW_NUMBER() over(order by Inventory) as Id,Inventory,(isnull([Pairing Stock],0)+isnull([Issued],0)+isnull([QC],0)+isnull([Pairing QC],0)+isnull([Faulty],0)+isnull([Blacklisted],0)) as Total
,isnull([Issued],0) as [Issued],isnull([Pairing Stock],0) as [Pairing Stock]
,isnull([Pairing QC],0) as [Pairing QC],isnull([QC],0)as [QC],isnull([Faulty],0) as [Faulty],isnull([Blacklisted],0) as [Blacklisted]
FROM
(Select 'STB' as Inventory,COUNT(Id) as Cnt,[State] from sms_view_r_stbstate where CASTYPEID=1 group by [State]
 union
 Select 'Smartcard' as Inventory,COUNT(Id) as Cnt,[State] from sms_view_r_scstate where CASTYPEID=1 group by [State]
 ) AS SourceTable
PIVOT
(sum(Cnt) FOR [State] IN ( [Pairing Stock],[Issued],[QC],[Pairing QC],[Faulty],[Blacklisted])
) AS PivotTable
GO

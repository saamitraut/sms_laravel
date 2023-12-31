USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_operator_prebouque]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[prp_view_operator_prebouque] as    
select a.*,b.AType,b.BType,b.BouqueCode,b.BouqueName,b.Rate,b.isRio,b.RIOAlaCarte1Count,b.RIOAlaCarte2Count,b.PackageTypeId from SMS_OPERATOR_ASSETS a    
left outer join PRP_BOUQUE b on a.BouqueId=b.Id    
where b.Id is not null and b.Status=1 
GO

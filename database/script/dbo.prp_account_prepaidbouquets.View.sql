USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_account_prepaidbouquets]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[prp_account_prepaidbouquets] as          
select a.*,b.BouqueCode,b.BType,b.BouqueName,b.Packages,b.PackageID,b.Channels,b.ChannelID ,b.AType,  
case when DATEPART(M,a.ActivationDate)=2 then 
	case when datediff(D,a.ActivationDate,a.DeactivationDate)>=28 then datediff(m,a.ActivationDate,a.DeactivationDate) else 0 end     
else 
	case when datediff(D,a.ActivationDate,a.DeactivationDate)>=30 then datediff(m,a.ActivationDate,a.DeactivationDate) else 0 end 
end as Monthofact,
case when datediff(m,a.ActivationDate,a.DeactivationDate) >0 then         
a.Rate*datediff(m,a.ActivationDate,a.DeactivationDate) else a.Rate/2 end as DISPRATE        
from prp_view_account_bouque_transaction a          
left outer join prp_view_bouques b on a.BouqueId=b.id          
where b.Id is not null and a.ExpStatus=1 
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_bouques]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_view_bouques] as    
select c.*,case when c.isRio=0 then 'No' else 'Yes' end as isRIOBouques , 
PackageID =isnull(cast(substring     
                          ((SELECT     ('~' + cast(t2.PackageId as varchar))    
                              FROM         PRP_BOUQUE_ASSETS t2    
                              WHERE    t2.PackageId is not null and t2.BouqueId=c.ID    
                              ORDER BY t2.PackageId FOR XML PATH('')),2,8000) as varchar(8000)),0),    
Packages=isnull(cast(substring     
                          ((SELECT     ('~' + cast(p.PackageName as varchar))    
                              FROM         PRP_BOUQUE_ASSETS t2    
                              left outer join SMS_PACKAGE p on t2.PackageId=p.Id    
                              WHERE    t2.PackageId is not null and t2.BouqueId=c.ID    
                              and p.Id is not null    
                              ORDER BY t2.PackageId FOR XML PATH('')),2,8000) as varchar(8000)),0),    
                                  
ChannelID =isnull(cast(substring     
                          ((SELECT     ('~' + cast(t2.ChannelId as varchar))    
                              FROM         PRP_BOUQUE_ASSETS t2    
                              WHERE    t2.ChannelId is not null and t2.BouqueId=c.ID    
                             ORDER BY t2.ChannelId FOR XML PATH('')),2,8000) as varchar(8000)),0),    
Channels=isnull(cast(substring     
                          ((SELECT     ('~' + cast(p.ChannelName as varchar))    
                              FROM         PRP_BOUQUE_ASSETS t2    
                              left outer join SMS_CHANNEL p on t2.ChannelId=p.Id    
                              WHERE    t2.ChannelId is not null and t2.BouqueId=c.ID    
                              and p.Id is not null    
                              ORDER BY t2.PackageId FOR XML PATH('')),2,8000) as varchar(8000)),0)    
                                 
from PRP_BOUQUE c 
GO

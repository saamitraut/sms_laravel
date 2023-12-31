USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_packagevschannel]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_packagevschannel] as 

Select p.Id,p.CasCode as PackageCode,p.PackageName,p.Price,(case when p.Status='1' then 'Active' else 'InActive' end) as Status,

(select COUNT(*) from SMS_CHANNELINPACKAGE where PackageId=p.Id) as PackageCount,

 Channel =CAST( substring

              ((SELECT  (',' + cast(t.ChannelName AS varchar(8000))) 

				from sms_view_packvschan t

				where p.Id=t.PackageId

                  ORDER BY t.Id FOR XML PATH('')), 2, 8000) as varchar(8000)) 

from SMS_PACKAGE  p
GO

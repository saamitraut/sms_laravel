USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_ConnectionScheme]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_ConnectionScheme] as
select c.*,
'{id:'+cast(c.ID as varchar)+'}' As Action,
PackageID =isnull(cast(substring 
                          ((SELECT     ('~' + cast(t2.PackageId as varchar))
                              FROM         SMS_PACKAGEINSCHEME t2
                              WHERE    t2.IsAlacarte='0' and t2.ConnectionId=c.ID
                              ORDER BY t2.PackageId FOR XML PATH('')),2,8000) as varchar(8000)),0),
AlacarteID=isnull(cast(substring 
                          ((SELECT     ('~' + cast(t2.PackageId as varchar))
                              FROM         SMS_PACKAGEINSCHEME t2
                              WHERE    t2.IsAlacarte='1' and t2.ConnectionId=c.ID
                              ORDER BY t2.PackageId FOR XML PATH('')),2,8000) as varchar(8000)),0),
Package=cast(substring 
                          ((SELECT     (',' + cast(p.PackageName as varchar))
                              FROM         SMS_PACKAGEINSCHEME t2 left join SMS_PACKAGE p on p.Id=t2.PackageId
                              WHERE    t2.IsAlacarte='0' and t2.ConnectionId=c.ID
                              ORDER BY t2.PackageId FOR XML PATH('')),2,8000) as varchar(8000)),
Alacarte=cast(substring 
                          ((SELECT     (',' + cast(p.ChannelName as varchar))
                              FROM         SMS_PACKAGEINSCHEME t2 left join SMS_Channel p on p.Id=t2.PackageId
                              WHERE    t2.IsAlacarte='1' and t2.ConnectionId=c.ID
                              ORDER BY t2.PackageId FOR XML PATH('')),2,8000) as varchar(8000))
,
Brands=cast(substring 
                          ((SELECT     (',' + cast(p.BrandTitle+case p.BoxType when 1 then '(HD)' else '(SD)' end as varchar))
                              FROM         SMS_SCHEME_BRANDMAPPING t2 left join SMS_STBSCBRAND p on p.Id=t2.BrandId
                              WHERE    t2.SchemeId=c.ID
                              ORDER BY t2.BrandId FOR XML PATH('')),2,8000) as varchar(8000))    
,BrandIds=isnull(cast(substring 
                          ((SELECT     (',' + cast(t2.BrandId as varchar))
                              FROM         SMS_SCHEME_BRANDMAPPING t2 
                              WHERE    t2.SchemeId=c.ID
                              ORDER BY t2.BrandId FOR XML PATH('')),2,8000) as varchar(8000)),0)   
,ChargesId=isnull(cast(substring 
                          ((SELECT     (',' + cast(t2.ChargeId as varchar))
                              FROM         SMS_SCHEMECHARGEMAPING t2 
                              WHERE    t2.SchemeId=c.ID
                              ORDER BY t2.ChargeId FOR XML PATH('')),2,8000) as varchar(8000)),0)
,ChargesId_Rates=isnull(cast(substring 
                          ((SELECT     (',' + cast(t2.ChargeId as varchar)+':'+cast(t2.Amount as varchar)+':'+cast(t2.Amount2 as varchar))
                              FROM         SMS_SCHEMECHARGEMAPING t2 
                              WHERE    t2.SchemeId=c.ID
                              ORDER BY t2.ChargeId FOR XML PATH('')),2,8000) as varchar(8000)),0)                              


from SMS_CONNECTIONSCHEME c
GO

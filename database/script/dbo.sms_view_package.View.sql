USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_package]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_package]  
as  
SELECT     a.*,  
 ChannelsName=cast(substring   
                          ((SELECT     ('~' + ChannelName)  
                             FROM         sms_view_channelinpackage t2  
                              WHERE     t2.PackageId = a.Id  
                              ORDER BY ChannelName, ChannelId FOR XML PATH('')),2,8000) as varchar(8000))  
,ChannelIds=cast(substring   
                          ((SELECT     (',' + cast(ChannelId as varchar))  
                              FROM         sms_view_channelinpackage t2  
                              WHERE     t2.PackageId = a.Id  
    ORDER BY ChannelName, ChannelId FOR XML PATH('')),2,8000) as varchar(8000))  ,ChannelCasCodes=cast(substring   
                          ((SELECT     ('~' + cast(CasCodeBCas as varchar))  
                              FROM         sms_view_channelinpackage t2  
                              WHERE     t2.PackageId = a.Id  
                              ORDER BY ChannelName, ChannelId FOR XML PATH('')),2,8000) as varchar(8000))  
,Channels=(Select Count(Id) from SMS_CHANNELINPACKAGE where PackageId=a.Id)  
,BroadcasterPrice=isnull((Select sum(BroadcasterPrice) from SMS_CHANNELINPACKAGE where PackageId=a.Id),0)  
FROM         SMS_PACKAGE a  
GO

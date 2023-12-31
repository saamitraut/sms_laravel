USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_packvschan]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sms_view_packvschan]
as 
SELECT    t.*,c.ChannelName,c.CasCode as ChannelCasCode
                  FROM         SMS_CHANNELINPACKAGE t left join  SMS_CHANNEL c on t.ChannelId=c.Id
                  WHERE     t.IsSubPack=0
                  
                  union
SELECT     u.*,v.Name as ChannelName,0 as ChannelCasCode
                  FROM         SMS_CHANNELINPACKAGE u left join  SMS_SUBSIDIARY_MASTER v on u.ChannelId=v.Id
                  WHERE     u.IsSubPack=1 

GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[abv_sms_package_channel_codes]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[abv_sms_package_channel_codes] as

Select Id,PackageName as Name,CasCode as Code,0 as IsAlacarte  from SMS_PACKAGE a where isnull(CasCode,0)>0

Union

Select Id,ChannelName as Name,CasCode as Code,1 as IsAlacarte  from SMS_CHANNEL a

where isnull(CasCode,0) not in(Select CasCode from SMS_PACKAGE where  isnull(CasCode,0)>0) and isnull(CasCode,0)>0
GO

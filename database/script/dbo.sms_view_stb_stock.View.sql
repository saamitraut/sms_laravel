USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_stb_stock]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_stb_stock] as
Select isnull(casname,'ABV') as CasNAMEE,* from sms_view_stb where PairingId=0 and AccountId=0 and Status=1
GO

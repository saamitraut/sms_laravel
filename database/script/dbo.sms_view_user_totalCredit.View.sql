USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_user_totalCredit]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_user_totalCredit] as  
Select a.TopedUpUserId,sum(ISNULL(a.Amount,0)) as TotalCredit from SMS_VIRTUAL_WALLET_USER a where a.TopedUpUserId is not null 
and a.TopedUpUserId!=0 group by a.TopedUpUserId
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_user_totalDebit]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_user_totalDebit] as  
Select a.TopUpDoneByUserId,sum(ISNULL(a.Amount,0)) as TotalDebit from SMS_VIRTUAL_WALLET_USER a where a.TopUpDoneByUserId is not null 
and a.TopUpDoneByUserId!=0 group by a.TopUpDoneByUserId
GO

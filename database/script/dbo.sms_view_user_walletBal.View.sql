USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_user_walletBal]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_user_walletBal] as  
Select a.*,ISNULL(b.TotalCredit,0) as TotalCrAmt,(ISNULL(c.TotalDebit,0)) as TotalDebitAmt,
round((ISNULL(b.TotalCredit,0))-(ISNULL(c.TotalDebit,0)),2) as WalletBalance from SMS_ACCESS a 
left join sms_view_user_totalCredit b on a.id=b.TopedUpUserId
left join sms_view_user_totalDebit c on a.id=c.TopUpDoneByUserId
GO

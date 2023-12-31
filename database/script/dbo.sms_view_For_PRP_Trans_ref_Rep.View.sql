USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_For_PRP_Trans_ref_Rep]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_For_PRP_Trans_ref_Rep] as  



Select a.id,a.AccountId,c.BouqueName,((a.rate/30)*DATEDIFF(DAY,ActivationDate,DeactivationDate)) as ActualAmt,a.Amount as RefundedAmt,



InsertedOn as RefundedOn,a.ActivationDate,a.DeactivationDate,



a.OperatorId as OperatorId,b.Name as Operator,a.LCOSharing



from PRP_ACCOUNTTRANSACTION_HISTORY a 



left join SMS_OPERATOR b on a.OperatorId=b.id 



left join PRP_BOUQUE c on a.BouqueId=c.id



where a.Remark='Amount-Refunded by Proc' and b.id is not null
GO

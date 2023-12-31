USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_user_creditdebitlog]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_user_creditdebitlog] as
select * from (
select a.Id,a.OperatorId,'Credit' as transtype,b.NAME,0 as DebitAmount,a.Amount as CreditAmount,0 as RefundAmount,a.CreatedOn as creditdate,a.CreatedOn as debitadate,a.CreatedBy,a.Remark 
from PRP_OPERATOR_CREDIT a
left join SMS_OPERATOR b on b.ID=a.OperatorId

union all

select a.id,a.OperatorId,'Credit' as transtype,b.NAME,0 as DebitAmount,0 as CreditAmount,a.Amount as RefundAmount,a.InsertedOn as creditdate,a.InsertedOn as debitadate,a.CreatedBy,a.Remark 
from PRP_ACCOUNTTRANSACTION_HISTORY a 
left join SMS_OPERATOR b on b.ID=a.OperatorId
WHERE a.Remark='Amount-Refunded by Proc'--and OperatorId=10009

union all

select a.id,a.OperatorId,'Debit' as transtype,b.NAME,a.Amount as DebitAmount,0 as CreditAmount,0 as RefundAmount,a.CreatedOn as creditdate,a.CreatedOn as debitadate,a.CreatedBy,a.Remark
from PRP_ACCOUNTTRANSACTION_HISTORY a left join SMS_OPERATOR b on b.ID=a.OperatorId WHERE  a.DMLAction=1



)z --where z.OperatorId=10009








GO

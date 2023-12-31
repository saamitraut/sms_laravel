USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_operator_credit]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[prp_view_operator_credit] as
select a.OperatorId,a.Id,a.Description,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted,a.Remark,a.CreditDate,a.ReceiptNo,a.PaymentMode,a.BankName,
a.ChequeNo,a.ChequeDate,a.Amount as CreditAmount,case a.TransType when 1 then case when a.PaymentMode=2 then 'Online Payment' 
else 'Operator Credit' end when 2 then 'Transaction Refund' when 3 then 'Online Payment' end as TransType from PRP_OPERATOR_CREDIT a
union all 
select a.OperatorId,0,'LCOSharing+NCFSharing',GETDATE(),1,NULL,Null,0,'TotalLCOSharing',GETDATE(),'NA',7,NULL,NULL,NULL,TotalLCOSharing as CreditAmount,'TotalLCOSharing' as TransType 
from prp_view_LCOSharing a
union all
select b.OperatorID,0,'TOPUPED_BY_PARENTOPER',GETDATE(),1,NULL,NULL,0,'TOPUPED_BY_PARENTOPER',GETDATE(),'NA',8,NULL,NULL,NULL,TotalCredit as CreditAmount,'TOPUPED_BY_PARENTOPER' as TransType 
from sms_view_user_totalCredit a left join SMS_ACCESS b on a.TopedUpUserId=b.ID where a.TopedUpUserId is not null and b.ID is not null
and OperatorID not in (Select id from SMS_OPERATOR where ParentId=0)
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_advancepayments]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_advancepayments] as
Select a.*,a.Amount-isnull(SUM(b.AmountAdjusted),0) as Balance, isnull(SUM(b.AmountAdjusted),0) as AmountAdjusted,case COUNT(b.Id) when 0 then 0 else 1 end as IsAdjusted from SMS_ADVANCEPAYMENTS a
left outer join SMS_ADVANCEPAYMENT_TRANSACTIONS b on a.id=b.AdvanceId
group by 
a.Id,a.SubscriberId,a.AccountId,a.ServiceType,a.Amount,a.StartingMonth,a.RecieptId,a.RecieptDate,a.ReasonId,a.Description,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted,a.Remark
GO

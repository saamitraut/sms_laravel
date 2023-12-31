USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_prp_account_transaction]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_prp_account_transaction] as

select a.Id,a.AccountId,a.Rate,a.Amount,a.BouqueId,a.Status,a.ActivationDate,a.DeactivationDate,a.CreatedOn,a.CreatedBy,
a.UpdatedBy,a.UpdatedOn,a.Remark,a.OperatorId,a.SessionFlag,a.CASStatus,a.IsAutoRenew,
b.ProductId,b.ProductName,b.IsAlacarte,b.CasCode,b.CasCodeNSTV--,b.CasCode
 from PRP_ACCOUNTTRANSACTION a
left join [prp_view_Bou_pack_channel_cascode] b on a.BouqueId=b.BouqueId
GO

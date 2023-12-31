USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_account_bouque_transaction_all]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[prp_view_account_bouque_transaction_all] as
select FID as Id,AccountId,Rate,Amount,BouqueId,Status,ActivationDate,DeactivationDate,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,Deleted,Remark,OperatorId,
Case when Deleted=1 then 0 else Status & Case when a.DeactivationDate>Cast(GETDATE() as date) then 1 else 0 end end ExpStatus,InsertedOn,CreatedBy as InsertedBy
from prp_view_accounttrans_all a 
GO

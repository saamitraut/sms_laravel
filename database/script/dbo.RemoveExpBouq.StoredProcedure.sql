USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[RemoveExpBouq]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RemoveExpBouq] As
Begin
--select * from PRP_ACCOUNTTRANSACTION  where cast(DeactivationDate as date)<=cast(getdate() as date)
Update PRP_ACCOUNTTRANSACTION set Deleted=1,Status=0,Remark='Expire Bouquet Remove' 
where cast(DeactivationDate as date)<=cast(getdate() as date)

End
GO

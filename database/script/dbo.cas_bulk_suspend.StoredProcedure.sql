USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_bulk_suspend]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cas_bulk_suspend] @pairingid varchar(8000), @UserId as bigint AS 
Begin
Declare @AccountId as bigint
Declare @actiondate as date=getdate()


	select b.PairingId,b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.Id as AccountId,GETDATE() as CommandDate,@UserId as CreatedBy,b.CASTYPEID 
	into #temp_pairings from dbo.[Split_coma](@pairingid) a
	left outer join sms_view_SubscriberAccountList b on a.items=b.Id where b.Id is not null and b.Status=1


	while (exists(Select AccountId from #temp_pairings))
				Begin
					Select top 1 @AccountId=AccountId From #temp_pairings
					exec d_suspend_resume_account @AccountId,@actiondate,'BULK_SUSPEND_ACCOUNT_[cas_bulk_suspend]',1,@UserId
					Delete from #temp_pairings where AccountId=@AccountId
				End	
		

end
GO

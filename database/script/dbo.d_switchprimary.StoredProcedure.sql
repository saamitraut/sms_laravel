USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[d_switchprimary]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[d_switchprimary] @primaryId as bigint,@alternateId as bigint,@subscriberId as bigint,@userId as bigint
As
begin
	
	if exists(Select ID from SMS_SUBSCRIBERACCOUNTS where id=@primaryId and SubscriberId=@subscriberId)
		begin
			if exists(Select ID from SMS_SUBSCRIBERACCOUNTS where id=@alternateId and SubscriberId=@subscriberId)
			begin				
				
				update 	SMS_SUBSCRIBERACCOUNTS set IsPrimary=1,UpdatedBy=@userId,UpdatedOn=GETDATE(),
				Remark='Switched To Primary' where Id=@alternateId
				update 	SMS_SUBSCRIBERACCOUNTS set IsPrimary=0,UpdatedBy=@userId,UpdatedOn=GETDATE(),
				Remark='Switched From Primary' where Id=@primaryId
				
				Select 'Primary Account Switched Sucessfully' as msg,1 as [return]
			end
			else
			begin
				--
				Select 'Invalid Alternate Account' as msg,1 as [return]
			end
			
		end
		else
		begin
			--
			Select 'Invalid Primary Account' as msg,1 as [return]
		end
		
	
end
GO

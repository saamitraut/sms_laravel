USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[NCFChannelAmount]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[NCFChannelAmount] (@bouids varchar(8000)='0',@accid bigint) returns float As 
Begin
	declare @NCFAmount as float;
	declare @NCFChSlab bigint=0;
	declare @bouStrLive Varchar(8000);

	SELECT @bouStrLive=STUFF((SELECT ',' + cast(BouqueId as varchar) FROM PRP_ACCOUNTTRANSACTION EE WHERE EE.AccountId=Erpr.AccountId
	FOR XML PATH('')),1,1,'') FROM PRP_ACCOUNTTRANSACTION Erpr where AccountId=@accid and ActivationDate<=cast(GETDATE() as date) GROUP BY Erpr.AccountId;
	
	if exists(select * from PRP_ACCOUNTTRANSACTION where AccountId=@accid and ActivationDate<=cast(GETDATE() as date))
	Begin
		select @NCFChSlab=dbo.[NCFChannelCntSlab](dbo.[NCFChannelCount](@bouStrLive));
	End 

	select @NCFChSlab=case when(@NCFChSlab-(dbo.[NCFChannelCntSlab](dbo.[NCFChannelCount](@bouStrLive)+dbo.[NCFChannelCount](@bouids))))<0 then
	(@NCFChSlab-(dbo.[NCFChannelCntSlab](dbo.[NCFChannelCount](@bouStrLive)+dbo.[NCFChannelCount](@bouids))))*-1 else 
	(@NCFChSlab-(dbo.[NCFChannelCntSlab](dbo.[NCFChannelCount](@bouStrLive)+dbo.[NCFChannelCount](@bouids)))) end  
	
	select @NCFAmount=(@NCFChSlab*20+(@NCFChSlab*20)*0.18);
return isnull(@NCFAmount,0)
End
GO

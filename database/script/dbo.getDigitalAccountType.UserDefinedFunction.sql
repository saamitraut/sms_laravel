USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getDigitalAccountType]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getDigitalAccountType](@SubscrberId as bigint)
returns bit
AS
begin
declare @r as bit
	if exists(Select Id from SMS_SUBSCRIBERACCOUNTS where SubscriberId=@SubscrberId)	
		Set @r=0;
	else
		set @r=1;
return @r 
End
GO

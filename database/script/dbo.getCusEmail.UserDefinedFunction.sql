USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getCusEmail]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getCusEmail](@subscriberId as bigint)
returns varchar(20)
As
begin
Declare @re as varchar(20)
Select @re=isnull(Email,'N/A') from SMS_SUBSCRIBERS_DETAILS where SubscriberId=@subscriberId
return isnull(@re,'--')
end
GO

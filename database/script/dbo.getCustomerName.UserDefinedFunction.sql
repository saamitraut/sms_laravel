USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getCustomerName]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getCustomerName](@subscriberId as bigint)
returns varchar(300)
As
begin
Declare @re as varchar(300)
Select @re=isnull(FName,'')+SPACE(1)+isnull(Mname,'')+SPACE(1)+isnull(LName,'')  from SMS_SUBSCRIBERS_DETAILS where SubscriberId=@subscriberId
return isnull(@re,'--')
end
GO

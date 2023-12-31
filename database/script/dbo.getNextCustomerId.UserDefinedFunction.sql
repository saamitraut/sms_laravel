USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getNextCustomerId]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getNextCustomerId](@rowId as int=1)    

returns varchar(14)    

as    

begin    

Declare @ret  varchar(14)    

Declare @MaxCustId  int    

Declare @oid  int    

select @MaxCustId=isnull(MAX(cast(substring(CustomerId,5,7)as varchar)),0)+@rowId from SMS_SUBSCRIBERS_HISTORY    

Set @ret= 'OZN'+dbo.getNdigit(@MaxCustId,7)

return @ret    

end 
GO

USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getNextCustomerId_SP]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getNextCustomerId_SP](@rowId as int=1)    
returns varchar(14)    
as    
Begin    
Declare @ret  varchar(14)    
Declare @MaxCustId  int    
Declare @oid  int    
    
select @MaxCustId=isnull(MAX(cast(substring(CustomerId,4,7)as varchar)),0)+@rowId from SMS_SUBSCRIBERS_HISTORY     
Set @ret= 'KOL'+dbo.getNdigit(@MaxCustId,7)    
--Select @MaxCustId=cast(max(right(CustomerId,6)) as int) from     
--( Select CustomerId from SMS_SUBSCRIBERS  union Select  CustomerId from SMS_SUBSCRIBERS_HISTORY) a where CustomerId like @areacode+@code+'%'    
--Select  @ret=@areacode+@code+dbo.getNdigit(isnull(@MaxCustId,1000000)+isnull(@rowId,1),7)    
return @ret    
end 
GO

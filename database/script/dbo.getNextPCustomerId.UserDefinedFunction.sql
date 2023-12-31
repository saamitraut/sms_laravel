USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getNextPCustomerId]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getNextPCustomerId](@rowId as int=1)  
returns varchar(10)  
as  
Begin  
Declare @ret  varchar(10)  
Declare @code  varchar(3)  
Declare @MaxCustId  int  
Declare @oid  int  
Select @MaxCustId=cast(max(right(PCustomerId,7)) as int) from  SLA_PROSPETSUBSCRIBERS_HISTORY   
Select  @ret='KOL'+dbo.getNdigit(isnull(@MaxCustId,1000000)+isnull(@rowId,1),7)  
return @ret  
end  
GO

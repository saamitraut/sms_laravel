USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getNextSAFFormNo]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getNextSAFFormNo](@rowId as int=1)    
returns varchar(14)    
as    
Begin    
Declare @ret  varchar(14)    
Declare @MaxSFrmNo  int    
    
select @MaxSFrmNo=isnull(MAX(substring(CustomerId,5,7)),0)+@rowId from SMS_SUBSCRIBERS_HISTORY where len(CustomerId)=10
Set @ret= 'FRM0'+dbo.getNdigit(@MaxSFrmNo,7)       
return @ret    
end 
GO

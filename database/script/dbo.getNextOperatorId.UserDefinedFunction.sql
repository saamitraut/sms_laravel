USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getNextOperatorId]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getNextOperatorId](@rowId as int=1)    

returns varchar(14)    

as    

Begin    

Declare @ret  varchar(14)    

Declare @MaxOeraId  int

    

select @MaxOeraId=isnull(MAX(cast(substring(Code,4,4) as bigint)),0)+@rowId from SMS_OPERATOR_HISTORY     

Set @ret= 'KOL'+dbo.getNdigit(@MaxOeraId,4) 

return @ret    

end 
GO

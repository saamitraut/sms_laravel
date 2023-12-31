USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[validateSCno]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[validateSCno](@scno as varchar(20))
Returns varchar(100)
Begin
declare @r as varchar(100)
	Select @r=CASe when len(@scno)<>16 then 'Invalid SCNo. 16 digits are required' 
	when @scno like '%[^0-9]%' then 'Invaild SCNo. Only Decimals are Allowed' else 'true' end
return @r	
End
GO

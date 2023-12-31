USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getNdigit_str]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getNdigit_str](@no as varchar(100),@nodigit as int)
returns varchar(100)
as
BEGIN
declare @no1 as varchar(100)	
	if(LEN(@no)<@nodigit)
	Select @no1=RIGHT(REPLICATE('0', @nodigit) + CAST(@no AS VARCHAR),@nodigit)
	else
	Set @no1=cast(@no as varchar)
return @no1
end
GO

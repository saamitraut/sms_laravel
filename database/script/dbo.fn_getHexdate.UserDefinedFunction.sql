USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getHexdate]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_getHexdate](@date as date)
returns varchar(6)
As
begin
	
	declare @rdate as varchar(6);
	--set @date='2011-10-25';
	select @rdate=right(dbo.[fn_varbintostr](day(@date)),2)+right(dbo.[fn_varbintostr](month(@date)),2)+right(dbo.[fn_varbintostr](year(@date)-1980),2)
	return @rdate
	
	
end
GO

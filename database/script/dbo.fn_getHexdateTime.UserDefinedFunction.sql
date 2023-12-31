USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getHexdateTime]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_getHexdateTime](@date as datetime)
returns varchar(10)
As
begin
	
	declare @rdate as varchar(10);	
	select @rdate=right(dbo.[fn_varbintostr](day(@date)),2)+right(dbo.[fn_varbintostr](month(@date)),2)
	+right(dbo.[fn_varbintostr](year(@date)-1980),2)+right(dbo.[fn_varbintostr](datepart(hh,@date)),2)+right(dbo.[fn_varbintostr](datepart(mi,@date)),2)
	return @rdate
	
	
end
GO

USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getUTCHexdateTime]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_getUTCHexdateTime](@date as datetime)
returns varchar(100)
As
begin
	
	declare @rdate as varchar(100);	
	--According to China Time
	--select  @rdate=dbo.[fn_varbintostr_](DATEDIFF(ss,'1970-01-01 00:00:00',@date)+(DATEDIFF(ss,GetDate(),GetUTCDate())-(2*60*60+30*60)),8)
	select  @rdate=dbo.[fn_varbintostr_](DATEDIFF(ss,'1970-01-01 00:00:00',@date)+(-28800),8)
	return @rdate
	
end
GO

USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getdateFrm_UTCHexdateTime]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_getdateFrm_UTCHexdateTime](@hexdate as varchar(16))
returns datetime
As
begin
	
	declare @rdate as datetime;	
	
	select  @rdate=CONVERT(datetime, DATEADD(ss, dbo.fn_HexToIntnt(@hexdate)-(DATEDIFF(ss,GetDate(),GetUTCDate())-(2*60*60+30*60)), '1970-01-01 00:00:00'))
	return @rdate
	
end
GO

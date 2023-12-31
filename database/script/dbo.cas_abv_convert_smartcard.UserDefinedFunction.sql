USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_convert_smartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_abv_convert_smartcard](@scno as varchar(16))
returns varchar(10)
as
begin
	declare @rscno as varchar(10);
	declare @area as varchar(4);
	declare @no as varchar(8);	
	set @area=SUBSTRING(@scno,2,4);
	set @no=SUBSTRING(@scno,8,8);	
	select @rscno=right(dbo.[fn_varbintostr](@area),2)+right(dbo.[fn_varbintostr](@no),8);
	return @rscno;
end
GO

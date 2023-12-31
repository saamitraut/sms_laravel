USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_Gospel_convert_smartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_Gospel_convert_smartcard](@scno as varchar(16))
returns varchar(8)
as
begin
	declare @rscno as varchar(8);
	declare @no as varchar(10);	
	set @no=right(@scno,10);	
	select @rscno=right(dbo.[fn_varbintostr](@no),8);
	return @rscno;
end
GO

USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getAsmoneyvar]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getAsmoneyvar](@c as float)
returns varchar(max)
As
Begin
	declare @v as varchar(max)
	Select @v=convert(varchar(max),CAST(@c as money),1)
	return @v
End
GO

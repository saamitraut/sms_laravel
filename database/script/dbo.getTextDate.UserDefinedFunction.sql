USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getTextDate]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getTextDate](@c as date)
returns varchar(12)
As
Begin
	declare @v as varchar(12)
	Select @v=convert(varchar(12),@c,107)
	return @v
End
GO

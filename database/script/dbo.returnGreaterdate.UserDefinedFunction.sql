USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[returnGreaterdate]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[returnGreaterdate](@date1 as datetime,@date2 as datetime)
RETURNS datetime
As
Begin
	Declare @date as datetime
	Set @date =Case when @date1 >@date2 then  @date1 else @date2 end
	return  @date
End
GO

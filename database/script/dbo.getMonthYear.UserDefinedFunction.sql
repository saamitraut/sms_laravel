USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getMonthYear]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getMonthYear](@date as date)
returns varchar(8)
as
BEGIN
declare @r as varchar(8)	
Select @r=right(CONVERT(varchar,@date,113),8)
return @r
end
GO

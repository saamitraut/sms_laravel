USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_datediff]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_datediff](@firstDate as datetime,@secondDate as datetime)
returns int
as
Begin
---------Internal function to caluclate diff between date including StartDate Count for Nepal SMS--------------
declare @fndiffDays as int;
select @fndiffDays = datediff(d,dateadd(d,-1,cast(@firstDate as date)),cast(@secondDate as date))
return @fndiffDays;
End
GO

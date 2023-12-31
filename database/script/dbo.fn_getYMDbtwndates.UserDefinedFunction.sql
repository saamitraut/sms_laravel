USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getYMDbtwndates]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[fn_getYMDbtwndates]

               (@sdate datetime,@edate datetime)
RETURNS @YMDbtwndates TABLE  (Years int,
                               Months int,
                               Days int)

AS
Begin

DECLARE  @tmpdate datetime, @years int, @months int, @days int

SELECT @tmpdate = @sdate

SELECT @years = DATEDIFF(yy, @tmpdate, @edate) - CASE WHEN (MONTH(@sdate) > MONTH(@edate)) OR (MONTH(@sdate) = MONTH(@edate) AND DAY(@sdate) > DAY(@edate)) THEN 1 ELSE 0 END
SELECT @tmpdate = DATEADD(yy, @years, @tmpdate)
SELECT @months = DATEDIFF(m, @tmpdate, @edate) - CASE WHEN DAY(@sdate) > DAY(@edate) THEN 1 ELSE 0 END
SELECT @tmpdate = DATEADD(m, @months, @tmpdate)
SELECT @days = DATEDIFF(d, @tmpdate, @edate)



INSERT @YMDbtwndates

    SELECT @years,

           @months,

           @days
RETURN

End

GO

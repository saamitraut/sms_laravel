USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_GetFirstDayOfMonth]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ufn_GetFirstDayOfMonth] ( @pInputDate    DATETIME )
RETURNS DATETIME
BEGIN

    RETURN CAST(CAST(YEAR(@pInputDate) AS VARCHAR(4)) + '/' + 
                CAST(MONTH(@pInputDate) AS VARCHAR(2)) + '/01' AS DATETIME)

END
GO

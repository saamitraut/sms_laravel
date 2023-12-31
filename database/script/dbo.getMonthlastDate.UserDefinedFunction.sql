USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getMonthlastDate]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Function [dbo].[getMonthlastDate](@dtDate as date)  
returns date  
As  
Begin  
DECLARE @ret DATE  
  
SELECT @ret=DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@dtDate)+1,0))  
return @ret  
End
GO

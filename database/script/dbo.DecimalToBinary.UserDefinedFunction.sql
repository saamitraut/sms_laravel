USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[DecimalToBinary]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DecimalToBinary]  
(  
       @Input bigint  
)  
RETURNS varchar(255)  
AS  
BEGIN  
  
       DECLARE @Output varchar(255) = ''  
  
       WHILE @Input > 0 BEGIN  
  
               SET @Output = @Output + CAST((@Input % 2) AS varchar)  
               SET @Input = @Input / 2  
  
       END  
  
       RETURN REVERSE(@Output)  
  
END
GO

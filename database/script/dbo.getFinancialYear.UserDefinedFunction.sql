USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getFinancialYear]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getFinancialYear](@BilMonth as date)
Returns  varchar(4)
As
Begin
Declare @fyear as varchar(4)
Select @fyear =Case when MONTH(@BilMonth)<4 then right(cast(year(@BilMonth)-1 as varchar),2)+right(cast(year(@BilMonth) as varchar),2)
else right(cast(year(@BilMonth) as varchar),2)+right(cast(year(@BilMonth)+1 as varchar),2)end
return @fyear 
End
GO

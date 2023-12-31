USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getBulkTaxedAmt]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getBulkTaxedAmt](@amt as float,@taxId as varchar(255))
returns float
as
Begin
declare @re as float	
Select @re=sum(isnull(dbo.getTaxAmount(@amt,Id),0) )	from SMS_TAX_MASTER t
left outer join dbo.SplitToColoumn(@taxId,',') r on t.id=cast(r.items as bigint)  where Status=1 and r.items is not null
return @re
end
GO

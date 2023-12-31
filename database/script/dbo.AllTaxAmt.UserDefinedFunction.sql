USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[AllTaxAmt]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[AllTaxAmt](@value as float)
Returns Float
AS
Begin
declare @ret as float
declare @taxid as varchar(max)
	select @taxid=cast(substring ((SELECT (','+cast(Id as varchar))
						from SMS_TAX_MASTER  t
						WHERE  Status =1
						ORDER BY t.Id  FOR XML PATH('')),2,8000) as varchar(8000))
	Select @ret=dbo.getBulkTaxedAmt(@value,@taxid)
return @ret
End

GO

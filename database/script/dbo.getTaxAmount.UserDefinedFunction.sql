USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getTaxAmount]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getTaxAmount](@value as float,@taxid as int)
Returns Float
AS
Begin
declare @ret as float
	Select @ret=Case when (ParentTaxId!=0 and IsInAmount= 0) then
					( 
							dbo.getTaxAmount((@value*TaxValue/100),ParentTaxId)
					)
					else 
					(
						case IsInAmount when 0 then  (@value*TaxValue/100) else (TaxValue) end
					)end	 from SMS_TAX_MASTER a where Status=1  and Id=@taxid
return @ret
End
GO

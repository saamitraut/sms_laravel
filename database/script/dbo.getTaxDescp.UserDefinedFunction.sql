USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getTaxDescp]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getTaxDescp](@taxid as int)
Returns varchar(1000)
AS
Begin
declare @ret as varchar(1000)
	Select @ret= TaxCode+' @ '+Case when (ParentTaxId!=0 and IsInAmount= 0) then
					( 
							cast(TaxValue as varchar)+'%'+' of '+dbo.[getTaxDescp](ParentTaxId)
					)
					else 
					(
						case IsInAmount when 0 then cast(TaxValue as varchar)+'%' else cast(TaxValue as varchar)+' INR ' end
					)end	 from SMS_TAX_MASTER a where Status=1  and Id=@taxid
return @ret
End
GO

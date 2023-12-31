USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getAnalogBillNo]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getAnalogBillNo](@BilMonth as date,@rowId as bigint=1)
returns varchar(16)
as
Begin
Declare @billNo  varchar(16)
Declare @MaxCustId  int
Select @MaxCustId =cast(max(right(BILLNO,6)) as int) from  SMS_B_A_INVOICE where
 dbo.[getFinancialYear](BillMonthYear)=dbo.[getFinancialYear](@BilMonth) and BillNo not like 'TBN_%'
 
Select  @billNo='ICCA-'+dbo.[getFinancialYear](@BilMonth)+'-'+dbo.getNdigit((isnull(@MaxCustId,0)+@rowId),6)
return @billNo	
end
GO

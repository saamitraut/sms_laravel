USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getDigitalBillNo]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getDigitalBillNo](@BilMonth as date,@rowId as bigint)
returns varchar(16)
as
Begin
Declare @billNo  varchar(16)
Declare @MaxCustId  int
Select @MaxCustId =cast(max(right(BILLNO,6)) as int) from  SMS_B_D_INVOICE where BillMonthYear=@BilMonth and BillNo not like 'TBN_%'
Select  @billNo='SEAD-'+dbo.getNdigit(month(@BilMonth),2)+substring(cast(YEAR(@BilMonth) as varchar),3,2)+'-'+dbo.getNdigit((isnull(@MaxCustId,0)+@rowId),6)
return @billNo	
end
GO

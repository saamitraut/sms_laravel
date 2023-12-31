USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[sch_bill_gen_d_invoice_scheduled]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sch_bill_gen_d_invoice_scheduled] as
Begin
if exists(Select Id from SMS_B_D_INVOICE_GEN_LOG where Status=0 and ScheduleDate<=GETDATE())
begin
	Declare @bgid as bigint
	Select top 1 @bgid=ID from SMS_B_D_INVOICE_GEN_LOG where Status=0 and ScheduleDate<=GETDATE() order by ScheduleDate
	exec [bill_gen_d_invoice] @bgid
	
end
End
GO

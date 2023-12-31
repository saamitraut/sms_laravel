USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[d_bill_payment]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[d_bill_payment] 
@invoiceId as bigint,
@amount as float,
@reason as varchar(250),
@receiptnum as varchar(250),
@receiptdate as datetime
as
begin
print '--'
--SMS_A_PAYMENTCREDIT_ENTRIES select * from SMS_A_PAYMENTCREDITS

declare @subscriberid as bigint
declare @accountid as bigint
declare @operatorid as bigint
declare @Receiptid as bigint

--SELECT * from SMS_SUBSCRIBERS

if @invoiceId is not null and @invoiceId!=0 and @amount is not null
begin 
select @subscriberid=SubscriberId,@accountid=AccountId from SMS_B_D_INVOICE where Id=@invoiceId
insert into SMS_RECEIPT_MASTER (Receiptno,ReceiptAmount,PaymentFor,Subscriberid,ReceiptDate,CreatedOn,Createdby)
values (@receiptnum,@amount,'Payment Against Bill',@subscriberid,@receiptdate,GETDATE(),'1')
SELECT @Receiptid=SCOPE_IDENTITY()
insert into SMS_PAYMENT (SubscriberId,AccountId,Amount,ReceiptId,ReasonId,[Description],CreatedOn,Createdby,Reason,InvoiceId)
values (@subscriberid,@accountid,@amount,@Receiptid,0,@reason,GETDATE(),'1','Bill Payment',@invoiceId)
end	

End
GO

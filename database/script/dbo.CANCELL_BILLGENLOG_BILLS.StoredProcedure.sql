USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[CANCELL_BILLGENLOG_BILLS]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CANCELL_BILLGENLOG_BILLS]	
	@BILLID AS INT,@USERID AS bigint,@remark as varchar(500)
AS
BEGIN
	
	
	DECLARE @B_D_INVOICE INT
	DECLARE @B_D_DELETED INT
	DECLARE @msg varchar(500)
	Set @B_D_DELETED=0
	
	SELECT @B_D_INVOICE=Id FROM SMS_B_D_INVOICE_GEN_LOG WHERE ID=@BILLID
	select @msg=' the  month of '+dbo.getMonthYear(BillMonthYear)+' for '+case BILLFOR when 1 then ' Area ' when 2 then ' Society ' else 'Operator ' end +'-'+BillforLabel	 from SMS_B_D_INVOICE_GEN_LOG where Id=@BILLID
		if not exists(select Id from  SMS_B_D_INVOICE where  BillgenLogId=@B_D_INVOICE and NextBillId>0)
		begin
					
			Update 	SMS_B_D_INVOICE set UpdatedBy=@USERID,UpdatedOn=GETDATE(),Remark=@remark where 	
			BillgenLogId=@B_D_INVOICE and NextBillId=0			
			Delete from SMS_B_D_INVOICE where BillgenLogId=@B_D_INVOICE and NextBillId=0
			Select @B_D_DELETED=@@ROWCOUNT			
			UPDATE SMS_B_D_INVOICE_GEN_LOG set UpdatedBy=@USERID,UpdatedOn=GETDATE(),Deleted=1,Remark=@remark where Id=@B_D_INVOICE			
			Select 'Bill Genration Log for '+@msg+' <br> With'+CAST(@B_D_DELETED as varchar)+' Digitals  Bills Deleted Sucessfully ' as msg		
			,'succ' as cls
		END		
		Else
	  		Select 'Bill Genration Log for '+@msg+' <br> Cannot be deleted as Billd for next month had been generated Already' as msg,'err' as cls
	
END
GO

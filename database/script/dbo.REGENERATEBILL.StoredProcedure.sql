USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[REGENERATEBILL]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REGENERATEBILL]
	-- Add the parameters for the stored procedure here
	@SCHEDULEDATE AS DATE, @BILLTYPE AS bigint,@BILLDATE AS DATE,@BILLID AS bigint,@USERID AS bigint,
	@BillMonthYear AS DATE,@BILLDUEDATE AS DATE,@where_clause AS VARCHAR(1000)
AS
BEGIN
	
	DECLARE @B_A_INVOICE INT
	DECLARE @B_D_INVOICE INT
	
	

		
		IF(@BILLTYPE=0 OR @BILLTYPE=2)
		BEGIN
			SELECT @B_D_INVOICE=Id FROM SMS_B_D_INVOICE_GEN_LOG WHERE AD_ID=@BILLID
			DELETE FROM SMS_B_D_INVOICE WHERE BillgenLogId=@B_D_INVOICE and NextBillId=0
			
			UPDATE SMS_B_D_INVOICE_GEN_LOG SET ScheduleDate=@SCHEDULEDATE,BillDate=@BILLDATE,
			BillDueDate=@BILLDUEDATE,BillMonthYear=@BillMonthYear,Status=0,	UpdatedOn=GETDATE(),UpdatedBy=@USERID,processed=0
			WHERE AD_ID=@BILLID
			
		END

			UPDATE SMS_B_AD_INVOICE_GEN_LOG SET ScheduleDate=@SCHEDULEDATE,BillDate=@BILLDATE,
			BillDueDate=@BILLDUEDATE,BillMonthYear=@BillMonthYear,Status=0,UpdatedOn=GETDATE(),UpdatedBy=@USERID
			WHERE Id=@BILLID
	
END
GO

USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[gen_All_unique_acc_rep_trai]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[gen_All_unique_acc_rep_trai] @date as date=NUll
As
Begin
	DECLARE @dateNew as date
	if(@date is null)
	set @dateNew=CAST(GETDATE() as date)
	else
	set @dateNew=@date

	declare @date1 as date
	declare @date2 as date
	declare @date3 as date
	declare @date4 as date

	select @date1=DATEADD(D,6,dbo.getFirstDate(@dateNew));
	select @date2=DATEADD(D,13,dbo.getFirstDate(@dateNew));
	select @date3=DATEADD(D,20,dbo.getFirstDate(@dateNew));
	select @date4=DATEADD(D,27,dbo.getFirstDate(@dateNew));

	exec sms_unique_acc_gen_brd_report_trai @date1;
	exec sms_unique_acc_gen_brd_report_trai @date2;
	exec sms_unique_acc_gen_brd_report_trai @date3;
	exec sms_unique_acc_gen_brd_report_trai @date4;
End



GO

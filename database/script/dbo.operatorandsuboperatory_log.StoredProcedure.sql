USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[operatorandsuboperatory_log]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[operatorandsuboperatory_log] @oppid as bigint
as
begin
print 'start proce'
	DECLARE @RunTotalTestData TABLE  (
	   Id    int not null identity(1,1) primary key,
	   transid int,
	   transtype Varchar (255) null,
	   NAME Varchar (255) null,
	   Remark Varchar (255) null,
	   SourceOfCredit Varchar (255) null,
	   Debit float null,
	   DebitCreatedOn datetime null,
	   Credit float null,
	   RefundAmount float null,
       CreditCreatedOn datetime null,
	   OperatorID bigint null,
	   SubscriberId bigint null
	);
 
	INSERT INTO @RunTotalTestData (transid,transtype,NAME,Remark,debit,DebitCreatedOn,Credit,RefundAmount,CreditCreatedOn,OperatorID) 
	select Id,transtype,NAME,Remark,DebitAmount,debitadate,CreditAmount,RefundAmount,creditdate,OperatorID 
	from sms_view_user_creditdebitlog 
	where OperatorID=@oppid order by debitadate,creditdate	Asc;
	;WITH tempDebitCredit AS (
		SELECT a.id,a.transid,a.transtype,a.NAME,a.Remark,a.debit,a.DebitCreatedOn, a.credit,RefundAmount,a.CreditCreatedOn, a.Credit - a.Debit 'diff',a.OperatorID
		FROM @RunTotalTestData a
	)

	SELECT a.id,a.transid,a.transtype,a.NAME,a.Remark,a.Debit,a.DebitCreatedOn, a.Credit,a.RefundAmount,a.CreditCreatedOn, round(SUM(b.diff),2) 'Balance',a.OperatorID-- into #temp
FROM   tempDebitCredit a,
       tempDebitCredit b
WHERE b.id <= a.id
GROUP BY a.id,a.transid,a.transtype,a.NAME,a.Remark,a.Debit,a.DebitCreatedOn, a.Credit,a.RefundAmount,a.CreditCreatedOn,a.OperatorID

end


GO

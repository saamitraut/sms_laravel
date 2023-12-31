USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[d_insert_a_advance_payment]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[d_insert_a_advance_payment] @Id as bigint
as
begin
print '--'
--SMS_A_PAYMENTCREDIT_ENTRIES select * from SMS_A_PAYMENTCREDITS

declare @fromdate as date
declare @NoOfMonths as int

SELECT @fromdate=cast(convert(varchar(8),StartingMonth,120)+'01' as date),@NoOfMonths=NoOfMonths FROM SMS_A_PAYMENTCREDITS WHERE Id=@Id

if @NoOfMonths is not null and @NoOfMonths!=0 
begin
	WITH CTE_DatesTable
AS
(
  SELECT cast(@fromdate as date) AS [date]
  UNION ALL
  SELECT DATEADD(mm,1, [date])
  FROM CTE_DatesTable
  WHERE DATEADD(mm, 1,[date]) < DATEADD(mm, @NoOfMonths, cast(@fromdate as date))
)
SELECT iDENTITY(INT) AS Id,[date] INTO #dATE FROM CTE_DatesTable
OPTION (MAXRECURSION 0)	
	
			
			insert into 
			SMS_A_PAYMENTCREDIT_ENTRIES(SubscriberId,AccountId,CreditId,MonthYear,Amount,CreatedOn,CreatedBy)
			Select b.SubscriberId,b.AccountId,b.Id,a.[date],Amount/NoOfMonths,GETDATE(),CreatedBy
			 from #dATE a,SMS_A_PAYMENTCREDITS b
			where b.Id=@Id	
	
End
End
GO

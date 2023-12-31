USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[d_insert_subscriber_discounts]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[d_insert_subscriber_discounts]
@discountId as bigint,@accountId as bigint,@fromdate as datetime,@isanalog as bit=1,@userId as bigint
as
begin
print '--'
declare @period as int
SELECT @period=DiscountPeriod FROM SMS_DISCOUNT_MASTER WHERE Id=@discountId
if @period is not null and @period!=0 
begin
	WITH CTE_DatesTable
AS
(
  SELECT cast(@fromdate as date) AS [date]
  UNION ALL
  SELECT DATEADD(mm,1, [date])
  FROM CTE_DatesTable
  WHERE DATEADD(mm, 1,[date]) < DATEADD(mm, @period, cast(@fromdate as date))
)
SELECT iDENTITY(INT) AS Id,[date] INTO #dATE FROM CTE_DatesTable
OPTION (MAXRECURSION 0)
	if @isanalog=1
		begin			
			insert into 
			SMS_A_SUBSCRIBERS_DISCOUNTS(SubscriberId,AccountId,DiscountDate,DiscountId,DiscountTitle,DiscountCode,DiscountValue,
			IsInAmount,DiscountPeriod,CreatedOn,CreatedBy,StartDate)
			Select c.SubscriberId,c.Id,a.[date],b.Id,b.DiscountTitle,b.DiscountCode,b.DiscountValue,b.IsInAmount,b.DiscountPeriod,GETDATE(),@userId,@fromdate
			 from #dATE a,SMS_DISCOUNT_MASTER b,SMS_SUBSCRIBERS_ANALOG_ACCOUNTS c 
			where c.Id=@accountId and b.Id=@discountId			
		End
	else
		begin			
			insert into 
			SMS_D_SUBSCRIBERS_DISCOUNTS(SubscriberId,AccountId,DiscountDate,DiscountId,DiscountTitle,DiscountCode,DiscountValue,
			IsInAmount,DiscountPeriod,CreatedOn,CreatedBy,StartDate)
			Select c.SubscriberId,c.Id,a.[date],b.Id,b.DiscountTitle,b.DiscountCode,b.DiscountValue,b.IsInAmount,b.DiscountPeriod,GETDATE(),@userId,@fromdate
			 from #dATE a,SMS_DISCOUNT_MASTER b,SMS_SUBSCRIBERACCOUNTS c 
			where c.Id=@accountId and b.Id=@discountId			
		End
End
End
GO

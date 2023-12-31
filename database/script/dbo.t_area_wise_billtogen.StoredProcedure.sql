USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[t_area_wise_billtogen]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[t_area_wise_billtogen] @month as int,@year as int
 as 
 Begin
 
select a.AreaId as id,b.AREACODE as text from(
select count(Id) as Billcount,AreaId,NextInvoiceMonth from [sms_b_d_view_nextinvoicemonth] 
where  MONTH(NextInvoiceMonth)=@month  and year(NextInvoiceMonth)=@year
group by AreaId,NextInvoiceMonth) a
left outer join SMS_AREACODE b on a.AreaId=b.ID
 
 end
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_bl_d_view_soceity_wise_billtogen]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_bl_d_view_soceity_wise_billtogen] as
select a.*,b.AREACODE,b.AreaName,b.AreaId,b.SocietyName,b.SocietyCode from(
select count(Id) as Billcount,SocietyId,NextInvoiceMonth from [sms_b_d_view_nextinvoicemonth] group by SocietyId,NextInvoiceMonth) a
left outer join sms_view_society b on a.SocietyId=b.ID
GO

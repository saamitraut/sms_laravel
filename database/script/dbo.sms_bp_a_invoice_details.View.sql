USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_bp_a_invoice_details]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_bp_a_invoice_details] as
select a.Id,a.BillNo,a.SubscriberId,a.AccountId,a.OperatorId,a.AreaId,a.SocietyId,a.AddtionalCharges,a.LastAdvanceBalance+a.AdvancePaid as AdvancePaid,a.CurrentCharges,a.TaxAmount,a.CurrentAmount,a.CreditCharges,a.DiscountCharges,
a.BillAmount,a.LastBillDue,a.LastBillAmount,a.LastPayments,a.BillgenLogId,
dbo.getTextDate(a.BillDate) as BillDate,dbo.getTextDate(a.BillDueDate) as BillDueDate,
dbo.getMonthYear(a.BillMonthYear) as BillMonthYear,replace(ltrim(rtrim(ltrim(rtrim(isnull(a.MobileNo,'')))+SPACE(1)+ltrim(rtrim(isnull(a.Phone,''))))),' ','/') as Contact
,a.TVId,a.FormNo,a.MobileNo,a.AreaName,a.SocietyName,a.SocietyCode,a.BasicCharge,a.ExtraPayments,a.SchemeId,a.CustomerId,a.FlatNo,a.FloorNo,
replace(ltrim(rtrim(ltrim(rtrim(isnull(a.Operator,'')))+SPACE(1)+ltrim(rtrim(isnull(a.ParentOperator,''))))),' ','/') as Operator,a.SubscriberName,a.Address,a.Wing,a.Building,a.Zipcode
 ,InvoiceTaxes=cast(substring 
                          ((SELECT     ('~' +isnull(TaxDescription,'')+'^'+isnull(convert(varchar,CAST(TaxAmount as varchar),1),''))
                              FROM         SMS_B_A_INVOICETAXES t
                              WHERE     t.Invoiceid = a.Id
                              ORDER BY t.IsInAmount,t.TaxId FOR XML PATH('')),2,8000) as varchar(8000))
 ,InvoiceConCharges=cast(substring 
                          ((SELECT     ('~' +ISNULL(t.Title,'')+'^'+convert(varchar,CAST(ISNULL(t.Amount,'0') as varchar),1))
                              FROM         (Select InvoiceId,Title,SUM(Amount) as Amount from  
                              SMS_B_A_INVOICE_CONNCHARGES where  Invoiceid = a.Id  group by InvoiceId,Title) t
                              WHERE     t.Invoiceid = a.Id
                              ORDER BY t.Title FOR XML PATH('')),2,8000) as varchar(8000))                            
                              
,InvoiceAddtionalCharges=cast(substring 
                          ((SELECT     ('~' +ISNULL(t.Title,'')+'^'+convert(varchar,CAST(ISNULL(t.Amount,'0') as varchar),1))
                              FROM         (Select InvoiceId,Title,SUM(Amount) as Amount from  
                              SMS_B_A_INVOICE_ADDTIONALCHARGES where  Invoiceid = a.Id  group by InvoiceId,Title)  t
                              WHERE     t.Invoiceid = a.Id
                              ORDER BY t.Title FOR XML PATH('')),2,8000) as varchar(8000)) 
,InvoiceAdvance=cast(substring 
                          ((SELECT     ('~' +ISNULL(t.Title,'')+'^'+convert(varchar,CAST(ISNULL(t.Amount,'0') as varchar),1))
                              FROM          (Select InvoiceId,Title,SUM(Amount) as Amount from  
                              SMS_B_A_INVOICE_PAYMENTCREDITS where  Invoiceid = a.Id  and IsAdvance=1 group by InvoiceId,Title) t
                              WHERE     t.Invoiceid = a.Id 
                              ORDER BY t.Title FOR XML PATH('')),2,8000) as varchar(8000)) 
,InvoiceCredits=cast(substring 
                          ((SELECT     ('~' +ISNULL(t.Title,'')+'^'+convert(varchar,CAST(ISNULL(t.Amount,'0') as varchar),1))
                              FROM         (Select InvoiceId,Title,SUM(Amount) as Amount from  
                              SMS_B_A_INVOICE_PAYMENTCREDITS where  Invoiceid = a.Id  and IsAdvance=0 group by InvoiceId,Title)  t
                              WHERE     t.Invoiceid = a.Id 
                              ORDER BY t.Title FOR XML PATH('')),2,8000) as varchar(8000))                                                                                         
 from sms_bp_a_invoice a
GO

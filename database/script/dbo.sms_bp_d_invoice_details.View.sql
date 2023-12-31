USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_bp_d_invoice_details]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_bp_d_invoice_details] as
select a.Id,a.BillNo,a.SubscriberId,a.AccountId,a.OperatorId,a.AreaId,a.SocietyId,a.AddtionalCharges,a.LastAdvanceBalance+a.AdvancePaid as AdvancePaid
 ,a.CurrentCharges,a.TaxAmount,a.PayPackageCharge,a.CurrentAmount,a.CreditCharges,a.DiscountCharges,
a.BillAmount,a.LastBillDue,a.LastBillAmount,a.LastPayments,a.BillgenLogId,a.LastBillId as LastBillId,
dbo.getTextDate(a.BillDate) as BillDate,dbo.getTextDate(a.BillDueDate) as BillDueDate,
dbo.getMonthYear(a.BillMonthYear) as BillMonthYear,replace(ltrim(rtrim(ltrim(rtrim(isnull(a.MobileNo,'')))+SPACE(1)+ltrim(rtrim(isnull(a.Phone,''))))),' ','/')
 as Contact
,a.FormNo,a.MobileNo,a.AreaName,a.SocietyName,a.SocietyCode,a.STBNo,a.SmartcardNo,a.BasicCharge,a.ExtraPayments,a.SchemeId,a.CustomerId,a.FlatNo,
replace(ltrim(rtrim(ltrim(rtrim(isnull(a.Operator,'')))+SPACE(1)+ltrim(rtrim(isnull(a.ParentOperator,''))))),' ',' ') as Operator,a.SubscriberName,a.Address,a.Wing,a.Zipcode
 ,InvoiceTaxes=cast(substring 
                          ((SELECT     ('~' +isnull(TaxDescription,'')+'^'+isnull(convert(varchar,CAST(TaxAmount as money),1),''))
                              FROM         SMS_B_D_INVOICETAXES t
                              WHERE     t.Invoiceid = a.Id
                              ORDER BY t.IsInAmount,t.TaxId FOR XML PATH('')),2,8000) as varchar(8000))
 ,InvoiceAddonCharges=cast(substring 
                          ((SELECT     ('~' +isnull(TagName,'')+'^'+isnull(convert(varchar,CAST(Amount as money),1),''))
                              FROM         SMS_B_D_INVOICE_ADDONCHARGES t
                              WHERE     t.Invoiceid = a.Id
                              ORDER BY t.TagName FOR XML PATH('')),2,8000) as varchar(8000))       
,InvoicePackages=cast(substring 
                          ((SELECT     ('~' +isnull(TagName,''))
                              FROM         SMS_B_D_INVOICE_ADDONCHARGES t
                              WHERE     t.Invoiceid = a.Id
                              ORDER BY t.TagName FOR XML PATH('')),2,8000) as varchar(8000)) 
,PackagesCount=(Select COUNT(Distinct TagName) from  SMS_B_D_INVOICE_ADDONCHARGES t WHERE   t.Invoiceid = a.Id
                              )                                                            
 ,InvoiceConCharges=cast(substring 
                          ((SELECT     ('~' +ISNULL(t.Title,'')+'^'+convert(varchar,CAST(ISNULL(t.Amount,'0') as money),1))
                              FROM         (Select InvoiceId,Title,SUM(Amount) as Amount from  
                              SMS_B_D_INVOICE_CONNCHARGES where Invoiceid = a.Id  group by InvoiceId,Title)  t
                              WHERE     t.Invoiceid = a.Id
                              ORDER BY t.Title FOR XML PATH('')),2,8000) as varchar(8000))                            
                              
,InvoiceAddtionalCharges=cast(substring 
                          ((SELECT     ('~' +ISNULL(t.Title,'')+'^'+convert(varchar,CAST(ISNULL(t.Amount,'0') as money),1))
                              FROM   (Select InvoiceId,Title,SUM(Amount) as Amount from  
                              SMS_B_D_INVOICE_ADDTIONALCHARGES where Invoiceid = a.Id  group by InvoiceId,Title)  t
                              WHERE     t.Invoiceid = a.Id
                              ORDER BY t.Title FOR XML PATH('')),2,8000) as varchar(8000)) 
,InvoiceAdvance=cast(substring 
                          ((SELECT     ('~' +ISNULL(t.Title,'')+'^'+convert(varchar,CAST(ISNULL(t.Amount,'0') as money),1))
                              FROM          (Select InvoiceId,Title,SUM(Amount) as Amount from  
                              SMS_B_D_INVOICE_PAYMENTCREDITS where Invoiceid = a.Id  and IsAdvance=1 group by InvoiceId,Title) t
                              WHERE     t.Invoiceid = a.Id 
                              ORDER BY t.Title FOR XML PATH('')),2,8000) as varchar(8000)) 
,InvoiceCredits=cast(substring 
                          ((SELECT     ('~' +ISNULL(t.Title,'')+'^'+convert(varchar,CAST(ISNULL(t.Amount,'0') as money),1))
                             FROM    (Select InvoiceId,Title,SUM(Amount) as Amount from  
                              SMS_B_D_INVOICE_PAYMENTCREDITS where  Invoiceid = a.Id  and IsAdvance=0 group by InvoiceId,Title)t
                              WHERE     t.Invoiceid = a.Id 
                              ORDER BY t.Title FOR XML PATH('')),2,8000) as varchar(8000))                                                                                         
 from sms_bp_d_invoice a
GO

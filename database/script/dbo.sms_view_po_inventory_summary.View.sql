USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_po_inventory_summary]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_po_inventory_summary] as   

SELECT ROW_NUMBER() over(order by Inventory) as Id,Inventory,Vendor,Model,PONumber,PODate,InvNumber,InvDate,isnull(Cnt,0) as TotalCount    

FROM  

(Select 'STB' as Inventory,CASNAME as Vendor,Brand as Model,PONumber,PODate,InvNumber,InvDate,COUNT(Id) as Cnt
 from sms_view_stb where PONumber is not null 
 group by PONumber,PODate,InvNumber,InvDate,CASNAME,Brand   

 union  

 Select 'Smartcard' as Inventory,CASNAME as Vendor,Brand as Model,PONumber,PODate,InvNumber,InvDate,COUNT(Id) as Cnt 
 from sms_view_smartcard where PONumber is not null 
 group by PONumber,PODate,InvNumber,InvDate,CASNAME,Brand   

 )x
GO

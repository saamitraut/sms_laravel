USE [MNSMS]
GO
/****** Object:  View [dbo].[cp_customer_login]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[cp_customer_login] as

select a.SubscriberId as id,a.CustomerId as customer_id,a.CustomerId as username,b.MobileNo as mobile_no, a.Password as password,'vishalrohitkrishna' as auth_key,NULL as password_reset_token,0 as role,a.CreatedOn as added_on,
a.CreatedBy as added_by,a.UpdatedOn as modified_on,a.UpdatedBy as modified_by,a.Status as status,1 as is_allowed,0 as deleted from WEB_SUBSCRIBERLOGIN a

LEFT JOIN SMS_SUBSCRIBERS b ON (a.SubscriberId = b.Id); 
GO

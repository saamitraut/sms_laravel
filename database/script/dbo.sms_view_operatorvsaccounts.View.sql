USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_operatorvsaccounts]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[sms_view_operatorvsaccounts] AS
SELECT  OperatorId as Id,Operator,[0] as Inactive,[1] as Active FROM
(SELECT OperatorId ,Id,Operator,Status  FROM sms_view_d_subscriber_state) AS source
PIVOT (count(ID) FOR Status IN ([0],[1]) ) as pvt


GO

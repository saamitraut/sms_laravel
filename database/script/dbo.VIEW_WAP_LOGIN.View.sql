USE [MNSMS]
GO
/****** Object:  View [dbo].[VIEW_WAP_LOGIN]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_WAP_LOGIN] AS SELECT a.Id as Id, a.NAME as Name, a.OperatorID as OperatorId, a.LOGINID as LoginId, a.USERTYPE as UserType, b.CODE as Code,  
b.ADDRESS as Address, a.STATUS as Status from SMS_ACCESS a   
LEFT JOIN SMS_OPERATOR b ON b.Id = a.OperatorID;
GO

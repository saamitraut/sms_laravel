USE [MNSMS]
GO
/****** Object:  View [dbo].[WAP_ACCESS]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WAP_ACCESS] AS SELECT a.ID as Id, a.NAME as Name, a.OperatorID as OperatorId, a.LOGINID as LoginId,a.USERTYPE as UserType,a.CREATEDON as CreatedOn,
a.CREATEDBY as CreatedBy, a.UPDATEDON as ModifiedOn, a.UPDATEDBY as ModifiedBy,a.STATUS as Status, a.deleted as Deleted from SMS_ACCESS a ;  
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_branch_operator]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sms_branch_operator]
as 
select id,name,code,branch as BranchId from SMS_OPERATOR
GO

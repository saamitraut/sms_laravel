USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_archived_packages]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[sms_view_archived_packages] as
select Id as HID,FId as Id,PackageName,CasCode,Price,Price2,BillingCycle,StartDate,EndDate,Status,Description,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,Deleted,Remark,PackageType,InsertedOn,InsertedBy,PreviousId,DMLAction,DMLComments
from
(select ROW_NUMBER()over(Partition By FId order by Id desc) as RID,* from SMS_PACKAGE_HISTORY) a
where RID=1
GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_his_package_1]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[sms_his_package_1] as
select Row_number()Over(PARTITION By a.FID order by a.Id desc )as RID,a.Id,FId,
a.PackageName,CasCode,Price,Price2,BillingCycle,StartDate,EndDate,Status,a.Description ,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,
a.Deleted,a.Remark,PackageType,InsertedOn,InsertedBy,PreviousId,DMLAction,DMLComments
from SMS_PACKAGE_HISTORY a
left outer join sms_view_channelinpackage b on a.Id=b.PackageId





GO

USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_his_subscriber_details_1]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_his_subscriber_details_1] as
select Row_number()Over(PARTITION By a.FID order by a.Id )as RID,a.*
from SMS_SUBSCRIBERS_DETAILS_HISTORY a
GO

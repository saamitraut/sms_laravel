USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[x_corrrectMenuOrder]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[x_corrrectMenuOrder] as
update SMS_MENU set MenuOrder=x.MenuOrder
from (
Select a.ID, b.MenuOrder from SMS_MENU a
left outer join SMS_MENU b on a.ParentMenuId=b.ID where a.ParentMenuId>0 and b.ID is not null
) x where x.id=SMS_MENU.Id
GO

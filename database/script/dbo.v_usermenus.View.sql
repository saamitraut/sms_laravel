USE [MNSMS]
GO
/****** Object:  View [dbo].[v_usermenus]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_usermenus] as
select a.Id AS Id,a.Label AS Label,a.functions AS f,a.htm_output AS h,a.general AS g,a.ForUser AS ForUser
,a.ParentMenuId AS ParentMenuId,a.OrderBy AS OrderBy,a.Status AS Status,a.MenuOrder AS 
MenuOrder,isnull(b.PRead,0) AS PRead,isnull(b.PWrite,0) AS PWrite,isnull(b.PExecute,0) 
AS PExecute,isnull(b.AccessId,0) AS AccessId from 
(SMS_MENU a left join SMS_ACCESSRIGHTS b on((b.MenuId = a.Id)))
 where ((a.ParentMenuId > 0) or (a.htm_output is not null));
GO

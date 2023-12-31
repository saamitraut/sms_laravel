USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_MENU]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_MENU](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](100) NOT NULL,
	[functions] [varchar](100) NOT NULL,
	[htm_output] [varchar](100) NULL,
	[general] [varchar](100) NULL,
	[ForUser] [int] NOT NULL,
	[ParentMenuId] [int] NOT NULL,
	[OrderBy] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[MenuOrder] [int] NOT NULL,
	[LeftRightWidth] [int] NOT NULL,
 CONSTRAINT [PK_SLA_MENU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLA_MENU] ON 

INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (1, N'MASTER', N'master', NULL, NULL, 1, 0, 1, N'Active', 1, 380)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (2, N'Access Rights', N'User', N'html_list', NULL, 1, 1, 2, N'Active', 1, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (3, N'Broadcaster List', N'broadcaster', N'html_list', NULL, 1, 1, 8, N'Active', 1, -2)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (4, N'Operator List', N'operator', N'html_list', NULL, 1, 1, 4, N'Active', 1, -2)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (5, N'Area List', N'area', N'html_list', NULL, 1, 1, 5, N'Active', 1, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (6, N'Channel List', N'channel', N'html_list', NULL, 1, 1, 6, N'Active', 1, -2)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (7, N'Package List', N'package', N'html_list', NULL, 1, 1, 5, N'Active', 1, -2)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (8, N'SUBSCRIBER', N'subscriber', NULL, NULL, 1, 0, 2, N'Active', 2, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (9, N'Search Subscriber', N'subscriber', N'html_list', NULL, 1, 8, 1, N'Active', 2, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (10, N'CALL LOG LIST', N'callloglist', NULL, NULL, 1, 0, 3, N'Active', 3, 310)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (11, N'Complaint Call Log List', N'calllog', N'callog_list', N'{calltype:2,t:Complaint Call Log List}', 1, 10, 1, N'Active', 3, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (12, N'Installation Call Log', N'calllog', N'callog_list', N'{calltype:4,t:Installation Call Log List}', 1, 10, 2, N'Active', 3, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (13, N'Query Call Log List', N'calllog', N'callog_list', N'{calltype:3,t:Query Call Log List}', 1, 10, 2, N'Active', 3, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (14, N'Connection Scheme List', N'connectionscheme', N'html_list', NULL, 1, 1, 9, N'Active', 1, -2)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (15, N'Prospect Subscriber', N'prospect', NULL, NULL, 1, 0, 4, N'Active', 4, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (16, N'Prospect Subscriber List', N'prospect', N'html_list', NULL, 1, 15, 1, N'Active', 4, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (17, N'Reports', N'mis', NULL, NULL, 1, 0, 5, N'Active', 5, 450)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (18, N'Tax List', N'taxmaster', N'html_list', NULL, 1, 1, 7, N'Active', 1, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (19, N'Discount List', N'discount', N'html_list', NULL, 1, 1, 8, N'Active', 1, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (20, N'Society  List', N'society', N'html_list', NULL, 1, 1, 6, N'Active', 1, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (21, N'Reason Master', N'reasonmaster', N'html_list', NULL, 1, 1, 3, N'Active', 1, -2)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (22, N'Charge List', N'chargemaster', N'html_list', NULL, 1, 1, 9, N'Active', 1, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (23, N'Request Call Log List', N'calllog', N'callog_list', N'{calltype:1,t:Request Call Log List}', 1, 10, 5, N'Active', 3, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (24, N'Category List', N'category', N'html_list', NULL, 1, 1, 7, N'Active', 1, -2)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (25, N'User Designation', N'User', N'designation_list', NULL, 1, 1, 3, N'Active', 1, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (26, N'Engineers Designation', N'engineers', N'engineers_designation_list', NULL, 1, 1, 2, N'Active', 1, -2)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (27, N'Engineers Master', N'engineers', N'html_list', NULL, 1, 1, 1, N'Active', 1, -2)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (28, N'Sub Call Type Master', N'calltype', N'html_list', NULL, 1, 1, 4, N'Active', 1, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (29, N'Add New Prospect Subscriber', N'prospect', NULL, N'add_edit_form', 1, 15, 2, N'Active', 4, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (30, N'Archived Prospect Subscriber List', N'prospect', N'archived_psubsciber', NULL, 1, 15, 3, N'Active', 4, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (31, N'Web Query Log List', N'calllog', N'callog_list', N'{calltype:5,t:Web Query Log List}', 1, 10, 5, N'Inactive', 3, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (32, N'User List', N'User', N'user_list', NULL, 1, 1, 1, N'Active', 1, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (33, N'Area Vs Call Log', N'reports', N'area_vs_calllog', NULL, 1, 18, 1, N'Active', 5, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (34, N'WebSite Registered User', N'website', N'registred_user', NULL, 1, 8, 1, N'Active', 2, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (35, N'WebSite Registration Request', N'website', N'registration_req', NULL, 1, 8, 1, N'Active', 2, -1)
INSERT [dbo].[SLA_MENU] ([ID], [Label], [functions], [htm_output], [general], [ForUser], [ParentMenuId], [OrderBy], [Status], [MenuOrder], [LeftRightWidth]) VALUES (36, N'Area Vs Call Log', N'reports', N'area_vs_calllog', NULL, 1, 17, 1, N'Active', 5, -1)
SET IDENTITY_INSERT [dbo].[SLA_MENU] OFF
GO

USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_PAIRING]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_PAIRING](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SmartCardId] [bigint] NOT NULL,
	[StbId] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[IsLocked] [bit] NOT NULL,
	[LockedOn] [datetime] NULL,
	[LockedFrom] [varchar](250) NULL,
	[sms_id] [bigint] NULL,
	[AllocatedOperatorId] [bigint] NULL,
 CONSTRAINT [PK_SMS_PAIRING] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_PAIRING] ON 

INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (1, 1, 1, 1, CAST(N'2022-08-08T12:58:38.933' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, CAST(N'2022-08-16T16:18:07.080' AS DateTime), N'dt3g93tpcve8vgla1vjlr2tir2', NULL, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (2, 2, 2, 0, CAST(N'2022-08-17T17:47:13.263' AS DateTime), 1, CAST(N'2023-10-04T15:01:08.943' AS DateTime), 3, 0, NULL, 0, CAST(N'2022-08-17T17:48:16.073' AS DateTime), N'dt3g93tpcve8vgla1vjlr2tir2', NULL, 0)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (3, 3, 3, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (4, 4, 4, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (5, 5, 5, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (6, 6, 6, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (7, 7, 7, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (8, 8, 8, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (9, 9, 9, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (10, 10, 10, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (11, 11, 11, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (12, 12, 12, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (13, 13, 13, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (14, 14, 14, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (15, 15, 15, 0, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-08-21T13:57:45.497' AS DateTime), 3, 0, NULL, 1, CAST(N'2023-04-26T16:14:18.667' AS DateTime), N'kiaitvroe7br424lnpotal0t35', 3, 0)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (16, 16, 16, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (17, 17, 17, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (18, 18, 18, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (19, 19, 19, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (20, 20, 20, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (21, 21, 21, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (22, 22, 22, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (23, 23, 23, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (24, 24, 24, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2022-08-29T16:41:44.080' AS DateTime), 1, 0, NULL, 0, CAST(N'2023-04-26T16:13:09.057' AS DateTime), N'kiaitvroe7br424lnpotal0t35', 3, 1)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (25, 25, 25, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (26, 26, 26, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (27, 27, 27, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (28, 28, 28, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (29, 29, 29, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (30, 30, 30, 0, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-08-21T14:12:16.517' AS DateTime), 3, 0, NULL, 0, CAST(N'2023-04-26T14:05:22.620' AS DateTime), N'kiaitvroe7br424lnpotal0t35', 3, 0)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (31, 31, 31, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-06-08T17:26:49.550' AS DateTime), 3, 0, NULL, 0, CAST(N'2023-06-08T17:27:35.960' AS DateTime), N'e8j07ie4qg27m2oofg009pv167', 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (32, 32, 32, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-08-21T14:16:40.843' AS DateTime), 3, 0, NULL, 0, CAST(N'2023-08-21T14:17:19.510' AS DateTime), N'fjjlebgdf7gqmm4ulcrfsv50q3', 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (33, 33, 33, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (34, 34, 34, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (35, 35, 35, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (36, 36, 36, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (37, 37, 37, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (38, 38, 38, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 1, CAST(N'2023-10-14T16:27:50.913' AS DateTime), N'rmkj5pjr5gbboen71in170nsd2', 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (39, 39, 39, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (40, 40, 40, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (41, 41, 41, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (42, 42, 42, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (43, 43, 43, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (44, 44, 44, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (45, 45, 45, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (47, 47, 47, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (48, 48, 48, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (49, 49, 49, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (50, 50, 50, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (51, 51, 51, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (52, 52, 52, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-08-23T15:57:40.423' AS DateTime), 3, 0, NULL, 0, CAST(N'2023-08-23T15:58:03.130' AS DateTime), N'qa6l1pbn8453t9r0erc02odq77', 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (53, 53, 53, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-06-08T17:44:59.883' AS DateTime), 3, 0, NULL, 1, CAST(N'2023-06-08T17:45:57.553' AS DateTime), N'e8j07ie4qg27m2oofg009pv167', 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (54, 54, 54, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (55, 55, 55, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (56, 56, 56, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (57, 57, 57, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (58, 58, 58, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (59, 59, 59, 0, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:17.423' AS DateTime), 3, 0, NULL, 0, CAST(N'2023-06-06T14:56:45.747' AS DateTime), N'e8j07ie4qg27m2oofg009pv167', 3, 0)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (60, 60, 60, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (62, 62, 62, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (63, 63, 63, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (64, 64, 64, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (65, 65, 65, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (66, 66, 66, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (67, 67, 67, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (68, 68, 68, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (69, 69, 69, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (70, 70, 70, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (71, 71, 71, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (72, 72, 72, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (73, 73, 73, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (74, 74, 74, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (75, 75, 75, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (76, 76, 76, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (77, 77, 77, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (78, 78, 78, 0, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:17.423' AS DateTime), 3, 0, NULL, 0, CAST(N'2023-04-26T16:07:17.797' AS DateTime), N'kiaitvroe7br424lnpotal0t35', 3, 0)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (79, 79, 79, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (80, 80, 80, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (81, 81, 81, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (82, 82, 82, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (83, 83, 83, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (84, 84, 84, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (85, 85, 85, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (86, 86, 86, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (87, 87, 87, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (88, 88, 88, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (89, 89, 89, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (90, 90, 90, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (91, 91, 91, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, NULL, NULL, 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (92, 92, 92, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, CAST(N'2023-10-14T13:07:28.250' AS DateTime), N'rmkj5pjr5gbboen71in170nsd2', 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (93, 93, 93, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-10-09T17:07:51.177' AS DateTime), 3, 0, NULL, 0, CAST(N'2023-10-14T13:05:40.673' AS DateTime), N'rmkj5pjr5gbboen71in170nsd2', 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (94, 94, 94, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2023-08-23T14:38:13.443' AS DateTime), 3, 0, NULL, 0, CAST(N'2023-08-23T14:48:25.040' AS DateTime), N'qa6l1pbn8453t9r0erc02odq77', 3, 2)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (95, 95, 95, 1, CAST(N'2022-08-29T16:40:42.693' AS DateTime), 1, CAST(N'2022-08-29T16:41:44.080' AS DateTime), 1, 0, NULL, 0, CAST(N'2022-10-12T13:39:10.653' AS DateTime), N'64pku9mrrkhrh3nbifoijph7h7', 3, 1)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (96, 96, 96, 0, CAST(N'2022-09-06T12:03:53.393' AS DateTime), 1, CAST(N'2023-08-22T12:45:35.480' AS DateTime), 3, 0, NULL, 0, CAST(N'2022-11-04T12:57:55.717' AS DateTime), N'64pku9mrrkhrh3nbifoijph7h7', NULL, 0)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (97, 97, 97, 1, CAST(N'2022-09-06T12:56:22.250' AS DateTime), 1, CAST(N'2022-09-06T12:56:45.437' AS DateTime), 1, 0, NULL, 0, CAST(N'2022-09-21T10:10:42.707' AS DateTime), N'ekspuft8ov38rvck5iooc5o8n1', NULL, 1)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (98, 98, 98, 1, CAST(N'2022-09-06T13:00:35.893' AS DateTime), 1, CAST(N'2022-09-06T13:01:31.813' AS DateTime), 1, 0, NULL, 0, CAST(N'2022-11-04T13:02:37.927' AS DateTime), N'64pku9mrrkhrh3nbifoijph7h7', NULL, 1)
INSERT [dbo].[SMS_PAIRING] ([Id], [SmartCardId], [StbId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [IsLocked], [LockedOn], [LockedFrom], [sms_id], [AllocatedOperatorId]) VALUES (99, 99, 99, 1, CAST(N'2022-09-06T13:07:42.483' AS DateTime), 1, CAST(N'2022-09-06T13:19:12.540' AS DateTime), 1, 0, NULL, 0, CAST(N'2022-10-07T16:48:20.210' AS DateTime), N'hh68n6f9sgaeqe3vk3oqh170s5', NULL, 1)
SET IDENTITY_INSERT [dbo].[SMS_PAIRING] OFF
GO
/****** Object:  Index [IX_SMS_PAIRING]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_PAIRING] ADD  CONSTRAINT [IX_SMS_PAIRING] UNIQUE NONCLUSTERED 
(
	[SmartCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_PAIRING_11_1634820886__K3_K1_K2]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_PAIRING_11_1634820886__K3_K1_K2] ON [dbo].[SMS_PAIRING]
(
	[StbId] ASC,
	[Id] ASC,
	[SmartCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_PAIRING_5_1634820886__K1]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_PAIRING_5_1634820886__K1] ON [dbo].[SMS_PAIRING]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_PAIRING_5_1634820886__K1_K3]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_PAIRING_5_1634820886__K1_K3] ON [dbo].[SMS_PAIRING]
(
	[Id] ASC,
	[StbId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_PAIRING_5_1634820886__K1_K3_K2]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_PAIRING_5_1634820886__K1_K3_K2] ON [dbo].[SMS_PAIRING]
(
	[Id] ASC,
	[StbId] ASC,
	[SmartCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [_dta_index_SMS_PAIRING_5_1634820886__K11_K13]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_PAIRING_5_1634820886__K11_K13] ON [dbo].[SMS_PAIRING]
(
	[IsLocked] ASC,
	[LockedFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_PAIRING_5_1634820886__K3_K2_K1_4_11_12_15]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_PAIRING_5_1634820886__K3_K2_K1_4_11_12_15] ON [dbo].[SMS_PAIRING]
(
	[StbId] ASC,
	[SmartCardId] ASC,
	[Id] ASC
)
INCLUDE([Status],[IsLocked],[LockedOn],[AllocatedOperatorId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_PAIRING_5_1634820886__K4_K15_K1_K2_K3_K6_5]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_PAIRING_5_1634820886__K4_K15_K1_K2_K3_K6_5] ON [dbo].[SMS_PAIRING]
(
	[Status] ASC,
	[AllocatedOperatorId] ASC,
	[Id] ASC,
	[SmartCardId] ASC,
	[StbId] ASC,
	[CreatedBy] ASC
)
INCLUDE([CreatedOn]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [_dta_index_SMS_PAIRING_7_1634820886__K3_K1_K2_K4_K5_K6_K7_K8_K9_K10_K11_K12_K13]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_PAIRING_7_1634820886__K3_K1_K2_K4_K5_K6_K7_K8_K9_K10_K11_K12_K13] ON [dbo].[SMS_PAIRING]
(
	[StbId] ASC,
	[Id] ASC,
	[SmartCardId] ASC,
	[Status] ASC,
	[CreatedOn] ASC,
	[CreatedBy] ASC,
	[UpdatedOn] ASC,
	[UpdatedBy] ASC,
	[Deleted] ASC,
	[Remark] ASC,
	[IsLocked] ASC,
	[LockedOn] ASC,
	[LockedFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SMS_PAIRING_1]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [IX_SMS_PAIRING_1] ON [dbo].[SMS_PAIRING]
(
	[StbId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_PAIRING] ADD  CONSTRAINT [DF_SMS_PAIRING_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_PAIRING] ADD  CONSTRAINT [DF_SMS_PAIRING_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_PAIRING] ADD  CONSTRAINT [DF_SMS_PAIRING_IsLocked]  DEFAULT ((0)) FOR [IsLocked]
GO
ALTER TABLE [dbo].[SMS_PAIRING]  WITH NOCHECK ADD  CONSTRAINT [FK_SMS_PAIRING_SMS_SMARTCARDS] FOREIGN KEY([SmartCardId])
REFERENCES [dbo].[SMS_SMARTCARDS] ([Id])
GO
ALTER TABLE [dbo].[SMS_PAIRING] CHECK CONSTRAINT [FK_SMS_PAIRING_SMS_SMARTCARDS]
GO
ALTER TABLE [dbo].[SMS_PAIRING]  WITH NOCHECK ADD  CONSTRAINT [FK_SMS_PAIRING_SMS_STBS] FOREIGN KEY([StbId])
REFERENCES [dbo].[SMS_STBS] ([Id])
GO
ALTER TABLE [dbo].[SMS_PAIRING] CHECK CONSTRAINT [FK_SMS_PAIRING_SMS_STBS]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=QC Done
0=Under QC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_PAIRING', @level2type=N'COLUMN',@level2name=N'Status'
GO

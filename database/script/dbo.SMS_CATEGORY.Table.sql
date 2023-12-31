USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CATEGORY]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CATEGORY](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Title] [varchar](150) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [bigint] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sms_id] [bigint] NULL,
 CONSTRAINT [PK_SMS_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_CATEGORY] ON 

INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (2, N'HINDI GEC', N'HINDI GEC', 1, CAST(N'2015-04-08T10:24:47.860' AS DateTime), 10003, CAST(N'2015-04-08T11:28:54.293' AS DateTime), 10003, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (3, N'KIDS', N'KIDS', 1, CAST(N'2015-04-08T11:26:14.463' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (4, N'ENGLISH NEWS', N'ENGLISH NEWS', 1, CAST(N'2015-04-08T11:26:28.463' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (5, N'SPORTS', N'SPORTS', 1, CAST(N'2015-04-08T11:26:40.760' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (6, N'HINDI MOVIES', N'HINDI MOVIES', 1, CAST(N'2015-04-08T11:26:55.137' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (7, N'ENGLISH MOVIES', N'ENGLISH MOVIES', 1, CAST(N'2015-04-08T11:27:08.463' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (8, N'LIFE STYLE', N'LIFE STYLE', 1, CAST(N'2015-04-08T11:27:22.370' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (9, N'REGIONAL', N'REGIONAL', 1, CAST(N'2015-04-08T11:27:33.347' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10, N'INFOTAINMENT', N'INFOTAINMENT', 1, CAST(N'2015-04-08T11:27:46.903' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (11, N'HINDI NEWS', N'HINDI NEWS', 1, CAST(N'2015-04-08T11:28:38.000' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (12, N'ENGLISH GEC', N'ENGLISH GEC', 1, CAST(N'2015-04-08T11:29:06.577' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (13, N'REGIONAL NEWS', N'REGIONAL NEWS', 1, CAST(N'2015-04-08T11:31:45.277' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (14, N'SPIRITUAL', N'SPIRITUAL', 1, CAST(N'2015-04-08T11:32:18.780' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (15, N'MUSIC', N'MUSIC', 1, CAST(N'2015-04-08T11:32:48.673' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (16, N'KANNADA NEWS', N'KANNADA NEWS', 1, CAST(N'2015-04-08T11:53:34.200' AS DateTime), 10003, CAST(N'2021-04-23T17:31:17.643' AS DateTime), 3, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (17, N'HD', N'High Defenition', 1, CAST(N'2015-04-09T16:14:00.223' AS DateTime), 10003, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (18, N'LOCAL CHANNELS', N'LOCAL CHANNELS', 1, CAST(N'2019-02-03T12:51:56.667' AS DateTime), 52, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10018, N'SHOPPING', N'SHOPPING', 1, CAST(N'2019-02-03T14:55:55.997' AS DateTime), 52, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10019, N'HINDI ENTERTAINMENT', N'HINDI ENTERTAINMENT', 1, CAST(N'2019-10-23T12:14:47.977' AS DateTime), 10002, CAST(N'2021-03-28T11:40:58.313' AS DateTime), 3, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10020, N'KANNADA MOVIES', N'KANNADA MOVIES', 1, CAST(N'2019-10-23T13:05:03.167' AS DateTime), 10002, CAST(N'2021-03-28T11:40:30.790' AS DateTime), 3, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10021, N'OTHER', N'OTHER', 1, CAST(N'2019-10-23T15:45:54.717' AS DateTime), 10002, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10022, N'KANNADA ENTERTAIMENT', N'KANNADA ENTERTAIMENT', 1, CAST(N'2019-10-23T18:28:21.147' AS DateTime), 10002, CAST(N'2021-03-28T11:40:07.557' AS DateTime), 3, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10023, N'FTA', N'FTA CHANNELS', 1, CAST(N'2019-10-24T12:45:35.577' AS DateTime), 10002, CAST(N'2021-03-28T11:39:34.473' AS DateTime), 3, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10024, N'LOCAL', N'LOCAL', 1, CAST(N'2019-10-24T16:08:11.793' AS DateTime), 10002, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10025, N'INTERNATIONAL', N'INTERNATIONAL', 1, CAST(N'2022-09-27T17:33:44.450' AS DateTime), 3, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10026, N'BUSSINESS NEWS', N'BUSSINESS', 1, CAST(N'2022-09-27T17:34:10.630' AS DateTime), 3, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_CATEGORY] ([Id], [Title], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10027, N'INTERNATIONAL MOVIES', N'INTERNATIONAL MOVIES', 1, CAST(N'2022-09-27T19:06:00.560' AS DateTime), 3, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SMS_CATEGORY] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_CATEGORY]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_CATEGORY] ADD  CONSTRAINT [IX_SMS_CATEGORY] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_CATEGORY] ADD  CONSTRAINT [DF_SMS_CATEGORY_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_CATEGORY] ADD  CONSTRAINT [DF_SMS_CATEGORY_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

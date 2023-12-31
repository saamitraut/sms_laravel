USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_AREACODE_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_AREACODE_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[AREACODE] [varchar](50) NOT NULL,
	[NAME] [varchar](200) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[OperatorId] [bigint] NOT NULL,
	[CREATEDON] [datetime] NOT NULL,
	[UPDATEDON] [datetime] NULL,
	[CREATEDBY] [bigint] NOT NULL,
	[UPDATEDBY] [bigint] NULL,
	[Remark] [varchar](250) NULL,
	[Deleted] [bit] NOT NULL,
	[sms_id] [bigint] NULL,
	[AREACASCODE] [int] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SMS_AREACODE_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_AREACODE_HISTORY] ON 

INSERT [dbo].[SMS_AREACODE_HISTORY] ([Id], [FID], [AREACODE], [NAME], [Status], [OperatorId], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sms_id], [AREACASCODE], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'OZ001', N'OZONE', N'Active', 1, CAST(N'2022-08-06T13:03:54.703' AS DateTime), NULL, 1, NULL, NULL, 0, NULL, 1, CAST(N'2022-08-06T13:03:54.747' AS DateTime), 1, 0, 2, N'AREACASCODE,')
INSERT [dbo].[SMS_AREACODE_HISTORY] ([Id], [FID], [AREACODE], [NAME], [Status], [OperatorId], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sms_id], [AREACASCODE], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 1, N'OZ001', N'OZONE', N'Active', 1, CAST(N'2022-08-06T13:03:54.703' AS DateTime), NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2022-08-06T13:03:54.770' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_AREACODE_HISTORY] ([Id], [FID], [AREACODE], [NAME], [Status], [OperatorId], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sms_id], [AREACASCODE], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (3, 2, N'OZP001', N'FARIDABAD', N'Active', 2, CAST(N'2023-06-06T14:07:22.667' AS DateTime), NULL, 3, NULL, NULL, 0, NULL, 2, CAST(N'2023-06-06T14:07:22.727' AS DateTime), 3, 0, 2, N'AREACASCODE,')
INSERT [dbo].[SMS_AREACODE_HISTORY] ([Id], [FID], [AREACODE], [NAME], [Status], [OperatorId], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sms_id], [AREACASCODE], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (4, 2, N'OZP001', N'FARIDABAD', N'Active', 2, CAST(N'2023-06-06T14:07:22.667' AS DateTime), NULL, 3, NULL, NULL, 0, NULL, 0, CAST(N'2023-06-06T14:07:22.743' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_AREACODE_HISTORY] ([Id], [FID], [AREACODE], [NAME], [Status], [OperatorId], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sms_id], [AREACASCODE], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (5, 3, N'OZP002', N'PARK ELITE', N'Active', 2, CAST(N'2023-08-21T13:46:54.473' AS DateTime), NULL, 3, NULL, NULL, 0, NULL, 3, CAST(N'2023-08-21T13:46:54.477' AS DateTime), 3, 0, 2, N'AREACASCODE,')
INSERT [dbo].[SMS_AREACODE_HISTORY] ([Id], [FID], [AREACODE], [NAME], [Status], [OperatorId], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sms_id], [AREACASCODE], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (6, 3, N'OZP002', N'PARK ELITE', N'Active', 2, CAST(N'2023-08-21T13:46:54.473' AS DateTime), NULL, 3, NULL, NULL, 0, NULL, 0, CAST(N'2023-08-21T13:46:54.477' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_AREACODE_HISTORY] ([Id], [FID], [AREACODE], [NAME], [Status], [OperatorId], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sms_id], [AREACASCODE], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (7, 3, N'OZP002', N'PARK ELITE', N'Active', 1, CAST(N'2023-08-21T13:46:54.473' AS DateTime), CAST(N'2023-08-21T14:03:37.610' AS DateTime), 3, 3, NULL, 0, NULL, 3, CAST(N'2023-08-21T14:03:37.610' AS DateTime), 3, 6, 2, N'OperatorId,')
INSERT [dbo].[SMS_AREACODE_HISTORY] ([Id], [FID], [AREACODE], [NAME], [Status], [OperatorId], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sms_id], [AREACASCODE], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (8, 3, N'OZP002', N'PARK ELITE', N'Active', 2, CAST(N'2023-08-21T13:46:54.473' AS DateTime), CAST(N'2023-08-21T14:06:19.593' AS DateTime), 3, 3, NULL, 0, NULL, 3, CAST(N'2023-08-21T14:06:19.593' AS DateTime), 3, 7, 2, N'OperatorId,')
SET IDENTITY_INSERT [dbo].[SMS_AREACODE_HISTORY] OFF
GO
ALTER TABLE [dbo].[SMS_AREACODE_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_AREACODE_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_BROADCASTER_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_BROADCASTER_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[BROADCASTERNAME] [varchar](100) NOT NULL,
	[BROADCASTERDESC] [varchar](255) NULL,
	[CREATEDON] [datetime] NOT NULL,
	[UPDATEDON] [datetime] NULL,
	[CREATEDBY] [bigint] NOT NULL,
	[UPDATEDBY] [bigint] NULL,
	[STATUS] [varchar](50) NOT NULL,
	[Deleted] [bigint] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sms_id] [bigint] NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SMS_BROADCASTER_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_BROADCASTER_HISTORY] ON 

INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'OZONE', N'OZONE', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 1, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-08-06T10:07:52.610' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 2, N'SUN TV NETWORK', N'SUN TV NETWORK', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T15:37:20.773' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (3, 3, N'Star India Private Limited', N'Star India Private Limited', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T15:37:20.787' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (4, 4, N'Zee Entertainment Enterprises Ltd', N'Zee Entertainment Enterprises Ltd', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T15:37:20.790' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (5, 5, N'Sony Pictures Networks Distribution India Private Limited', N'Sony Pictures Networks Distribution India Private Limited', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T15:37:20.797' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (6, 6, N'Indiacast Media Distribution Pvt. ltd', N'Indiacast Media Distribution Pvt. ltd', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T15:37:20.800' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (7, 7, N'Discovery Communications India', N'Discovery Communications India', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T15:37:20.803' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (8, 8, N'TURNER', N'TURNER', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T15:37:20.810' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (9, 9, N'Eenadu Television Pvt Limited', N'Eenadu Television Pvt Limited', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T15:37:20.810' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (10, 10, N'TIMES NETWORK', N'TIMES NETWORK', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T15:37:20.813' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (11, 11, N'NDTV', N'NDTV', CAST(N'2022-09-26T15:39:04.723' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T15:37:20.820' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (12, 12, N'FTA', N'FTA', CAST(N'2022-09-26T17:16:28.307' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-26T17:16:28.307' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (13, 13, N'EPIC PVT. LTD', N'EPIC PVT.LTD', CAST(N'2022-09-27T16:41:57.740' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2022-09-27T16:41:57.740' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (14, 14, N'AAJ TAJ PACK', N'AAJ TAJ PACK', CAST(N'2023-05-29T19:59:14.100' AS DateTime), NULL, 3, NULL, N'Active', 0, NULL, NULL, CAST(N'2023-05-29T19:59:14.107' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BROADCASTER_HISTORY] ([Id], [FID], [BROADCASTERNAME], [BROADCASTERDESC], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [STATUS], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (15, 20, N'TV18', N'TV18', CAST(N'2023-10-21T12:30:05.167' AS DateTime), NULL, 1, NULL, N'1', 0, N'TV18', NULL, CAST(N'2023-10-21T12:30:05.200' AS DateTime), 1, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[SMS_BROADCASTER_HISTORY] OFF
GO
ALTER TABLE [dbo].[SMS_BROADCASTER_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_BROADCASTER_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

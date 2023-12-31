USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_OPERATOR_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_OPERATOR_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[NAME] [varchar](150) NOT NULL,
	[CODE] [varchar](50) NULL,
	[CONTACTPERSON] [varchar](150) NULL,
	[ParentId] [bigint] NOT NULL,
	[TobeBilled] [bit] NOT NULL,
	[BillingFrom] [date] NULL,
	[ADDRESS] [varchar](255) NOT NULL,
	[MOBILE] [bigint] NULL,
	[Email] [varchar](150) NULL,
	[PHONE] [varchar](150) NOT NULL,
	[STATUS] [bit] NOT NULL,
	[CREATEDON] [datetime] NOT NULL,
	[UPDATEDON] [datetime] NULL,
	[CREATEDBY] [bigint] NOT NULL,
	[UPDATEDBY] [bigint] NULL,
	[LogInId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Deleted] [bigint] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sms_id] [bigint] NULL,
	[branch] [int] NOT NULL,
	[AreaId] [bigint] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SMS_OPERATOR_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_OPERATOR_HISTORY] ON 

INSERT [dbo].[SMS_OPERATOR_HISTORY] ([Id], [FID], [NAME], [CODE], [CONTACTPERSON], [ParentId], [TobeBilled], [BillingFrom], [ADDRESS], [MOBILE], [Email], [PHONE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [LogInId], [Password], [Deleted], [Remark], [sms_id], [branch], [AreaId], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'OZONE HEADEND', N'OZ001', N'OZONE', 0, 1, CAST(N'2022-08-01' AS Date), N'OZONE', 9988776655, N'', N'', 1, CAST(N'2022-08-06T13:03:32.617' AS DateTime), NULL, 1, NULL, N'OZONE', N'e10adc3949ba59abbe56e057f20f883e', 0, NULL, NULL, 1, 0, CAST(N'2022-08-06T13:03:32.633' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_OPERATOR_HISTORY] ([Id], [FID], [NAME], [CODE], [CONTACTPERSON], [ParentId], [TobeBilled], [BillingFrom], [ADDRESS], [MOBILE], [Email], [PHONE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [LogInId], [Password], [Deleted], [Remark], [sms_id], [branch], [AreaId], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 2, N'OZONE MEDIA DP', N'SUNNY', N'OZONE', 0, 1, CAST(N'2023-06-01' AS Date), N'C BLOCK BASEMENT', 9811998733, N'', N'', 1, CAST(N'2023-06-06T13:47:45.970' AS DateTime), NULL, 3, NULL, N'OZONE DP', N'11b9842e0a271ff252c1903e7132cd68', 0, NULL, NULL, 1, 0, CAST(N'2023-06-06T13:47:45.990' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_OPERATOR_HISTORY] ([Id], [FID], [NAME], [CODE], [CONTACTPERSON], [ParentId], [TobeBilled], [BillingFrom], [ADDRESS], [MOBILE], [Email], [PHONE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [LogInId], [Password], [Deleted], [Remark], [sms_id], [branch], [AreaId], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (3, 2, N'OZONE MEDIA DP', N'SUNNY', N'OZONE', 0, 1, CAST(N'2023-06-01' AS Date), N'C BLOCK BASEMENT', 9811998733, N'', N'', 1, CAST(N'2023-06-06T13:47:45.970' AS DateTime), CAST(N'2023-06-06T13:52:41.463' AS DateTime), 3, 3, N'OZONE DP', N'11b9842e0a271ff252c1903e7132cd68', 0, NULL, NULL, 2, 0, CAST(N'2023-06-06T13:52:41.700' AS DateTime), 3, 2, 2, N'branch,')
INSERT [dbo].[SMS_OPERATOR_HISTORY] ([Id], [FID], [NAME], [CODE], [CONTACTPERSON], [ParentId], [TobeBilled], [BillingFrom], [ADDRESS], [MOBILE], [Email], [PHONE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [LogInId], [Password], [Deleted], [Remark], [sms_id], [branch], [AreaId], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (4, 1, N'OZONE HEADEND', N'OZ001', N'OZONE', 0, 1, CAST(N'2022-08-01' AS Date), N'OZONE', 9988776655, N'', N'', 1, CAST(N'2022-08-06T13:03:32.617' AS DateTime), CAST(N'2023-08-21T14:04:49.950' AS DateTime), 1, 3, N'OZONE', N'e10adc3949ba59abbe56e057f20f883e', 0, NULL, NULL, 2, 0, CAST(N'2023-08-21T14:04:49.950' AS DateTime), 3, 1, 2, N'branch,')
INSERT [dbo].[SMS_OPERATOR_HISTORY] ([Id], [FID], [NAME], [CODE], [CONTACTPERSON], [ParentId], [TobeBilled], [BillingFrom], [ADDRESS], [MOBILE], [Email], [PHONE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [LogInId], [Password], [Deleted], [Remark], [sms_id], [branch], [AreaId], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (5, 2, N'OZONE MEDIA DP', N'SUNNY', N'OZONE', 0, 1, CAST(N'2023-06-01' AS Date), N'C BLOCK BASEMENT', 9811998733, N'', N'', 1, CAST(N'2023-06-06T13:47:45.970' AS DateTime), CAST(N'2023-08-21T14:06:05.417' AS DateTime), 3, 3, N'OZONE DP', N'11b9842e0a271ff252c1903e7132cd68', 0, NULL, NULL, 1, 0, CAST(N'2023-08-21T14:06:05.417' AS DateTime), 3, 3, 2, N'branch,')
INSERT [dbo].[SMS_OPERATOR_HISTORY] ([Id], [FID], [NAME], [CODE], [CONTACTPERSON], [ParentId], [TobeBilled], [BillingFrom], [ADDRESS], [MOBILE], [Email], [PHONE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [LogInId], [Password], [Deleted], [Remark], [sms_id], [branch], [AreaId], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (6, 2, N'OZONE MEDIA DP', N'SUNNY', N'OZONE', 0, 1, CAST(N'2023-06-01' AS Date), N'C BLOCK BASEMENT', 9811998733, N'', N'', 1, CAST(N'2023-06-06T13:47:45.970' AS DateTime), CAST(N'2023-08-21T14:07:02.190' AS DateTime), 3, 3, N'OZONE DP', N'11b9842e0a271ff252c1903e7132cd68', 0, NULL, NULL, 2, 0, CAST(N'2023-08-21T14:07:02.190' AS DateTime), 3, 5, 2, N'branch,')
INSERT [dbo].[SMS_OPERATOR_HISTORY] ([Id], [FID], [NAME], [CODE], [CONTACTPERSON], [ParentId], [TobeBilled], [BillingFrom], [ADDRESS], [MOBILE], [Email], [PHONE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [LogInId], [Password], [Deleted], [Remark], [sms_id], [branch], [AreaId], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (7, 2, N'OZONE MEDIA DP', N'SUNNY', N'OZONE', 0, 1, CAST(N'2023-06-01' AS Date), N'C BLOCK BASEMENT', 9811998733, N'', N'', 1, CAST(N'2023-06-06T13:47:45.970' AS DateTime), CAST(N'2023-08-21T14:10:53.823' AS DateTime), 3, 3, N'OZONE DP', N'11b9842e0a271ff252c1903e7132cd68', 0, NULL, NULL, 1, 0, CAST(N'2023-08-21T14:10:53.827' AS DateTime), 3, 6, 2, N'branch,')
SET IDENTITY_INSERT [dbo].[SMS_OPERATOR_HISTORY] OFF
GO
ALTER TABLE [dbo].[SMS_OPERATOR_HISTORY] ADD  CONSTRAINT [DF__SMS_OPERA__Inser__4C2DC41B]  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_OPERATOR_HISTORY] ADD  CONSTRAINT [DF__SMS_OPERA__Previ__4D21E854]  DEFAULT ((0)) FOR [PreviousId]
GO

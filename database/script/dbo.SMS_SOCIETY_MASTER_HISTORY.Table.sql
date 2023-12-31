USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_SOCIETY_MASTER_HISTORY]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_SOCIETY_MASTER_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[SocietyCode] [varchar](50) NOT NULL,
	[SocietyName] [varchar](150) NOT NULL,
	[AreaId] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sms_id] [bigint] NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SMS_SOCIETY_MASTER_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_SOCIETY_MASTER_HISTORY] ON 

INSERT [dbo].[SMS_SOCIETY_MASTER_HISTORY] ([Id], [FID], [SocietyCode], [SocietyName], [AreaId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'OZ001', N'OZONE', 1, 1, CAST(N'2022-08-06T13:04:09.440' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-08-06T13:04:09.447' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SOCIETY_MASTER_HISTORY] ([Id], [FID], [SocietyCode], [SocietyName], [AreaId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 2, N'FBD01', N'PRANAYAM', 2, 1, CAST(N'2023-06-06T14:08:37.047' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-06-06T14:08:37.053' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SOCIETY_MASTER_HISTORY] ([Id], [FID], [SocietyCode], [SocietyName], [AreaId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (3, 3, N'OZ002', N'PARK ELITE', 3, 1, CAST(N'2023-08-21T13:48:35.470' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-08-21T13:48:35.470' AS DateTime), 3, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[SMS_SOCIETY_MASTER_HISTORY] OFF
GO
ALTER TABLE [dbo].[SMS_SOCIETY_MASTER_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_SOCIETY_MASTER_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

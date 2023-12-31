USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_ACCESS_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_ACCESS_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[NAME] [varchar](100) NOT NULL,
	[LOGINID] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](50) NOT NULL,
	[USERTYPE] [varchar](50) NOT NULL,
	[STATUS] [bit] NOT NULL,
	[CREATEDON] [datetime] NOT NULL,
	[UPDATEDON] [datetime] NULL,
	[CREATEDBY] [bigint] NOT NULL,
	[UPDATEDBY] [bigint] NULL,
	[OperatorID] [bigint] NULL,
	[Remark] [varchar](250) NULL,
	[deleted] [bit] NOT NULL,
	[sms_id] [bigint] NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SMS_ACCESS_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_ACCESS_HISTORY] ON 

INSERT [dbo].[SMS_ACCESS_HISTORY] ([Id], [FID], [NAME], [LOGINID], [PASSWORD], [USERTYPE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [OperatorID], [Remark], [deleted], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 2, N'OZONE HEADEND', N'OZONE', N'e10adc3949ba59abbe56e057f20f883e', N'Operator', 1, CAST(N'2022-08-06T13:03:32.620' AS DateTime), NULL, 1, NULL, 1, NULL, 0, NULL, CAST(N'2022-08-06T13:03:32.627' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_ACCESS_HISTORY] ([Id], [FID], [NAME], [LOGINID], [PASSWORD], [USERTYPE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [OperatorID], [Remark], [deleted], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (3, 3, N'ozoneadmin', N'ozoneadmin', N'd0970714757783e6cf17b26fb8e2298f', N'Admin', 1, CAST(N'2022-09-09T14:08:14.550' AS DateTime), NULL, 1, NULL, NULL, NULL, 0, NULL, CAST(N'2022-09-09T14:08:14.553' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_ACCESS_HISTORY] ([Id], [FID], [NAME], [LOGINID], [PASSWORD], [USERTYPE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [OperatorID], [Remark], [deleted], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (4, 3, N'ozoneadmin', N'ozoneadmin', N'e10adc3949ba59abbe56e057f20f883e', N'Admin', 1, CAST(N'2022-09-09T14:08:14.550' AS DateTime), CAST(N'2022-11-06T17:14:03.267' AS DateTime), 1, 1, NULL, NULL, 0, NULL, CAST(N'2022-11-06T17:14:03.300' AS DateTime), 1, 3, 2, N'PASSWORD,')
INSERT [dbo].[SMS_ACCESS_HISTORY] ([Id], [FID], [NAME], [LOGINID], [PASSWORD], [USERTYPE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [OperatorID], [Remark], [deleted], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (5, 3, N'ozoneadmin', N'ozoneadmin', N'c4ca4238a0b923820dcc509a6f75849b', N'Admin', 1, CAST(N'2022-09-09T14:08:14.550' AS DateTime), CAST(N'2023-04-17T19:50:57.880' AS DateTime), 1, 3, NULL, NULL, 0, NULL, CAST(N'2023-04-17T19:50:57.907' AS DateTime), 3, 4, 2, N'PASSWORD,')
INSERT [dbo].[SMS_ACCESS_HISTORY] ([Id], [FID], [NAME], [LOGINID], [PASSWORD], [USERTYPE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [OperatorID], [Remark], [deleted], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (6, 4, N'OZONE MEDIA DP', N'OZONE DP', N'11b9842e0a271ff252c1903e7132cd68', N'Operator', 1, CAST(N'2023-06-06T13:47:45.973' AS DateTime), NULL, 3, NULL, 2, NULL, 0, NULL, CAST(N'2023-06-06T13:47:45.980' AS DateTime), 3, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[SMS_ACCESS_HISTORY] OFF
GO
ALTER TABLE [dbo].[SMS_ACCESS_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_ACCESS_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING_DATA]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING_DATA](
	[DaysActive] [bigint] NULL,
	[Id] [bigint] NULL,
	[FID] [bigint] NULL,
	[CustomerId] [varchar](50) NULL,
	[SubscriberName] [varchar](150) NULL,
	[SmartcardNo] [varchar](50) NULL,
	[STBNo] [varchar](50) NULL,
	[AccountId] [bigint] NULL,
	[ProductId] [bigint] NULL,
	[IsAlacarte] [bit] NULL,
	[ActivationDate] [datetime] NULL,
	[DeactivationDate] [datetime] NULL,
	[Flag] [bit] NULL,
	[Status] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](100) NULL,
	[InsertedOn] [datetime] NULL,
	[InsertedBy] [int] NULL,
	[DMLAction] [tinyint] NULL,
	[DMLComments] [varchar](100) NULL,
	[GeneratedOn] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING_DATA] ([DaysActive], [Id], [FID], [CustomerId], [SubscriberName], [SmartcardNo], [STBNo], [AccountId], [ProductId], [IsAlacarte], [ActivationDate], [DeactivationDate], [Flag], [Status], [CreatedOn], [CreatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [DMLAction], [DMLComments], [GeneratedOn]) VALUES (17, 31, 5, N'OZN0000001', N'HEADEND OZONE OZONE', N'8006064231081780', N'23117160003914', 4, 1, 0, CAST(N'2022-08-17T00:00:00.000' AS DateTime), CAST(N'2022-09-16T00:00:00.000' AS DateTime), 0, 0, CAST(N'2022-09-20T19:12:37.877' AS DateTime), 3, 0, N'AccountSuspended', CAST(N'2022-09-20T19:12:37.877' AS DateTime), 3, 2, N'Status,', CAST(N'2022-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING_DATA] ([DaysActive], [Id], [FID], [CustomerId], [SubscriberName], [SmartcardNo], [STBNo], [AccountId], [ProductId], [IsAlacarte], [ActivationDate], [DeactivationDate], [Flag], [Status], [CreatedOn], [CreatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [DMLAction], [DMLComments], [GeneratedOn]) VALUES (16, 39, 18, N'OZN0000001', N'HEADEND OZONE OZONE', N'8006064266345324', N'23122290123541', 16, 1, 0, CAST(N'2022-09-21T00:00:00.000' AS DateTime), CAST(N'2022-10-21T00:00:00.000' AS DateTime), 0, 1, CAST(N'2022-09-21T09:47:29.140' AS DateTime), 3, 0, N'prp_d_create_both_account', CAST(N'2022-09-21T09:47:29.140' AS DateTime), 3, 1, N'Inserted', CAST(N'2022-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING_DATA] ([DaysActive], [Id], [FID], [CustomerId], [SubscriberName], [SmartcardNo], [STBNo], [AccountId], [ProductId], [IsAlacarte], [ActivationDate], [DeactivationDate], [Flag], [Status], [CreatedOn], [CreatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [DMLAction], [DMLComments], [GeneratedOn]) VALUES (16, 43, 20, N'OZN0000001', N'HEADEND OZONE OZONE', N'8006064266548349', N'23122290123566', 18, 1, 0, CAST(N'2022-09-21T00:00:00.000' AS DateTime), CAST(N'2025-03-09T00:00:00.000' AS DateTime), 0, 1, CAST(N'2022-09-21T10:11:12.783' AS DateTime), 3, 0, N'prp_d_create_both_account', CAST(N'2022-09-21T10:11:12.783' AS DateTime), 3, 1, N'Inserted', CAST(N'2022-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING_DATA] ([DaysActive], [Id], [FID], [CustomerId], [SubscriberName], [SmartcardNo], [STBNo], [AccountId], [ProductId], [IsAlacarte], [ActivationDate], [DeactivationDate], [Flag], [Status], [CreatedOn], [CreatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [DMLAction], [DMLComments], [GeneratedOn]) VALUES (16, 45, 21, N'OZN0000001', N'HEADEND OZONE OZONE', N'8006064266450777', N'23122290123558', 19, 1, 0, CAST(N'2022-09-21T00:00:00.000' AS DateTime), CAST(N'2025-03-09T00:00:00.000' AS DateTime), 0, 1, CAST(N'2022-09-21T10:13:36.190' AS DateTime), 3, 0, N'prp_d_create_both_account', CAST(N'2022-09-21T10:13:36.190' AS DateTime), 3, 1, N'Inserted', CAST(N'2022-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING_DATA] ([DaysActive], [Id], [FID], [CustomerId], [SubscriberName], [SmartcardNo], [STBNo], [AccountId], [ProductId], [IsAlacarte], [ActivationDate], [DeactivationDate], [Flag], [Status], [CreatedOn], [CreatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [DMLAction], [DMLComments], [GeneratedOn]) VALUES (1, 55, 22, N'OZN0000001', N'HEADEND OZONE OZONE', N'8006064266548398', N'23122290123533', 20, 1, 0, CAST(N'2022-09-21T00:00:00.000' AS DateTime), CAST(N'2022-10-21T00:00:00.000' AS DateTime), 0, 1, CAST(N'2022-10-06T14:56:59.737' AS DateTime), 3, 0, N'AccountResumed', CAST(N'2022-10-06T14:56:59.737' AS DateTime), 3, 2, N'Status,', CAST(N'2022-10-07T00:00:00.000' AS DateTime))
GO

USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_PACKAGE]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_PACKAGE](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PackageName] [varchar](150) NOT NULL,
	[CasCode] [int] NULL,
	[Price] [float] NOT NULL,
	[Price2] [float] NOT NULL,
	[BillingCycle] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[Description] [varchar](250) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[PackageType] [bit] NULL,
	[CasCodeGospel] [int] NOT NULL,
	[IsPrepaid] [bit] NOT NULL,
	[CasCodeTelelynx] [varchar](50) NULL,
	[BranchId] [bigint] NULL,
	[DASType] [bit] NULL,
	[CasCodeNSTV] [varchar](50) NULL,
	[CasCodeKingvon] [varchar](50) NULL,
	[CasCodeCatVision] [varchar](50) NULL,
	[CasCodeBCas] [varchar](50) NULL,
	[broadcaster_id] [bigint] NULL,
 CONSTRAINT [PK_SMS_PACKAGE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_PACKAGE] ON 

INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (1, N'Sun Package', 999, 0, 0, 1, CAST(N'2022-08-06T00:00:00.000' AS DateTime), CAST(N'2032-08-02T00:00:00.000' AS DateTime), 1, N'All Channel Pack', CAST(N'2022-08-06T12:58:33.460' AS DateTime), 1, CAST(N'2023-04-24T19:03:55.000' AS DateTime), 3, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (2, N'FTA', 997, 0, 0, 1, CAST(N'2022-10-07T00:00:00.000' AS DateTime), CAST(N'2030-10-31T00:00:00.000' AS DateTime), 1, N'Sony test1 Broadcastaudit', CAST(N'2022-10-07T15:15:01.067' AS DateTime), 3, CAST(N'2023-06-05T16:11:52.000' AS DateTime), 3, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 12)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (3, N'SONY FAMILY', 995, 43, 0, 1, CAST(N'2022-11-04T00:00:00.000' AS DateTime), CAST(N'2029-11-30T00:00:00.000' AS DateTime), 1, N'ICAST TRAI  AUDIT', CAST(N'2022-11-04T12:45:44.950' AS DateTime), 1, CAST(N'2023-06-08T16:40:22.000' AS DateTime), 3, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (4, N'Colors Family', 994, 0, 0, 1, CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2030-11-30T00:00:00.000' AS DateTime), 1, N'TRAI STAR AUDIT', CAST(N'2022-11-06T16:36:33.890' AS DateTime), 1, CAST(N'2023-05-26T17:35:29.000' AS DateTime), 3, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 20)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (5, N'Family Value Pack', 991, 0, 0, 1, CAST(N'2023-04-17T00:00:00.000' AS DateTime), CAST(N'2024-04-16T00:00:00.000' AS DateTime), 1, N'Value Pack', CAST(N'2023-04-17T13:39:36.387' AS DateTime), 3, CAST(N'2023-04-25T16:52:48.487' AS DateTime), 3, 0, NULL, 0, 0, 1, N'', 0, 0, N'', N'', N'', NULL, NULL)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (6, N'ZEE FAMILY', 992, 43, 0, 1, CAST(N'2023-04-24T00:00:00.000' AS DateTime), CAST(N'2030-04-30T00:00:00.000' AS DateTime), 1, N'ZEE FAMILY', CAST(N'2023-04-24T09:35:30.160' AS DateTime), 3, CAST(N'2023-06-06T13:21:55.000' AS DateTime), 3, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (7, N'Discovery Pack', 993, 0, 0, 1, CAST(N'2023-04-24T00:00:00.000' AS DateTime), CAST(N'2030-04-30T00:00:00.000' AS DateTime), 1, N'Discovery PACK', CAST(N'2023-04-24T09:36:11.253' AS DateTime), 3, CAST(N'2023-06-21T16:00:00.000' AS DateTime), 3, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (8, N'Times Now Pack', 996, 13, 0, 1, CAST(N'2023-04-24T00:00:00.000' AS DateTime), CAST(N'2030-04-30T00:00:00.000' AS DateTime), 1, N'Times Now Pack', CAST(N'2023-04-24T09:37:06.117' AS DateTime), 3, CAST(N'2023-06-08T16:54:52.000' AS DateTime), 3, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 10)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (9, N'ZMCL FAMILY PACK', 998, 1.27, 0, 1, CAST(N'2023-04-24T00:00:00.000' AS DateTime), CAST(N'2030-04-30T00:00:00.000' AS DateTime), 1, N'ZMCL FAMILY PACK', CAST(N'2023-04-24T09:37:42.537' AS DateTime), 3, CAST(N'2023-04-25T23:31:12.000' AS DateTime), 3, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (10, N'Zee Audit Pack27042023', 989, 0, 0, 1, CAST(N'2023-04-27T00:00:00.000' AS DateTime), CAST(N'2023-04-30T00:00:00.000' AS DateTime), 1, N'For Zee Audit Testing', CAST(N'2023-04-27T10:25:05.393' AS DateTime), 3, CAST(N'2023-10-21T12:40:17.350' AS DateTime), NULL, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (11, N'AAJ TAK PACK', 988, 0, 0, 1, CAST(N'2023-05-29T00:00:00.000' AS DateTime), CAST(N'2033-05-29T00:00:00.000' AS DateTime), 1, N'AAJ TAK', CAST(N'2023-05-29T19:47:47.360' AS DateTime), 3, CAST(N'2023-05-29T19:57:10.000' AS DateTime), 3, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 14)
INSERT [dbo].[SMS_PACKAGE] ([Id], [PackageName], [CasCode], [Price], [Price2], [BillingCycle], [StartDate], [EndDate], [Status], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [PackageType], [CasCodeGospel], [IsPrepaid], [CasCodeTelelynx], [BranchId], [DASType], [CasCodeNSTV], [CasCodeKingvon], [CasCodeCatVision], [CasCodeBCas], [broadcaster_id]) VALUES (12, N'EPIC', 987, 5, 0, 1, CAST(N'2023-06-21T00:00:00.000' AS DateTime), CAST(N'2031-06-30T00:00:00.000' AS DateTime), 1, N'EPIC', CAST(N'2023-06-21T16:41:28.293' AS DateTime), 3, CAST(N'2023-06-21T16:48:32.000' AS DateTime), 3, 0, NULL, 0, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, 13)
SET IDENTITY_INSERT [dbo].[SMS_PACKAGE] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_PACKAGE]    Script Date: 2023-11-10 06:14:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SMS_PACKAGE] ON [dbo].[SMS_PACKAGE]
(
	[PackageName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  CONSTRAINT [DF_SMS_PACKAGE_CasCode]  DEFAULT ((0)) FOR [CasCode]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  CONSTRAINT [DF_SMS_PACKAGE_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  CONSTRAINT [DF_SMS_PACKAGE_Price2]  DEFAULT ((0)) FOR [Price2]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  CONSTRAINT [DF_SMS_PACKAGE_BillingCycle]  DEFAULT ((1)) FOR [BillingCycle]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  CONSTRAINT [DF_SMS_PACKAGE_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  CONSTRAINT [DF_SMS_PACKAGE_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  CONSTRAINT [DF_SMS_PACKAGE_PackageType]  DEFAULT ((0)) FOR [PackageType]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  CONSTRAINT [DF_SMS_PACKAGE_CasCodeGospel]  DEFAULT ((0)) FOR [CasCodeGospel]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  CONSTRAINT [DF_SMS_PACKAGE_IsPrepaid]  DEFAULT ((1)) FOR [IsPrepaid]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  CONSTRAINT [DF_SMS_PACKAGE_BranchId_1]  DEFAULT ((1)) FOR [BranchId]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  DEFAULT (NULL) FOR [CasCodeBCas]
GO
ALTER TABLE [dbo].[SMS_PACKAGE] ADD  DEFAULT ((0)) FOR [broadcaster_id]
GO
ALTER TABLE [dbo].[SMS_PACKAGE]  WITH CHECK ADD  CONSTRAINT [fk_sms_package_broadcaster] FOREIGN KEY([broadcaster_id])
REFERENCES [dbo].[SMS_BROADCASTER] ([ID])
GO
ALTER TABLE [dbo].[SMS_PACKAGE] CHECK CONSTRAINT [fk_sms_package_broadcaster]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bill Cycle Month
1-every month
2-every second month
3-quaterly
6-Half Yearly
12-Yearly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_PACKAGE', @level2type=N'COLUMN',@level2name=N'BillingCycle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-HD
2-SD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_PACKAGE', @level2type=N'COLUMN',@level2name=N'PackageType'
GO

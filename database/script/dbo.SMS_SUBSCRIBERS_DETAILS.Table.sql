USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_SUBSCRIBERS_DETAILS]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_SUBSCRIBERS_DETAILS](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[FName] [varchar](100) NOT NULL,
	[LName] [varchar](100) NOT NULL,
	[Mname] [varchar](100) NULL,
	[FlatNo] [varchar](100) NULL,
	[FloorNo] [varchar](100) NULL,
	[Wing] [varchar](100) NULL,
	[Building] [varchar](100) NULL,
	[Address] [varchar](350) NOT NULL,
	[Gender] [varchar](6) NOT NULL,
	[Verify] [varchar](6) NULL,
	[Zipcode] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[DOB] [date] NULL,
	[OCCUPATION] [varchar](350) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[photoprooftype] [varchar](50) NULL,
	[photoprooffilename] [varchar](850) NULL,
	[addressprooftype] [varchar](50) NULL,
	[addressprooffilename] [varchar](850) NULL,
	[BillingAddress] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_SUBSCRIBERS_DETAILS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ON 

INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (1, 1, N'HEADEND', N'OZONE', N'OZONE', N'', N'', N'', N'', N'OZONE', N'Male', N'No', N'400615', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2022-08-06T13:07:30.453' AS DateTime), 1, NULL, NULL, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (2, 3, N'SONY', N'TEST', N'AUDIT', N'', N'', N'', N'', N'SONY AUDIT TEST', N'Male', N'No', N'121002', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2022-10-07T16:45:48.297' AS DateTime), 1, NULL, NULL, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (3, 4, N'SUBHASH', N'CHANDRA', N'', N'', N'', N'', N'', N'PRANAYAM', N'Male', N'No', N'400615', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2022-11-04T12:19:37.287' AS DateTime), 1, CAST(N'2023-05-30T11:30:09.530' AS DateTime), 3, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (4, 5, N'OZONE', N'DEMO', N'CR', N'', N'', N'', N'', N'CONTROL ROOM', N'Male', N'No', N'400615', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2022-11-04T12:21:47.273' AS DateTime), 1, CAST(N'2023-08-22T13:33:02.737' AS DateTime), 3, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (5, 6, N'media', N'OZONE', N'', N'', N'', N'', N'', N'pranayam', N'Male', N'No', N'121002', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2023-04-26T13:30:21.140' AS DateTime), 3, NULL, NULL, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (6, 7, N'YOGESH', N'MAAN', N'', N'', N'', N'', N'', N'C-4/301. PRANAYAM', N'Male', N'No', N'121002', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2023-06-06T14:09:37.867' AS DateTime), 3, NULL, NULL, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (7, 8, N'ANSHUMAN', N'KAUSHIK', N'', N'', N'', N'', N'', N'D1/1102 PP', N'Male', N'No', N'121002', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2023-06-08T17:11:29.150' AS DateTime), 3, NULL, NULL, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (8, 9, N'vinod', N'kumar', N'', N'', N'', N'', N'', N'house No 101, Hari Nagar', N'Male', N'No', N'121002', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2023-08-21T13:50:06.820' AS DateTime), 3, CAST(N'2023-10-04T14:06:19.687' AS DateTime), 3, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (9, 10, N'OZONE', N'DEMO', N'', N'', N'', N'', N'', N'CONTROL ROOM', N'Male', N'No', N'121002', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2023-08-22T12:39:44.547' AS DateTime), 3, NULL, NULL, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (10, 11, N'SANJAY', N'SINGH', N'', N'', N'', N'', N'', N'F-104, PARK ELITE', N'Male', N'No', N'121002', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2023-08-23T14:24:41.863' AS DateTime), 3, NULL, NULL, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (11, 12, N'Jai', N'Bhagwan', N'', N'', N'', N'', N'', N'M - 303 Park Elite', N'Male', N'No', N'121002', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2023-08-23T14:28:18.553' AS DateTime), 3, CAST(N'2023-10-14T16:27:26.220' AS DateTime), 3, 0, NULL, N'0', NULL, N'0', NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id], [SubscriberId], [FName], [LName], [Mname], [FlatNo], [FloorNo], [Wing], [Building], [Address], [Gender], [Verify], [Zipcode], [Email], [Phone], [DOB], [OCCUPATION], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [photoprooftype], [photoprooffilename], [addressprooftype], [addressprooffilename], [BillingAddress]) VALUES (12, 13, N'RAJEEV', N'SACHDEVA', N'', N'', N'', N'', N'', N'C - 2 / 101, PRANAYAM', N'Male', N'No', N'121002', N'', N'', CAST(N'1900-01-01' AS Date), N'', CAST(N'2023-08-23T14:30:02.090' AS DateTime), 3, NULL, NULL, 0, NULL, N'0', NULL, N'0', NULL, NULL)
SET IDENTITY_INSERT [dbo].[SMS_SUBSCRIBERS_DETAILS] OFF
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERS_DETAILS_11_648545544__K2_K1_3_4_5_6_7_8_9_10_11_12_13_14_15_16_17_24_25_26_27]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERS_DETAILS_11_648545544__K2_K1_3_4_5_6_7_8_9_10_11_12_13_14_15_16_17_24_25_26_27] ON [dbo].[SMS_SUBSCRIBERS_DETAILS]
(
	[SubscriberId] ASC,
	[Id] ASC
)
INCLUDE([FName],[LName],[Mname],[FlatNo],[FloorNo],[Wing],[Building],[Address],[Gender],[Verify],[Zipcode],[Email],[Phone],[DOB],[OCCUPATION],[photoprooftype],[photoprooffilename],[addressprooftype],[addressprooffilename]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERS_DETAILS_5_648545544__K2_K1_3_4_5]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERS_DETAILS_5_648545544__K2_K1_3_4_5] ON [dbo].[SMS_SUBSCRIBERS_DETAILS]
(
	[SubscriberId] ASC,
	[Id] ASC
)
INCLUDE([FName],[LName],[Mname]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERS_DETAILS_5_648545544__K2_K1_3_4_5_10_13_15]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERS_DETAILS_5_648545544__K2_K1_3_4_5_10_13_15] ON [dbo].[SMS_SUBSCRIBERS_DETAILS]
(
	[SubscriberId] ASC,
	[Id] ASC
)
INCLUDE([FName],[LName],[Mname],[Address],[Zipcode],[Phone]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SMS_SUBSCRIBERS_DETAILS]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [IX_SMS_SUBSCRIBERS_DETAILS] ON [dbo].[SMS_SUBSCRIBERS_DETAILS]
(
	[SubscriberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_DETAILS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERS_DETAILS_FSubmit]  DEFAULT ('No') FOR [Verify]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_DETAILS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERS_DETAILS_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_DETAILS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERS_DETAILS_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_DETAILS]  WITH NOCHECK ADD  CONSTRAINT [FK_SMS_SUBSCRIBERS_DETAILS_SMS_SUBSCRIBERS] FOREIGN KEY([SubscriberId])
REFERENCES [dbo].[SMS_SUBSCRIBERS] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_DETAILS] CHECK CONSTRAINT [FK_SMS_SUBSCRIBERS_DETAILS_SMS_SUBSCRIBERS]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_SMS_SUBSCRIBERS_DETAILS_SMS_SUBSCRIBERS_DETAILS] FOREIGN KEY([Id])
REFERENCES [dbo].[SMS_SUBSCRIBERS_DETAILS] ([Id])
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_DETAILS] CHECK CONSTRAINT [FK_SMS_SUBSCRIBERS_DETAILS_SMS_SUBSCRIBERS_DETAILS]
GO

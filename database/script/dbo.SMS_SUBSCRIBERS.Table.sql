USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_SUBSCRIBERS]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_SUBSCRIBERS](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FormNo] [varchar](50) NOT NULL,
	[CustomerId] [varchar](20) NOT NULL,
	[OperatorId] [bigint] NOT NULL,
	[SocietyId] [bigint] NOT NULL,
	[MobileNo] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
	[ProspectId] [bigint] NULL,
	[PCustomerId] [varchar](20) NULL,
	[OpTobeBilled] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sms_id] [bigint] NULL,
 CONSTRAINT [PK_SMS_SUBSCRIBERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_SUBSCRIBERS] ON 

INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (1, N'FRM00000001', N'OZN0000001', 1, 1, N'9988776665', 1, NULL, NULL, 1, CAST(N'2022-08-06T13:06:30.433' AS DateTime), 1, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (3, N'FRM00000002', N'OZN0000002', 1, 1, N'9811998733', 1, NULL, NULL, 1, CAST(N'2022-10-07T16:45:48.273' AS DateTime), 1, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (4, N'FRM00000003', N'OZN0000003', 1, 1, N'9865755588', 1, NULL, NULL, 1, CAST(N'2022-11-04T12:19:37.283' AS DateTime), 1, CAST(N'2023-05-30T11:30:09.460' AS DateTime), 3, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (5, N'FRM00000004', N'OZN0000004', 1, 1, N'9811998733', 1, NULL, NULL, 1, CAST(N'2022-11-04T12:21:47.270' AS DateTime), 1, CAST(N'2023-08-22T13:33:02.723' AS DateTime), 3, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (6, N'FRM00000005', N'OZN0000005', 1, 1, N'9811998733', 1, NULL, NULL, 1, CAST(N'2023-04-26T13:30:21.120' AS DateTime), 3, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (7, N'FRM00000006', N'OZN0000006', 2, 2, N'9911944100', 1, NULL, NULL, 1, CAST(N'2023-06-06T14:09:37.867' AS DateTime), 3, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (8, N'FRM00000007', N'OZN0000007', 2, 2, N'9899695957', 1, NULL, NULL, 1, CAST(N'2023-06-08T17:11:29.150' AS DateTime), 3, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (9, N'FRM00000008', N'OZN0000008', 2, 3, N'9718741499', 1, NULL, NULL, 1, CAST(N'2023-08-21T13:50:06.817' AS DateTime), 3, CAST(N'2023-10-04T14:06:19.620' AS DateTime), 3, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (10, N'FRM00000009', N'OZN0000009', 2, 2, N'9811998733', 1, NULL, NULL, 1, CAST(N'2023-08-22T12:39:44.543' AS DateTime), 3, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (11, N'FRM00000010', N'OZN0000010', 2, 3, N'9990086177', 1, NULL, NULL, 1, CAST(N'2023-08-23T14:24:41.860' AS DateTime), 3, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (12, N'FRM00000011', N'OZN0000011', 2, 3, N'9999895006', 1, NULL, NULL, 1, CAST(N'2023-08-23T14:28:18.550' AS DateTime), 3, CAST(N'2023-10-14T16:27:26.207' AS DateTime), 3, 0, NULL, NULL)
INSERT [dbo].[SMS_SUBSCRIBERS] ([Id], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (13, N'FRM00000012', N'OZN0000012', 2, 2, N'9811096310', 1, NULL, NULL, 1, CAST(N'2023-08-23T14:30:02.087' AS DateTime), 3, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SMS_SUBSCRIBERS] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_SUBSCRIBERS]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_SUBSCRIBERS] ADD  CONSTRAINT [IX_SMS_SUBSCRIBERS] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERS_5_1920113981__K1_4_5]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERS_5_1920113981__K1_4_5] ON [dbo].[SMS_SUBSCRIBERS]
(
	[Id] ASC
)
INCLUDE([OperatorId],[SocietyId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERS_5_1920113981__K1_K4_K5_3]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERS_5_1920113981__K1_K4_K5_3] ON [dbo].[SMS_SUBSCRIBERS]
(
	[Id] ASC,
	[OperatorId] ASC,
	[SocietyId] ASC
)
INCLUDE([CustomerId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERS_5_1920113981__K4_1_5]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERS_5_1920113981__K4_1_5] ON [dbo].[SMS_SUBSCRIBERS]
(
	[OperatorId] ASC
)
INCLUDE([Id],[SocietyId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERS_5_1920113981__K4_K1_K12_K5_2_3_6_11]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERS_5_1920113981__K4_K1_K12_K5_2_3_6_11] ON [dbo].[SMS_SUBSCRIBERS]
(
	[OperatorId] ASC,
	[Id] ASC,
	[CreatedBy] ASC,
	[SocietyId] ASC
)
INCLUDE([FormNo],[CustomerId],[MobileNo],[CreatedOn]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERS_5_1920113981__K4_K1_K3]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERS_5_1920113981__K4_K1_K3] ON [dbo].[SMS_SUBSCRIBERS]
(
	[OperatorId] ASC,
	[Id] ASC,
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SMS_SUBSCRIBERS_3]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [IX_SMS_SUBSCRIBERS_3] ON [dbo].[SMS_SUBSCRIBERS]
(
	[OperatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERS_SocietyId]  DEFAULT ((0)) FOR [SocietyId]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERS_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS] ADD  CONSTRAINT [DF__SMS_SUBSC__TobeB__45B5055F]  DEFAULT ((1)) FOR [OpTobeBilled]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERS_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS]  WITH CHECK ADD  CONSTRAINT [FK_SMS_SUBSCRIBERS_SMS_OPERATOR] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[SMS_OPERATOR] ([ID])
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS] CHECK CONSTRAINT [FK_SMS_SUBSCRIBERS_SMS_OPERATOR]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS]  WITH CHECK ADD  CONSTRAINT [FK_SMS_SUBSCRIBERS_SMS_SOCIETY_MASTER] FOREIGN KEY([SocietyId])
REFERENCES [dbo].[SMS_SOCIETY_MASTER] ([Id])
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS] CHECK CONSTRAINT [FK_SMS_SUBSCRIBERS_SMS_SOCIETY_MASTER]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS]  WITH CHECK ADD  CONSTRAINT [FK_SMS_SUBSCRIBERS_SMS_SUBSCRIBERS] FOREIGN KEY([Id])
REFERENCES [dbo].[SMS_SUBSCRIBERS] ([Id])
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS] CHECK CONSTRAINT [FK_SMS_SUBSCRIBERS_SMS_SUBSCRIBERS]
GO

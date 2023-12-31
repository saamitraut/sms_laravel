USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_SUBSCRIBERACCOUNTS]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[ConnectionId] [bigint] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[ApplicableRate] [bit] NOT NULL,
	[TimeShift] [bit] NOT NULL,
	[PairingId] [bigint] NOT NULL,
	[BillingSMonth] [date] NOT NULL,
	[ActivationDate] [date] NOT NULL,
	[DeactivationDate] [date] NULL,
	[ExpiryDate] [date] NOT NULL,
	[Description] [varchar](250) NULL,
	[ActionTaken] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sms_id] [bigint] NULL,
	[isblacklisted] [bit] NULL,
	[blacklistfilename] [varchar](150) NULL,
	[PrePaidFlag] [bit] NOT NULL,
	[Acct_Type] [bit] NOT NULL,
 CONSTRAINT [PK_SMS_SUBSCRIBERACCOUNTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ON 

INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (4, 1, 1, 0, 1, 0, 2, CAST(N'1900-01-01' AS Date), CAST(N'2022-08-17' AS Date), CAST(N'2022-10-12' AS Date), CAST(N'1900-01-01' AS Date), N'', 2, 1, CAST(N'2022-08-17T17:48:55.090' AS DateTime), 1, CAST(N'2023-08-22T12:37:54.977' AS DateTime), 3, 0, N'Switched From Primary', NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (18, 1, 1, 1, 1, 0, 97, CAST(N'1900-01-01' AS Date), CAST(N'2022-09-21' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2022-09-21T10:11:12.777' AS DateTime), 3, CAST(N'2023-08-22T12:37:54.973' AS DateTime), 3, 0, N'Switched To Primary', NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (22, 3, 1, 1, 1, 0, 99, CAST(N'1900-01-01' AS Date), CAST(N'2022-10-07' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2022-10-07T16:48:38.360' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (24, 1, 1, 0, 1, 0, 95, CAST(N'1900-01-01' AS Date), CAST(N'2022-10-12' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2022-10-12T13:39:37.967' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (27, 4, 1, 1, 1, 0, 96, CAST(N'1900-01-01' AS Date), CAST(N'2022-11-04' AS Date), CAST(N'2023-04-27' AS Date), CAST(N'1900-01-01' AS Date), N'', 2, 1, CAST(N'2022-11-04T12:58:38.297' AS DateTime), 1, CAST(N'2023-04-27T11:11:11.283' AS DateTime), 3, 0, N'terst', NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (28, 5, 1, 1, 1, 0, 98, CAST(N'1900-01-01' AS Date), CAST(N'2022-11-04' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2022-11-04T13:06:47.897' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (31, 6, 1, 1, 1, 0, 30, CAST(N'1900-01-01' AS Date), CAST(N'2023-04-26' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2023-04-26T14:06:38.760' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (32, 6, 1, 0, 1, 0, 78, CAST(N'1900-01-01' AS Date), CAST(N'2023-04-26' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2023-04-26T16:07:59.590' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (33, 6, 1, 0, 1, 0, 24, CAST(N'1900-01-01' AS Date), CAST(N'2023-04-26' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2023-04-26T16:13:48.520' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (34, 6, 1, 0, 1, 0, 15, CAST(N'1900-01-01' AS Date), CAST(N'2023-04-26' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2023-04-26T16:15:05.610' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (35, 7, 1, 1, 1, 0, 59, CAST(N'1900-01-01' AS Date), CAST(N'2023-06-06' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2023-06-06T14:57:40.427' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (36, 8, 1, 1, 1, 0, 31, CAST(N'1900-01-01' AS Date), CAST(N'2023-06-08' AS Date), CAST(N'2023-06-08' AS Date), CAST(N'1900-01-01' AS Date), N'', 3, 0, CAST(N'2023-06-08T17:30:30.190' AS DateTime), 3, CAST(N'2023-06-08T17:47:52.203' AS DateTime), 3, 0, N'CARD NOT WORKING', NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (37, 8, 1, 0, 1, 0, 53, CAST(N'1900-01-01' AS Date), CAST(N'2023-06-08' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2023-06-08T17:47:08.773' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (38, 9, 1, 1, 1, 0, 32, CAST(N'1900-01-01' AS Date), CAST(N'2023-08-21' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2023-08-21T14:20:35.210' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (39, 11, 1, 1, 1, 0, 94, CAST(N'1900-01-01' AS Date), CAST(N'2023-08-23' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2023-08-23T14:51:27.373' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (40, 13, 1, 1, 1, 0, 52, CAST(N'1900-01-01' AS Date), CAST(N'2023-08-23' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2023-08-23T16:00:31.220' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] ([Id], [SubscriberId], [ConnectionId], [IsPrimary], [ApplicableRate], [TimeShift], [PairingId], [BillingSMonth], [ActivationDate], [DeactivationDate], [ExpiryDate], [Description], [ActionTaken], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [isblacklisted], [blacklistfilename], [PrePaidFlag], [Acct_Type]) VALUES (41, 12, 1, 1, 1, 0, 38, CAST(N'1900-01-01' AS Date), CAST(N'2023-10-14' AS Date), NULL, CAST(N'1900-01-01' AS Date), N'', 1, 1, CAST(N'2023-10-14T16:30:20.417' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[SMS_SUBSCRIBERACCOUNTS] OFF
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERACCOUNTS_5_298536197__K1_2_7]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERACCOUNTS_5_298536197__K1_2_7] ON [dbo].[SMS_SUBSCRIBERACCOUNTS]
(
	[Id] ASC
)
INCLUDE([SubscriberId],[PairingId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERACCOUNTS_5_298536197__K1_K2]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERACCOUNTS_5_298536197__K1_K2] ON [dbo].[SMS_SUBSCRIBERACCOUNTS]
(
	[Id] ASC,
	[SubscriberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERACCOUNTS_5_298536197__K14_K2_K1_K7]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERACCOUNTS_5_298536197__K14_K2_K1_K7] ON [dbo].[SMS_SUBSCRIBERACCOUNTS]
(
	[Status] ASC,
	[SubscriberId] ASC,
	[Id] ASC,
	[PairingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERACCOUNTS_5_298536197__K2_3_7_14]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERACCOUNTS_5_298536197__K2_3_7_14] ON [dbo].[SMS_SUBSCRIBERACCOUNTS]
(
	[SubscriberId] ASC
)
INCLUDE([ConnectionId],[PairingId],[Status]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERACCOUNTS_5_298536197__K2_K1_K3_K16_K7_4_9_10_14_15_17_18_22]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERACCOUNTS_5_298536197__K2_K1_K3_K16_K7_4_9_10_14_15_17_18_22] ON [dbo].[SMS_SUBSCRIBERACCOUNTS]
(
	[SubscriberId] ASC,
	[Id] ASC,
	[ConnectionId] ASC,
	[CreatedBy] ASC,
	[PairingId] ASC
)
INCLUDE([IsPrimary],[ActivationDate],[DeactivationDate],[Status],[CreatedOn],[UpdatedOn],[UpdatedBy],[isblacklisted]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [_dta_index_SMS_SUBSCRIBERACCOUNTS_7_298536197__K1_K7_K6_K2_K3_K5_K8_K9_K10_K4_K12_K13_K14_K15_K16_K17_18_19]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_SUBSCRIBERACCOUNTS_7_298536197__K1_K7_K6_K2_K3_K5_K8_K9_K10_K4_K12_K13_K14_K15_K16_K17_18_19] ON [dbo].[SMS_SUBSCRIBERACCOUNTS]
(
	[Id] ASC,
	[PairingId] ASC,
	[TimeShift] ASC,
	[SubscriberId] ASC,
	[ConnectionId] ASC,
	[ApplicableRate] ASC,
	[BillingSMonth] ASC,
	[ActivationDate] ASC,
	[DeactivationDate] ASC,
	[IsPrimary] ASC,
	[Description] ASC,
	[ActionTaken] ASC,
	[Status] ASC,
	[CreatedOn] ASC,
	[CreatedBy] ASC,
	[UpdatedOn] ASC
)
INCLUDE([UpdatedBy],[Deleted]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SMS_SUBSCRIBERACCOUNTS]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [IX_SMS_SUBSCRIBERACCOUNTS] ON [dbo].[SMS_SUBSCRIBERACCOUNTS]
(
	[PairingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERACCOUNTS_ConnectionId]  DEFAULT ((0)) FOR [ConnectionId]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERACCOUNTS_IsPrimary]  DEFAULT ((0)) FOR [IsPrimary]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERACCOUNTS_ApplicableRate]  DEFAULT ((1)) FOR [ApplicableRate]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERACCOUNTS_TimeShift]  DEFAULT ((0)) FOR [TimeShift]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERACCOUNTS_BillingSMonth]  DEFAULT (getdate()) FOR [BillingSMonth]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERACCOUNTS_ActionTaken]  DEFAULT ((1)) FOR [ActionTaken]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERACCOUNTS_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERACCOUNTS_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  CONSTRAINT [DF_SMS_SUBSCRIBERACCOUNTS_isblacklisted]  DEFAULT ((0)) FOR [isblacklisted]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  DEFAULT ((0)) FOR [PrePaidFlag]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERACCOUNTS] ADD  DEFAULT ((0)) FOR [Acct_Type]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Firtst Rate
0- Second Rate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_SUBSCRIBERACCOUNTS', @level2type=N'COLUMN',@level2name=N'ApplicableRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Connected
2-Activated
3-Deactivated
4-Disconnected
5-Blacklisted_SC
6-Blacklisted_All
7-Blacklisted_Subscriber
8-Connection SchemeModified
9-TimeShift Modified
10-Scheme Rate Shuffled
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_SUBSCRIBERACCOUNTS', @level2type=N'COLUMN',@level2name=N'ActionTaken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=>blacklisted 0=>not blacklisted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_SUBSCRIBERACCOUNTS', @level2type=N'COLUMN',@level2name=N'isblacklisted'
GO

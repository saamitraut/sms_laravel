USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_ACCESS]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_ACCESS](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
 CONSTRAINT [PK_SMSTACCESS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_ACCESS] ON 

INSERT [dbo].[SMS_ACCESS] ([ID], [NAME], [LOGINID], [PASSWORD], [USERTYPE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [OperatorID], [Remark], [deleted], [sms_id]) VALUES (1, N'Admin', N'Admin', N'e10adc3949ba59abbe56e057f20f883e', N'SAdmin', 1, CAST(N'2011-06-23T12:56:13.543' AS DateTime), CAST(N'2016-06-14T15:44:12.483' AS DateTime), 1, 1, NULL, NULL, 0, NULL)
INSERT [dbo].[SMS_ACCESS] ([ID], [NAME], [LOGINID], [PASSWORD], [USERTYPE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [OperatorID], [Remark], [deleted], [sms_id]) VALUES (2, N'OZONE HEADEND', N'OZONE', N'e10adc3949ba59abbe56e057f20f883e', N'Operator', 1, CAST(N'2022-08-06T13:03:32.620' AS DateTime), CAST(N'2023-08-22T12:24:47.927' AS DateTime), 1, 3, 1, NULL, 0, NULL)
INSERT [dbo].[SMS_ACCESS] ([ID], [NAME], [LOGINID], [PASSWORD], [USERTYPE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [OperatorID], [Remark], [deleted], [sms_id]) VALUES (3, N'ozoneadmin', N'ozoneadmin', N'c4ca4238a0b923820dcc509a6f75849b', N'Admin', 1, CAST(N'2022-09-09T14:08:14.550' AS DateTime), CAST(N'2023-04-17T19:50:57.880' AS DateTime), 1, 3, NULL, NULL, 0, NULL)
INSERT [dbo].[SMS_ACCESS] ([ID], [NAME], [LOGINID], [PASSWORD], [USERTYPE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [OperatorID], [Remark], [deleted], [sms_id]) VALUES (4, N'OZONE MEDIA DP', N'OZONE DP', N'11b9842e0a271ff252c1903e7132cd68', N'Operator', 1, CAST(N'2023-06-06T13:47:45.973' AS DateTime), NULL, 3, NULL, 2, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[SMS_ACCESS] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_ACCESS_1]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_ACCESS] ADD  CONSTRAINT [IX_SMS_ACCESS_1] UNIQUE NONCLUSTERED 
(
	[NAME] ASC,
	[OperatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_ACCESS_11_1877581727__K11]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_ACCESS_11_1877581727__K11] ON [dbo].[SMS_ACCESS]
(
	[OperatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_ACCESS_5_1877581727__K11]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_ACCESS_5_1877581727__K11] ON [dbo].[SMS_ACCESS]
(
	[OperatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SMS_ACCESS_7_1877581727__K1_2]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_SMS_ACCESS_7_1877581727__K1_2] ON [dbo].[SMS_ACCESS]
(
	[ID] ASC
)
INCLUDE([NAME]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_ACCESS]    Script Date: 2023-11-10 06:14:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SMS_ACCESS] ON [dbo].[SMS_ACCESS]
(
	[LOGINID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_ACCESS] ADD  CONSTRAINT [DF_SMS_ACCESS_STATUS]  DEFAULT ((1)) FOR [STATUS]
GO
ALTER TABLE [dbo].[SMS_ACCESS] ADD  DEFAULT ((0)) FOR [deleted]
GO

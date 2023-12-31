USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CASMSG]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CASMSG](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[mType] [int] NOT NULL,
	[cmdName] [varchar](50) NOT NULL,
	[UA_TYPE] [int] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
 CONSTRAINT [PK_SMSTABVMSG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_CASMSG] ON 

INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (1, 3, N'FINGERPRINT', 2, CAST(N'2022-10-06T15:13:08.680' AS DateTime), 3)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (2, 3, N'FINGERPRINT', 2, CAST(N'2022-10-06T15:29:24.490' AS DateTime), 3)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (3, 1, N'FLASHMESSAGE', 2, CAST(N'2022-10-06T15:38:21.040' AS DateTime), 3)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (4, 1, N'FLASHMESSAGE', 2, CAST(N'2022-10-06T15:42:22.857' AS DateTime), 3)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (5, 3, N'FINGERPRINT', 2, CAST(N'2022-10-06T15:47:52.330' AS DateTime), 3)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (6, 3, N'FINGERPRINT', 0, CAST(N'2022-10-07T17:25:55.727' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (7, 3, N'FINGERPRINT', 2, CAST(N'2022-10-07T17:26:49.423' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (8, 3, N'FINGERPRINT', 2, CAST(N'2022-10-07T17:32:54.033' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (9, 3, N'FINGERPRINT', 2, CAST(N'2022-10-07T17:37:19.710' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (10, 3, N'FINGERPRINT', 2, CAST(N'2022-10-07T17:39:18.333' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (11, 3, N'FINGERPRINT', 2, CAST(N'2022-10-07T17:45:23.213' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (12, 1, N'FLASHMESSAGE', 0, CAST(N'2022-10-07T17:49:27.010' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (13, 3, N'FINGERPRINT', 2, CAST(N'2022-10-07T17:54:05.217' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (14, 1, N'FLASHMESSAGE', 0, CAST(N'2022-10-07T17:54:13.250' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (15, 3, N'FINGERPRINT', 2, CAST(N'2022-10-07T17:59:34.233' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (16, 3, N'FINGERPRINT', 2, CAST(N'2022-10-07T18:07:29.287' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (17, 3, N'FINGERPRINT', 2, CAST(N'2022-10-07T18:13:09.780' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (18, 0, N'MAILMESSAGE', 2, CAST(N'2022-10-10T11:14:01.437' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (19, 3, N'FINGERPRINT', 0, CAST(N'2022-10-10T11:26:00.317' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (20, 3, N'FINGERPRINT', 0, CAST(N'2022-11-04T13:14:27.900' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (21, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T13:26:27.757' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (22, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T13:34:45.067' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (23, 1, N'FLASHMESSAGE', 2, CAST(N'2022-11-04T13:51:20.727' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (24, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T14:26:01.047' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (25, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T14:31:34.517' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (26, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T14:39:39.740' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (27, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T14:50:09.917' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (28, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T14:54:34.830' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (29, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T15:10:15.310' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (30, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T15:19:01.390' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (31, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T15:23:13.123' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (32, 1, N'FLASHMESSAGE', 2, CAST(N'2022-11-04T15:33:10.777' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (33, 1, N'FLASHMESSAGE', 2, CAST(N'2022-11-04T15:37:09.490' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (34, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T15:46:04.080' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (35, 1, N'FLASHMESSAGE', 2, CAST(N'2022-11-04T15:46:51.310' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (36, 1, N'FLASHMESSAGE', 2, CAST(N'2022-11-04T15:47:41.500' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (37, 1, N'FLASHMESSAGE', 2, CAST(N'2022-11-04T16:00:17.477' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (38, 1, N'FLASHMESSAGE', 2, CAST(N'2022-11-04T16:03:07.607' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (39, 1, N'FLASHMESSAGE', 2, CAST(N'2022-11-04T16:04:53.820' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (40, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T16:09:06.577' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (41, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T16:19:33.930' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (42, 3, N'FINGERPRINT', 2, CAST(N'2022-11-04T16:25:16.850' AS DateTime), 1)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (43, 3, N'FINGERPRINT', 2, CAST(N'2023-04-27T11:14:35.917' AS DateTime), 3)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (44, 1, N'FLASHMESSAGE', 2, CAST(N'2023-04-27T11:17:58.747' AS DateTime), 3)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (45, 3, N'FINGERPRINT', 2, CAST(N'2023-04-27T11:20:52.550' AS DateTime), 3)
INSERT [dbo].[SMS_CASMSG] ([Id], [mType], [cmdName], [UA_TYPE], [InsertedOn], [InsertedBy]) VALUES (46, 3, N'FINGERPRINT', 2, CAST(N'2023-04-27T11:25:44.577' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[SMS_CASMSG] OFF
GO
ALTER TABLE [dbo].[SMS_CASMSG] ADD  CONSTRAINT [DF_SMS_CASMSG_UA_TYPE]  DEFAULT ((0)) FOR [UA_TYPE]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - Global
1 - Area
2 - SmartCard' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_CASMSG', @level2type=N'COLUMN',@level2name=N'UA_TYPE'
GO

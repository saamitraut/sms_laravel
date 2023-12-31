USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CASMESSAGE_TO]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CASMESSAGE_TO](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Area_CardId] [bigint] NOT NULL,
	[CASmsgId] [bigint] NOT NULL,
 CONSTRAINT [PK_SMS_CasMessage_TO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_CASMESSAGE_TO] ON 

INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (1, 96, 1)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (2, 96, 2)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (3, 96, 3)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (4, 96, 4)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (5, 96, 5)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (6, 0, 6)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (7, 96, 7)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (8, 99, 7)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (9, 96, 8)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (10, 99, 8)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (11, 96, 9)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (12, 99, 10)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (13, 99, 11)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (14, 0, 12)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (15, 96, 13)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (16, 99, 13)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (17, 0, 14)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (18, 96, 15)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (19, 99, 15)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (20, 96, 16)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (21, 96, 17)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (22, 96, 18)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (23, 0, 19)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (24, 0, 20)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (25, 96, 21)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (26, 96, 22)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (27, 96, 23)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (28, 96, 24)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (29, 96, 25)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (30, 96, 26)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (31, 96, 27)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (32, 96, 28)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (33, 96, 29)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (34, 96, 30)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (35, 96, 31)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (36, 96, 32)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (37, 96, 33)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (38, 96, 34)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (39, 96, 35)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (40, 96, 36)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (41, 96, 37)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (42, 96, 38)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (43, 96, 39)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (44, 96, 40)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (45, 98, 41)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (46, 98, 42)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (47, 96, 43)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (48, 96, 44)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (49, 96, 45)
INSERT [dbo].[SMS_CASMESSAGE_TO] ([Id], [Area_CardId], [CASmsgId]) VALUES (50, 96, 46)
SET IDENTITY_INSERT [dbo].[SMS_CASMESSAGE_TO] OFF
GO

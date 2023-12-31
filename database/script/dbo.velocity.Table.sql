USE [MNSMS]
GO
/****** Object:  Table [dbo].[velocity]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[velocity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[VideoId] [varchar](50) NOT NULL,
	[VideoName] [varchar](250) NOT NULL,
	[Price] [float] NOT NULL,
	[ProductId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[TokenId] [varchar](150) NOT NULL,
 CONSTRAINT [PK_velocity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[velocity] ON 

INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (1, 11178, 11147, N'1002', N'SnitchHD.ts', 200, 687, CAST(N'2014-09-20T05:40:00.000' AS DateTime), CAST(N'2014-09-20T05:45:00.000' AS DateTime), 1, N'1411214827734')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (2, 11178, 11147, N'1002', N'SnitchHD.ts', 200, 687, CAST(N'2014-09-20T05:40:00.000' AS DateTime), CAST(N'2014-09-20T05:45:00.000' AS DateTime), 1, N'1411220785023')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (3, 11178, 11147, N'1002', N'SnitchHD.ts', 200, 942, CAST(N'2014-09-20T07:25:00.000' AS DateTime), CAST(N'2014-09-20T07:30:00.000' AS DateTime), 1, N'1411220866293')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (4, 11178, 11147, N'1002', N'SnitchHD.ts', 200, 942, CAST(N'2014-09-20T19:25:00.000' AS DateTime), CAST(N'2014-09-20T19:30:00.000' AS DateTime), 1, N'1411221041916')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (5, 11178, 11147, N'1002', N'SnitchHD.ts', 200, 942, CAST(N'2014-09-20T19:30:00.000' AS DateTime), CAST(N'2014-09-20T19:35:00.000' AS DateTime), 1, N'1411221370215')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (6, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-20T19:32:00.000' AS DateTime), CAST(N'2014-09-20T19:35:00.000' AS DateTime), 1, N'1411221502432')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (7, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-20T19:37:00.000' AS DateTime), CAST(N'2014-09-20T20:00:00.000' AS DateTime), 1, N'1411221735816')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (8, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-20T19:47:00.000' AS DateTime), CAST(N'2014-09-20T20:00:00.000' AS DateTime), 1, N'1411222413309')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (9, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-20T19:48:00.000' AS DateTime), CAST(N'2014-09-20T20:00:00.000' AS DateTime), 1, N'1411222447132')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (10, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-20T20:25:00.000' AS DateTime), CAST(N'2014-09-20T20:27:00.000' AS DateTime), 1, N'1411224694122')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (11, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-20T20:34:00.000' AS DateTime), CAST(N'2014-09-20T20:37:00.000' AS DateTime), 1, N'1411225169241')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (12, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T11:50:00.000' AS DateTime), CAST(N'2014-09-26T11:55:00.000' AS DateTime), 1, N'1411714166115')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (13, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T11:50:00.000' AS DateTime), CAST(N'2014-09-26T11:55:00.000' AS DateTime), 1, N'1411714267100')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (14, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T11:50:00.000' AS DateTime), CAST(N'2014-09-26T11:55:00.000' AS DateTime), 1, N'1411714778044')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (15, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T11:50:00.000' AS DateTime), CAST(N'2014-09-26T11:55:00.000' AS DateTime), 1, N'1411714914979')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (16, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T11:50:00.000' AS DateTime), CAST(N'2014-09-26T11:55:00.000' AS DateTime), 1, N'1411715413263')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (17, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T16:56:00.000' AS DateTime), CAST(N'2014-09-26T17:00:00.000' AS DateTime), 1, N'1411730468240')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (18, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T16:56:00.000' AS DateTime), CAST(N'2014-09-26T17:00:00.000' AS DateTime), 1, N'1411730509857')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (19, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T16:56:00.000' AS DateTime), CAST(N'2014-09-26T17:00:00.000' AS DateTime), 1, N'1411730759068')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (20, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T17:05:00.000' AS DateTime), CAST(N'2014-09-26T17:08:00.000' AS DateTime), 1, N'1411731077971')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (21, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T17:07:00.000' AS DateTime), CAST(N'2014-09-26T17:10:00.000' AS DateTime), 1, N'1411731147735')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (22, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T17:31:00.000' AS DateTime), CAST(N'2014-09-26T17:41:00.000' AS DateTime), 1, N'1411732605538')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (23, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T17:36:00.000' AS DateTime), CAST(N'2014-09-26T17:46:00.000' AS DateTime), 1, N'1411732935523')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (24, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 942, CAST(N'2014-09-26T18:59:00.000' AS DateTime), CAST(N'2014-09-26T18:05:00.000' AS DateTime), 1, N'1411737902355')
INSERT [dbo].[velocity] ([Id], [SubscriberId], [AccountId], [VideoId], [VideoName], [Price], [ProductId], [StartDate], [EndDate], [Status], [TokenId]) VALUES (25, 11178, 11147, N'1002', N'TVNX_00259447_0144892_2.ts', 200, 936, CAST(N'2014-09-26T19:01:00.000' AS DateTime), CAST(N'2014-09-26T19:05:00.000' AS DateTime), 1, N'1411738014595')
SET IDENTITY_INSERT [dbo].[velocity] OFF
GO
ALTER TABLE [dbo].[velocity] ADD  CONSTRAINT [DF_velocity_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[velocity] ADD  CONSTRAINT [DF_velocity_AccountId]  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[velocity] ADD  CONSTRAINT [DF_velocity_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[velocity] ADD  CONSTRAINT [DF_velocity_Status]  DEFAULT ((0)) FOR [Status]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=>Pending 1=>Channel Activated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'velocity', @level2type=N'COLUMN',@level2name=N'Status'
GO

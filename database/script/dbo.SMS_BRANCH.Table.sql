USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_BRANCH]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_BRANCH](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Address] [varchar](550) NOT NULL,
	[Phone] [varchar](50) NULL,
	[BranchIncharge] [varchar](150) NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[FaxNo] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_BRANCH] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_BRANCH] ON 

INSERT [dbo].[SMS_BRANCH] ([Id], [Name], [Address], [Phone], [BranchIncharge], [MobileNo], [FaxNo], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark]) VALUES (1, N'OZONE DP', N'OZONE DP', N'', N'OZONE', N'9811998733', N'', 1, CAST(N'2022-08-06T13:02:31.150' AS DateTime), 1, CAST(N'2023-08-21T14:02:36.220' AS DateTime), 3, 0, NULL)
INSERT [dbo].[SMS_BRANCH] ([Id], [Name], [Address], [Phone], [BranchIncharge], [MobileNo], [FaxNo], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark]) VALUES (2, N'OZONE FARIDABAD', N'PRANAYAM', N'', N'OZONE', N'9811998733', N'', 1, CAST(N'2023-06-06T13:52:13.933' AS DateTime), 3, CAST(N'2023-06-21T16:46:25.030' AS DateTime), 3, 0, NULL)
SET IDENTITY_INSERT [dbo].[SMS_BRANCH] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_BRANCH]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_BRANCH] ADD  CONSTRAINT [IX_SMS_BRANCH] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_BRANCH] ADD  CONSTRAINT [DF_SMS_BRANCH_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_BRANCH] ADD  CONSTRAINT [DF_SMS_BRANCH_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

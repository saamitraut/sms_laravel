USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_BRANCH_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_BRANCH_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
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
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SMS_BRANCH_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_BRANCH_HISTORY] ON 

INSERT [dbo].[SMS_BRANCH_HISTORY] ([Id], [FID], [Name], [Address], [Phone], [BranchIncharge], [MobileNo], [FaxNo], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'OZONE', N'OZONE', N'', N'OZONE', N'9988776665', N'', 1, CAST(N'2022-08-06T13:02:31.150' AS DateTime), 1, NULL, NULL, 0, NULL, CAST(N'2022-08-06T13:02:31.157' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BRANCH_HISTORY] ([Id], [FID], [Name], [Address], [Phone], [BranchIncharge], [MobileNo], [FaxNo], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 2, N'OZONE FARIDABAD', N'PRANAYAM', N'', N'OZONE', N'9811998733', N'', 1, CAST(N'2023-06-06T13:52:13.933' AS DateTime), 3, NULL, NULL, 0, NULL, CAST(N'2023-06-06T13:52:13.940' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_BRANCH_HISTORY] ([Id], [FID], [Name], [Address], [Phone], [BranchIncharge], [MobileNo], [FaxNo], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (3, 1, N'OZONE', N'OZONE DP', N'', N'OZONE', N'9811998733', N'', 1, CAST(N'2022-08-06T13:02:31.150' AS DateTime), 1, CAST(N'2023-08-21T14:02:17.593' AS DateTime), 3, 0, NULL, CAST(N'2023-08-21T14:02:17.593' AS DateTime), 3, 1, 2, N'Address,MobileNo,')
INSERT [dbo].[SMS_BRANCH_HISTORY] ([Id], [FID], [Name], [Address], [Phone], [BranchIncharge], [MobileNo], [FaxNo], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (4, 1, N'OZONE DP', N'OZONE DP', N'', N'OZONE', N'9811998733', N'', 1, CAST(N'2022-08-06T13:02:31.150' AS DateTime), 1, CAST(N'2023-08-21T14:02:30.867' AS DateTime), 3, 0, NULL, CAST(N'2023-08-21T14:02:30.867' AS DateTime), 3, 3, 2, N'Name,')
SET IDENTITY_INSERT [dbo].[SMS_BRANCH_HISTORY] OFF
GO
ALTER TABLE [dbo].[SMS_BRANCH_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_BRANCH_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

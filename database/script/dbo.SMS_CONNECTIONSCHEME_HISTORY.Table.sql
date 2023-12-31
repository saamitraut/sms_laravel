USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CONNECTIONSCHEME_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CONNECTIONSCHEME_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[ServiceType] [bit] NOT NULL,
	[MonthlyCharge] [float] NOT NULL,
	[MonthlyCharge2] [float] NOT NULL,
	[BillingCycle] [int] NOT NULL,
	[HardwareCharge] [float] NOT NULL,
	[InstallationCharge] [float] NOT NULL,
	[Description] [varchar](250) NULL,
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
 CONSTRAINT [PK_SMS_CONNECTIONSCHEME_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_CONNECTIONSCHEME_HISTORY] ON 

INSERT [dbo].[SMS_CONNECTIONSCHEME_HISTORY] ([Id], [FID], [Name], [Code], [ServiceType], [MonthlyCharge], [MonthlyCharge2], [BillingCycle], [HardwareCharge], [InstallationCharge], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'PREPAID', N'PREPAID', 1, 0, 0, 1, 0, 0, N'PREPAID', 1, CAST(N'2022-08-08T13:00:46.990' AS DateTime), 1, NULL, NULL, 0, NULL, CAST(N'2022-08-08T13:00:46.997' AS DateTime), 1, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[SMS_CONNECTIONSCHEME_HISTORY] OFF
GO
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

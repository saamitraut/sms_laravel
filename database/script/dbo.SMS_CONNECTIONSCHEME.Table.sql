USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CONNECTIONSCHEME]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CONNECTIONSCHEME](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[ServiceType] [tinyint] NOT NULL,
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
 CONSTRAINT [PK_SMS_CONNECTIONSCHEME] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_CONNECTIONSCHEME] ON 

INSERT [dbo].[SMS_CONNECTIONSCHEME] ([Id], [Name], [Code], [ServiceType], [MonthlyCharge], [MonthlyCharge2], [BillingCycle], [HardwareCharge], [InstallationCharge], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark]) VALUES (1, N'PREPAID', N'PREPAID', 3, 0, 0, 1, 0, 0, N'PREPAID', 1, CAST(N'2022-08-08T13:00:46.990' AS DateTime), 1, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[SMS_CONNECTIONSCHEME] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_CONNECTIONSCHEME]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME] ADD  CONSTRAINT [IX_SMS_CONNECTIONSCHEME] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_CONNECTIONSCHEME_1]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME] ADD  CONSTRAINT [IX_SMS_CONNECTIONSCHEME_1] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME] ADD  CONSTRAINT [DF_SMS_CONNECTIONSCHEME_ServiceType]  DEFAULT ((0)) FOR [ServiceType]
GO
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME] ADD  CONSTRAINT [DF_SMS_CONNECTIONSCHEME_MonthlyCharge]  DEFAULT ((0)) FOR [MonthlyCharge]
GO
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME] ADD  CONSTRAINT [DF_SMS_CONNECTIONSCHEME_MonthlyCharge2]  DEFAULT ((0)) FOR [MonthlyCharge2]
GO
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME] ADD  CONSTRAINT [DF_SMS_CONNECTIONSCHEME_BillCycle]  DEFAULT ((1)) FOR [BillingCycle]
GO
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME] ADD  CONSTRAINT [DF_SMS_CONNECTIONSCHEME_HardwareCharge]  DEFAULT ((0)) FOR [HardwareCharge]
GO
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME] ADD  CONSTRAINT [DF_SMS_CONNECTIONSCHEME_InstallationCharge]  DEFAULT ((0)) FOR [InstallationCharge]
GO
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME] ADD  CONSTRAINT [DF_SMS_CONNECTIONSCHEME_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_CONNECTIONSCHEME] ADD  CONSTRAINT [DF_SMS_CONNECTIONSCHEME_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Analog
1-Digital' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_CONNECTIONSCHEME', @level2type=N'COLUMN',@level2name=N'ServiceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bill Cycle Month
1-every month
2-every second month
3-quaterly
6-Half Yearly
12-Yearly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_CONNECTIONSCHEME', @level2type=N'COLUMN',@level2name=N'BillingCycle'
GO

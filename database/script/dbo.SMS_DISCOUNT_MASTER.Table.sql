USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_DISCOUNT_MASTER]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_DISCOUNT_MASTER](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DiscountTitle] [varchar](150) NOT NULL,
	[DiscountCode] [varchar](50) NOT NULL,
	[ServiceType] [bit] NOT NULL,
	[AccountType] [char](1) NOT NULL,
	[DiscountValue] [float] NOT NULL,
	[IsInAmount] [bit] NOT NULL,
	[DiscountPeriod] [int] NOT NULL,
	[Description] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_DISCOUNT_MASTER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_DISCOUNT_MASTER]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_DISCOUNT_MASTER] ADD  CONSTRAINT [IX_SMS_DISCOUNT_MASTER] UNIQUE NONCLUSTERED 
(
	[DiscountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_DISCOUNT_MASTER_1]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_DISCOUNT_MASTER] ADD  CONSTRAINT [IX_SMS_DISCOUNT_MASTER_1] UNIQUE NONCLUSTERED 
(
	[DiscountTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_DISCOUNT_MASTER] ADD  CONSTRAINT [DF_SMS_DISCOUNT_MASTER_ServiceType]  DEFAULT ((0)) FOR [ServiceType]
GO
ALTER TABLE [dbo].[SMS_DISCOUNT_MASTER] ADD  CONSTRAINT [DF_SMS_DISCOUNT_MASTER_AccountType]  DEFAULT ('B') FOR [AccountType]
GO
ALTER TABLE [dbo].[SMS_DISCOUNT_MASTER] ADD  CONSTRAINT [DF_SMS_DISCOUNT_MASTER_IsInAmount]  DEFAULT ((0)) FOR [IsInAmount]
GO
ALTER TABLE [dbo].[SMS_DISCOUNT_MASTER] ADD  CONSTRAINT [DF_SMS_DISCOUNT_MASTER_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_DISCOUNT_MASTER] ADD  CONSTRAINT [DF_SMS_DISCOUNT_MASTER_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Analog
1-Digital' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_DISCOUNT_MASTER', @level2type=N'COLUMN',@level2name=N'ServiceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'P-Only For Primary
S-Only For Secondary
B-For Both' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_DISCOUNT_MASTER', @level2type=N'COLUMN',@level2name=N'AccountType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-In Percent
1-In Amount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_DISCOUNT_MASTER', @level2type=N'COLUMN',@level2name=N'IsInAmount'
GO

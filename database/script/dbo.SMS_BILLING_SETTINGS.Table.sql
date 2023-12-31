USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_BILLING_SETTINGS]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_BILLING_SETTINGS](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CODE] [varchar](10) NOT NULL,
	[VALUE] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
	[Status] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_BILLING_SETTINGS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_BILLING_SETTINGS_1]    Script Date: 2023-11-10 06:14:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SMS_BILLING_SETTINGS_1] ON [dbo].[SMS_BILLING_SETTINGS]
(
	[CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_BILLING_SETTINGS] ADD  CONSTRAINT [DF_SMS_BILLING_SETTINGS_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

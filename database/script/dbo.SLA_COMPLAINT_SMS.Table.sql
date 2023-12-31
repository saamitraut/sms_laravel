USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_COMPLAINT_SMS]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_COMPLAINT_SMS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[SubCallId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[ServiceType] [bigint] NOT NULL,
	[Description] [varchar](8000) NOT NULL,
	[Status] [bit] NOT NULL,
	[EnteredFrom] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SLA_COMPLAINT_SMS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT_SMS] ADD  CONSTRAINT [DF_SLA_COMPLAINT_SMS_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT_SMS] ADD  CONSTRAINT [DF_SLA_COMPLAINT_SMS_AccountId]  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT_SMS] ADD  CONSTRAINT [DF_SLA_COMPLAINT_SMS_ServiceType]  DEFAULT ((1)) FOR [ServiceType]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT_SMS] ADD  CONSTRAINT [DF_SLA_COMPLAINT_SMS_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT_SMS] ADD  CONSTRAINT [DF_SLA_COMPLAINT_SMS_EnteredFrom]  DEFAULT ((1)) FOR [EnteredFrom]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT_SMS] ADD  CONSTRAINT [DF_SLA_COMPLAINT_SMS_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Analog
1-Digital' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_COMPLAINT_SMS', @level2type=N'COLUMN',@level2name=N'ServiceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Closed
1-Open' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_COMPLAINT_SMS', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-SLA
2-SMS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_COMPLAINT_SMS', @level2type=N'COLUMN',@level2name=N'EnteredFrom'
GO

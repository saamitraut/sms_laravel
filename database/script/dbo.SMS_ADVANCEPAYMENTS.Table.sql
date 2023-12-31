USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_ADVANCEPAYMENTS]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_ADVANCEPAYMENTS](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[ServiceType] [bit] NOT NULL,
	[Amount] [float] NOT NULL,
	[StartingMonth] [date] NOT NULL,
	[RecieptId] [varchar](50) NULL,
	[RecieptDate] [date] NULL,
	[ReasonId] [bigint] NOT NULL,
	[Description] [varchar](250) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_ADVANCEPAYMENTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_ADVANCEPAYMENTS] ADD  CONSTRAINT [DF_SMS_ADVANCEPAYMENTS_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[SMS_ADVANCEPAYMENTS] ADD  CONSTRAINT [DF_SMS_ADVANCEPAYMENTS_ServiceType]  DEFAULT ((0)) FOR [ServiceType]
GO
ALTER TABLE [dbo].[SMS_ADVANCEPAYMENTS] ADD  CONSTRAINT [DF_SMS_ADVANCEPAYMENTS_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Analog
1-Digital' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_ADVANCEPAYMENTS', @level2type=N'COLUMN',@level2name=N'ServiceType'
GO

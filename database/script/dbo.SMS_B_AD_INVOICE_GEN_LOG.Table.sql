USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_B_AD_INVOICE_GEN_LOG]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_B_AD_INVOICE_GEN_LOG](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ScheduleDate] [datetime] NOT NULL,
	[StartedOn] [datetime] NULL,
	[CompletedOn] [datetime] NULL,
	[BillDate] [date] NOT NULL,
	[BillDueDate] [date] NOT NULL,
	[BillMonthYear] [date] NOT NULL,
	[EstimatedBills] [bigint] NOT NULL,
	[NoofBillGenerated] [int] NOT NULL,
	[BILLFOR] [int] NOT NULL,
	[BillforId] [bigint] NOT NULL,
	[BillforLabel] [varchar](150) NULL,
	[Status] [int] NOT NULL,
	[where_clause] [varchar](8000) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_B_AD_INVOICE_GEN_LOG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_B_AD_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_AD_INVOICE_GEN_LOG_ScheduleDate]  DEFAULT (getdate()) FOR [ScheduleDate]
GO
ALTER TABLE [dbo].[SMS_B_AD_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_AD_INVOICE_GEN_LOG_EstimatedBills]  DEFAULT ((-1)) FOR [EstimatedBills]
GO
ALTER TABLE [dbo].[SMS_B_AD_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_AD_INVOICE_GEN_LOG_NoofBillGenerated]  DEFAULT ((0)) FOR [NoofBillGenerated]
GO
ALTER TABLE [dbo].[SMS_B_AD_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_AD_INVOICE_GEN_LOG_BILLFOR]  DEFAULT ((1)) FOR [BILLFOR]
GO
ALTER TABLE [dbo].[SMS_B_AD_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_AD_INVOICE_GEN_LOG_BillforIds]  DEFAULT ((0)) FOR [BillforId]
GO
ALTER TABLE [dbo].[SMS_B_AD_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_AD_INVOICE_GEN_LOG_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_B_AD_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_AD_INVOICE_GEN_LOG_where_clause]  DEFAULT ((0)) FOR [where_clause]
GO
ALTER TABLE [dbo].[SMS_B_AD_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_AD_INVOICE_GEN_LOG_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-AreaWise
2-SocietyWise
3-OperatorWise' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_B_AD_INVOICE_GEN_LOG', @level2type=N'COLUMN',@level2name=N'BILLFOR'
GO

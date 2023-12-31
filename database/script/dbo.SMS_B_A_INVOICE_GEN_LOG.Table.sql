USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_B_A_INVOICE_GEN_LOG]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_B_A_INVOICE_GEN_LOG](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ScheduleDate] [datetime] NOT NULL,
	[StartedOn] [datetime] NULL,
	[CompletedOn] [datetime] NULL,
	[BillDate] [date] NOT NULL,
	[BillDueDate] [date] NOT NULL,
	[BillMonthYear] [date] NOT NULL,
	[EstimatedBills] [bigint] NOT NULL,
	[NoofBillGenerated] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[where_clause] [varchar](8000) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[AD_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_SMS_B_A_INVOICE_GEN_LOG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_B_A_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_A_INVOICE_GEN_LOG_ScheduleDtae]  DEFAULT (getdate()) FOR [ScheduleDate]
GO
ALTER TABLE [dbo].[SMS_B_A_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_A_INVOICE_GEN_LOG_EstimatedBills]  DEFAULT ((-1)) FOR [EstimatedBills]
GO
ALTER TABLE [dbo].[SMS_B_A_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_A_INVOICE_GEN_LOG_NoofBillGenerated]  DEFAULT ((0)) FOR [NoofBillGenerated]
GO
ALTER TABLE [dbo].[SMS_B_A_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_A_INVOICE_GEN_LOG_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_B_A_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_A_INVOICE_GEN_LOG_SubscriberId]  DEFAULT ((0)) FOR [where_clause]
GO
ALTER TABLE [dbo].[SMS_B_A_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_A_INVOICE_GEN_LOG_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_B_A_INVOICE_GEN_LOG] ADD  CONSTRAINT [DF_SMS_B_A_INVOICE_GEN_LOG_AD_ID]  DEFAULT ((0)) FOR [AD_ID]
GO

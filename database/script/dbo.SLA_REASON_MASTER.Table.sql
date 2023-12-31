USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_REASON_MASTER]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_REASON_MASTER](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReasonTitle] [varchar](150) NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[Description] [varchar](250) NULL,
	[ReasonFor] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SLA_REASON_MASTER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_REASON_MASTER] ADD  CONSTRAINT [DF_SLA_REASON_MASTER_IsLocked]  DEFAULT ((0)) FOR [IsLocked]
GO
ALTER TABLE [dbo].[SLA_REASON_MASTER] ADD  CONSTRAINT [DF_SLA_REASON_MASTER_ReasonFor]  DEFAULT ((0)) FOR [ReasonFor]
GO
ALTER TABLE [dbo].[SLA_REASON_MASTER] ADD  CONSTRAINT [DF_SLA_REASON_MASTER_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SLA_REASON_MASTER] ADD  CONSTRAINT [DF_SLA_REASON_MASTER_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Payments
2-Billings
3-Adjustments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_REASON_MASTER', @level2type=N'COLUMN',@level2name=N'ReasonFor'
GO

USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_SDHDCONVERTION]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_SDHDCONVERTION](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[Complaintid] [bigint] NOT NULL,
	[RecieptNo] [varchar](150) NOT NULL,
	[RecieptDate] [date] NULL,
	[RecieptAmount] [float] NOT NULL,
	[BoxType] [bigint] NOT NULL,
	[SchemeId] [bigint] NOT NULL,
	[RateType] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[AccountId] [bigint] NOT NULL,
 CONSTRAINT [PK_SLA_SDHDCONVERTION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_SDHDCONVERTION] ADD  CONSTRAINT [DF_SLA_SDHDCONVERTION_RecieptAmount]  DEFAULT ((0)) FOR [RecieptAmount]
GO
ALTER TABLE [dbo].[SLA_SDHDCONVERTION] ADD  CONSTRAINT [DF_Table_1_ServiceType]  DEFAULT ((0)) FOR [BoxType]
GO
ALTER TABLE [dbo].[SLA_SDHDCONVERTION] ADD  CONSTRAINT [DF_SLA_SDHDCONVERTION_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SLA_SDHDCONVERTION] ADD  CONSTRAINT [DF_SLA_SDHDCONVERTION_AccountId]  DEFAULT ((0)) FOR [AccountId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Analog
1-Digital
2-Internet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_SDHDCONVERTION', @level2type=N'COLUMN',@level2name=N'BoxType'
GO

USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_PROSPETSUBSCRIBERS]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_PROSPETSUBSCRIBERS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FormNo] [varchar](50) NOT NULL,
	[PCustomerId] [varchar](20) NULL,
	[OperatorId] [bigint] NOT NULL,
	[SocietyId] [bigint] NOT NULL,
	[MobileNo] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmedOn] [datetime] NULL,
	[ConfirmedBy] [bigint] NULL,
	[RecieptNo] [varchar](50) NULL,
	[RecieptDate] [date] NULL,
	[NewSubscriberId] [bigint] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sla_id] [bigint] NULL,
	[ActionTaken] [int] NOT NULL,
	[RecieptAmount] [float] NOT NULL,
 CONSTRAINT [PK_SLA_PROSPETSUBSCRIBERS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SLA_PROSPETSUBSCRIBERS]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SLA_PROSPETSUBSCRIBERS] ADD  CONSTRAINT [IX_SLA_PROSPETSUBSCRIBERS] UNIQUE NONCLUSTERED 
(
	[FormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_PROSPETSUBSCRIBERS] ADD  CONSTRAINT [DF_SLA_PROSPETSUBSCRIBERS_SocietyId]  DEFAULT ((0)) FOR [SocietyId]
GO
ALTER TABLE [dbo].[SLA_PROSPETSUBSCRIBERS] ADD  CONSTRAINT [DF_Table_1_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SLA_PROSPETSUBSCRIBERS] ADD  CONSTRAINT [DF_SLA_PROSPETSUBSCRIBERS_IsConfirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[SLA_PROSPETSUBSCRIBERS] ADD  CONSTRAINT [DF_SLA_PROSPETSUBSCRIBERS_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SLA_PROSPETSUBSCRIBERS] ADD  CONSTRAINT [DF_SLA_PROSPETSUBSCRIBERS_ActionTaken]  DEFAULT ((1)) FOR [ActionTaken]
GO
ALTER TABLE [dbo].[SLA_PROSPETSUBSCRIBERS] ADD  DEFAULT ((0)) FOR [RecieptAmount]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Inserted
2-Updated
3-Confirmed
4-Transfer to SMS
5-Send To Trash' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_PROSPETSUBSCRIBERS', @level2type=N'COLUMN',@level2name=N'ActionTaken'
GO

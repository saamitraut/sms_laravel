USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_PROSPETSUBSCRIBERS_HISTORY]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_PROSPETSUBSCRIBERS_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FId] [bigint] NOT NULL,
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
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
	[RecieptAmount] [float] NOT NULL,
 CONSTRAINT [PK_SLA_PROSPETSUBSCRIBERS_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_PROSPETSUBSCRIBERS_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SLA_PROSPETSUBSCRIBERS_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO
ALTER TABLE [dbo].[SLA_PROSPETSUBSCRIBERS_HISTORY] ADD  DEFAULT ((0)) FOR [RecieptAmount]
GO

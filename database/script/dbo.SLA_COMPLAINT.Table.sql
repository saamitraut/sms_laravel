USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_COMPLAINT]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_COMPLAINT](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[ProspectId] [bigint] NOT NULL,
	[SubCallId] [bigint] NOT NULL,
	[CallLogId] [varchar](50) NOT NULL,
	[Description] [varchar](1500) NOT NULL,
	[Status] [bit] NOT NULL,
	[EnteredFrom] [int] NULL,
	[ClosedReplyId] [bigint] NOT NULL,
	[LastReplyId] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sla_id] [bigint] NULL,
	[CloseStatus] [int] NOT NULL,
 CONSTRAINT [PK_SLA_Complaint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT] ADD  CONSTRAINT [DF_SLA_COMPLAINT_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT] ADD  CONSTRAINT [DF_SLA_COMPLAINT_ProspectId]  DEFAULT ((0)) FOR [ProspectId]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT] ADD  CONSTRAINT [DF_SLA_COMPLAINT_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT] ADD  CONSTRAINT [DF_SLA_COMPLAINT_EnteredFrom]  DEFAULT ((1)) FOR [EnteredFrom]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT] ADD  CONSTRAINT [DF_SLA_COMPLAINT_ClosedReplyId]  DEFAULT ((0)) FOR [ClosedReplyId]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT] ADD  CONSTRAINT [DF_SLA_COMPLAINT_LastReplyId]  DEFAULT ((0)) FOR [LastReplyId]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT] ADD  CONSTRAINT [DF_SLA_COMPLAINT_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT] ADD  DEFAULT ((0)) FOR [CloseStatus]
GO
ALTER TABLE [dbo].[SLA_COMPLAINT]  WITH CHECK ADD  CONSTRAINT [FK_SLA_COMPLAINT_SLA_SUBCALLTYPE] FOREIGN KEY([SubCallId])
REFERENCES [dbo].[SLA_SUBCALLTYPE] ([ID])
GO
ALTER TABLE [dbo].[SLA_COMPLAINT] CHECK CONSTRAINT [FK_SLA_COMPLAINT_SLA_SUBCALLTYPE]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Closed
1-Open' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_COMPLAINT', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-SLA
2-SMS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_COMPLAINT', @level2type=N'COLUMN',@level2name=N'EnteredFrom'
GO

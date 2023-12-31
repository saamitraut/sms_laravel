USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_ESCALATIONS]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_ESCALATIONS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ComplaintId] [bigint] NOT NULL,
	[DesignationId] [bigint] NOT NULL,
	[EscalationType] [bit] NOT NULL,
	[Description] [varchar](550) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SLA_ESCALATIONS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_ESCALATIONS] ADD  CONSTRAINT [DF_SLA_ESCALATIONS_EscalationType]  DEFAULT ((0)) FOR [EscalationType]
GO
ALTER TABLE [dbo].[SLA_ESCALATIONS] ADD  CONSTRAINT [DF_SLA_ESCALATIONS_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SLA_ESCALATIONS] ADD  CONSTRAINT [DF_SLA_ESCALATIONS_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SLA_ESCALATIONS]  WITH CHECK ADD  CONSTRAINT [FK_SLA_ESCALATIONS_SLA_COMPLAINT] FOREIGN KEY([ComplaintId])
REFERENCES [dbo].[SLA_COMPLAINT] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SLA_ESCALATIONS] CHECK CONSTRAINT [FK_SLA_ESCALATIONS_SLA_COMPLAINT]
GO
ALTER TABLE [dbo].[SLA_ESCALATIONS]  WITH CHECK ADD  CONSTRAINT [FK_SLA_ESCALATIONS_SLA_USERDESIGNATION] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[SLA_USERDESIGNATION] ([ID])
GO
ALTER TABLE [dbo].[SLA_ESCALATIONS] CHECK CONSTRAINT [FK_SLA_ESCALATIONS_SLA_USERDESIGNATION]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Auto Escalation
1-Manual Escalation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_ESCALATIONS', @level2type=N'COLUMN',@level2name=N'EscalationType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-manual
0-Auto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_ESCALATIONS', @level2type=N'COLUMN',@level2name=N'Status'
GO

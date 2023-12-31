USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_COMPLAINTREPLY]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_COMPLAINTREPLY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ComplaintId] [bigint] NOT NULL,
	[Reply] [varchar](550) NULL,
	[EnteredFrom] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SLA_COMPLAINTREPLY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_COMPLAINTREPLY] ADD  CONSTRAINT [DF_SLA_COMPLAINTREPLY_EnteredFrom]  DEFAULT ((1)) FOR [EnteredFrom]
GO
ALTER TABLE [dbo].[SLA_COMPLAINTREPLY] ADD  CONSTRAINT [DF_SLA_COMPLAINTREPLY_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SLA_COMPLAINTREPLY] ADD  CONSTRAINT [DF_SLA_COMPLAINTREPLY_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SLA_COMPLAINTREPLY]  WITH CHECK ADD  CONSTRAINT [FK_SLA_COMPLAINTREPLY_SLA_COMPLAINT] FOREIGN KEY([ComplaintId])
REFERENCES [dbo].[SLA_COMPLAINT] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SLA_COMPLAINTREPLY] CHECK CONSTRAINT [FK_SLA_COMPLAINTREPLY_SLA_COMPLAINT]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Open Not Closed
0-Close Ok Accomplished
2-Not Accomplished
3-Declined or Inadmissible' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_COMPLAINTREPLY', @level2type=N'COLUMN',@level2name=N'Status'
GO

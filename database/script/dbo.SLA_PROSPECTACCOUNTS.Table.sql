USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_PROSPECTACCOUNTS]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_PROSPECTACCOUNTS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProspectId] [bigint] NOT NULL,
	[ServiceType] [int] NOT NULL,
	[ConnectionId] [bigint] NOT NULL,
	[RateType] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SLA_PROSPECTACCOUNTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_PROSPECTACCOUNTS] ADD  CONSTRAINT [DF_SLA_PROSPECTACCOUNTS_ServiceType]  DEFAULT ((0)) FOR [ServiceType]
GO
ALTER TABLE [dbo].[SLA_PROSPECTACCOUNTS] ADD  CONSTRAINT [DF_SLA_PROSPECTACCOUNTS_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SLA_PROSPECTACCOUNTS]  WITH CHECK ADD  CONSTRAINT [FK_SLA_PROSPECTACCOUNTS_SLA_PROSPETSUBSCRIBERS] FOREIGN KEY([ProspectId])
REFERENCES [dbo].[SLA_PROSPETSUBSCRIBERS] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SLA_PROSPECTACCOUNTS] CHECK CONSTRAINT [FK_SLA_PROSPECTACCOUNTS_SLA_PROSPETSUBSCRIBERS]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Analog
1-Digital' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_PROSPECTACCOUNTS', @level2type=N'COLUMN',@level2name=N'ServiceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Rate 1
0-Rate 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_PROSPECTACCOUNTS', @level2type=N'COLUMN',@level2name=N'RateType'
GO

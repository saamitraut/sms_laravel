USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_PROSPECTACCOUNTS_HISTORY]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_PROSPECTACCOUNTS_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Fid] [bigint] NOT NULL,
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
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SLA_PROSPECTACCOUNTS_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_PROSPECTACCOUNTS_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SLA_PROSPECTACCOUNTS_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

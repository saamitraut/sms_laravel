USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_SUBCALLTYPE_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_SUBCALLTYPE_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FId] [bigint] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[CalltypeId] [bigint] NOT NULL,
	[Description] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Remark] [varchar](250) NULL,
	[sla_id] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SLA_SUBCALLTYPE_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLA_SUBCALLTYPE_HISTORY] ON 

INSERT [dbo].[SLA_SUBCALLTYPE_HISTORY] ([Id], [FId], [Title], [Code], [CalltypeId], [Description], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Remark], [sla_id], [Deleted], [IsLocked], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'NO SIGNAL', N'NS', 2, N'NO SIGNAL', 1, CAST(N'2015-01-21T17:23:18.873' AS DateTime), 1, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2015-01-21T17:23:18.897' AS DateTime), 1, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[SLA_SUBCALLTYPE_HISTORY] OFF
GO
ALTER TABLE [dbo].[SLA_SUBCALLTYPE_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SLA_SUBCALLTYPE_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

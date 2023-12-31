USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_ENGINEER_AREA_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_ENGINEER_AREA_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FId] [bigint] NOT NULL,
	[ENGGID] [bigint] NOT NULL,
	[AREAID] [bigint] NOT NULL,
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
 CONSTRAINT [PK_SLA_ENGINEER_AREA_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLA_ENGINEER_AREA_HISTORY] ON 

INSERT [dbo].[SLA_ENGINEER_AREA_HISTORY] ([Id], [FId], [ENGGID], [AREAID], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, 1, 118, CAST(N'2015-01-21T17:35:03.140' AS DateTime), 0, NULL, NULL, 0, NULL, CAST(N'2015-01-21T17:35:03.160' AS DateTime), 0, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[SLA_ENGINEER_AREA_HISTORY] OFF
GO
ALTER TABLE [dbo].[SLA_ENGINEER_AREA_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SLA_ENGINEER_AREA_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

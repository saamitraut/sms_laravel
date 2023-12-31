USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_USERDESIGNATION_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_USERDESIGNATION_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FId] [bigint] NOT NULL,
	[Designation] [varchar](150) NOT NULL,
	[DesignationCode] [varchar](50) NOT NULL,
	[ParentId] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
	[CREATEDON] [datetime] NOT NULL,
	[CREATEDBY] [bigint] NOT NULL,
	[UPDATEDON] [datetime] NULL,
	[UPDATEDBY] [bigint] NULL,
	[Remark] [varchar](250) NULL,
	[Deleted] [bit] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SLA_USERDESIGNATION_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLA_USERDESIGNATION_HISTORY] ON 

INSERT [dbo].[SLA_USERDESIGNATION_HISTORY] ([Id], [FId], [Designation], [DesignationCode], [ParentId], [Status], [CREATEDON], [CREATEDBY], [UPDATEDON], [UPDATEDBY], [Remark], [Deleted], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'Manager', N'MNG', 0, 1, CAST(N'2014-07-18T17:48:14.400' AS DateTime), 1, NULL, NULL, NULL, 0, CAST(N'2015-01-21T17:27:55.957' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SLA_USERDESIGNATION_HISTORY] ([Id], [FId], [Designation], [DesignationCode], [ParentId], [Status], [CREATEDON], [CREATEDBY], [UPDATEDON], [UPDATEDBY], [Remark], [Deleted], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 2, N'TECHNICAL ASSISTANT', N'TA', 1, 1, CAST(N'2014-07-21T22:49:22.470' AS DateTime), 1, NULL, NULL, NULL, 0, CAST(N'2015-01-21T17:27:56.163' AS DateTime), 1, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[SLA_USERDESIGNATION_HISTORY] OFF
GO
ALTER TABLE [dbo].[SLA_USERDESIGNATION_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SLA_USERDESIGNATION_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

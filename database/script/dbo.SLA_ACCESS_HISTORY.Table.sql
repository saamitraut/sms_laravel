USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_ACCESS_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_ACCESS_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FId] [bigint] NOT NULL,
	[NAME] [varchar](100) NOT NULL,
	[LOGINID] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](50) NOT NULL,
	[USERTYPE] [varchar](50) NOT NULL,
	[STATUS] [varchar](20) NOT NULL,
	[CREATEDON] [datetime] NOT NULL,
	[UPDATEDON] [datetime] NULL,
	[CREATEDBY] [bigint] NOT NULL,
	[UPDATEDBY] [bigint] NULL,
	[OperatorID] [bigint] NULL,
	[Remark] [varchar](250) NULL,
	[deleted] [bit] NOT NULL,
	[SLA_id] [bigint] NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SLA_ACCESS_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLA_ACCESS_HISTORY] ON 

INSERT [dbo].[SLA_ACCESS_HISTORY] ([Id], [FId], [NAME], [LOGINID], [PASSWORD], [USERTYPE], [STATUS], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [OperatorID], [Remark], [deleted], [SLA_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'Admin', N'Admin', N'21232f297a57a5a743894a0e4a801fc3', N'SAdmin', N'1', CAST(N'2014-07-18T17:13:14.210' AS DateTime), NULL, 1, NULL, NULL, NULL, 0, NULL, CAST(N'2015-01-21T16:34:14.270' AS DateTime), 1, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[SLA_ACCESS_HISTORY] OFF
GO
ALTER TABLE [dbo].[SLA_ACCESS_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SLA_ACCESS_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

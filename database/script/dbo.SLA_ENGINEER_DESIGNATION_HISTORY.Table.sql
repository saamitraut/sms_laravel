USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_ENGINEER_DESIGNATION_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_ENGINEER_DESIGNATION_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FId] [bigint] NOT NULL,
	[Designation] [varchar](150) NOT NULL,
	[DesignationCode] [varchar](50) NOT NULL,
	[Parent_Designation] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
	[CREATEDON] [datetime] NOT NULL,
	[UPDATEDON] [datetime] NULL,
	[CREATEDBY] [bigint] NOT NULL,
	[UPDATEDBY] [bigint] NULL,
	[Remark] [varchar](250) NULL,
	[Deleted] [bit] NOT NULL,
	[sla_id] [bigint] NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SLA_ENGINEER_DESIGNATION_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLA_ENGINEER_DESIGNATION_HISTORY] ON 

INSERT [dbo].[SLA_ENGINEER_DESIGNATION_HISTORY] ([Id], [FId], [Designation], [DesignationCode], [Parent_Designation], [Status], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sla_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'Senior Engineer', N'SENG', 0, 1, CAST(N'2014-07-18T17:49:46.513' AS DateTime), NULL, 1, NULL, NULL, 0, NULL, CAST(N'2015-01-21T17:24:25.833' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SLA_ENGINEER_DESIGNATION_HISTORY] ([Id], [FId], [Designation], [DesignationCode], [Parent_Designation], [Status], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sla_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 2, N'Engineer', N'ENG', 1, 1, CAST(N'2014-07-18T17:50:02.727' AS DateTime), NULL, 1, NULL, NULL, 0, NULL, CAST(N'2015-01-21T17:24:26.070' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SLA_ENGINEER_DESIGNATION_HISTORY] ([Id], [FId], [Designation], [DesignationCode], [Parent_Designation], [Status], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sla_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (3, 3, N'Technician', N'TECH', 0, 1, CAST(N'2014-07-18T18:05:02.240' AS DateTime), NULL, 1, NULL, NULL, 0, NULL, CAST(N'2015-01-21T17:24:26.140' AS DateTime), 1, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[SLA_ENGINEER_DESIGNATION_HISTORY] OFF
GO
ALTER TABLE [dbo].[SLA_ENGINEER_DESIGNATION_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SLA_ENGINEER_DESIGNATION_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

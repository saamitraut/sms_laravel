USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_ENGINEER_DETAILS_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_ENGINEER_DETAILS_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FId] [bigint] NOT NULL,
	[NAME] [varchar](150) NOT NULL,
	[Mobile] [varchar](12) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](12) NULL,
	[DesignationId] [bigint] NOT NULL,
	[Description] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
	[LogInId] [varchar](150) NOT NULL,
	[Password] [varchar](150) NOT NULL,
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
 CONSTRAINT [PK_SLA_ENGINEER_DETAILS_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLA_ENGINEER_DETAILS_HISTORY] ON 

INSERT [dbo].[SLA_ENGINEER_DETAILS_HISTORY] ([Id], [FId], [NAME], [Mobile], [Email], [PhoneNo], [DesignationId], [Description], [Status], [LogInId], [Password], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sla_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'Anwar', N'9773157867', N'rajasir@gmail.com', N'', 2, NULL, 1, N'Braja', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2015-01-21T17:35:03.060' AS DateTime), NULL, 1, NULL, NULL, 0, NULL, CAST(N'2015-01-21T17:35:03.100' AS DateTime), 1, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[SLA_ENGINEER_DETAILS_HISTORY] OFF
GO
ALTER TABLE [dbo].[SLA_ENGINEER_DETAILS_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SLA_ENGINEER_DETAILS_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

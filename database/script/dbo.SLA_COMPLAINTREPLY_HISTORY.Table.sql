USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_COMPLAINTREPLY_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_COMPLAINTREPLY_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FId] [bigint] NOT NULL,
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
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SLA_COMPLAINTREPLY_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLA_COMPLAINTREPLY_HISTORY] ON 

INSERT [dbo].[SLA_COMPLAINTREPLY_HISTORY] ([Id], [FId], [ComplaintId], [Reply], [EnteredFrom], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, 1, N'Anwar sent', 1, 1, CAST(N'2015-01-21T17:43:17.690' AS DateTime), 1, NULL, NULL, 0, NULL, CAST(N'2015-01-21T17:43:17.830' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SLA_COMPLAINTREPLY_HISTORY] ([Id], [FId], [ComplaintId], [Reply], [EnteredFrom], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 1, 1, N'Anwar sent', 1, 1, CAST(N'2015-01-21T17:43:17.690' AS DateTime), 1, NULL, NULL, 0, NULL, CAST(N'2016-01-08T14:37:54.963' AS DateTime), -4, 1, 4, N'Deleted')
SET IDENTITY_INSERT [dbo].[SLA_COMPLAINTREPLY_HISTORY] OFF
GO
ALTER TABLE [dbo].[SLA_COMPLAINTREPLY_HISTORY] ADD  CONSTRAINT [DF__SLA_COMPL__Inser__4A2FA1B9]  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SLA_COMPLAINTREPLY_HISTORY] ADD  CONSTRAINT [DF__SLA_COMPL__Previ__4B23C5F2]  DEFAULT ((0)) FOR [PreviousId]
GO

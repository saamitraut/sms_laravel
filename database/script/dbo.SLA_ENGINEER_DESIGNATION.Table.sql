USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_ENGINEER_DESIGNATION]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_ENGINEER_DESIGNATION](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_SMS_ENGINEER_DESIGNATION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLA_ENGINEER_DESIGNATION] ON 

INSERT [dbo].[SLA_ENGINEER_DESIGNATION] ([ID], [Designation], [DesignationCode], [Parent_Designation], [Status], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sla_id]) VALUES (1, N'Senior Engineer', N'SENG', 0, 1, CAST(N'2014-07-18T17:49:46.513' AS DateTime), NULL, 1, NULL, NULL, 0, NULL)
INSERT [dbo].[SLA_ENGINEER_DESIGNATION] ([ID], [Designation], [DesignationCode], [Parent_Designation], [Status], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sla_id]) VALUES (2, N'Engineer', N'ENG', 1, 1, CAST(N'2014-07-18T17:50:02.727' AS DateTime), NULL, 1, NULL, NULL, 0, NULL)
INSERT [dbo].[SLA_ENGINEER_DESIGNATION] ([ID], [Designation], [DesignationCode], [Parent_Designation], [Status], [CREATEDON], [UPDATEDON], [CREATEDBY], [UPDATEDBY], [Remark], [Deleted], [sla_id]) VALUES (3, N'Technician', N'TECH', 0, 1, CAST(N'2014-07-18T18:05:02.240' AS DateTime), NULL, 1, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[SLA_ENGINEER_DESIGNATION] OFF
GO
ALTER TABLE [dbo].[SLA_ENGINEER_DESIGNATION] ADD  CONSTRAINT [DF_SMS_ENGINEER_DESIGNATION_Parent_Designation]  DEFAULT ((0)) FOR [Parent_Designation]
GO
ALTER TABLE [dbo].[SLA_ENGINEER_DESIGNATION] ADD  CONSTRAINT [DF_SMS_ENGINEER_DESIGNATION_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SLA_ENGINEER_DESIGNATION] ADD  CONSTRAINT [DF_SLA_ENGINEER_DESIGNATION_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=>Active 0=>Inactive' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SLA_ENGINEER_DESIGNATION', @level2type=N'COLUMN',@level2name=N'Status'
GO

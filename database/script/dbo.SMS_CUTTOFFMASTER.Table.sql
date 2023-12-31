USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CUTTOFFMASTER]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CUTTOFFMASTER](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Title] [varchar](150) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[cutoffDay] [varchar](150) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [bigint] NOT NULL,
	[Remark] [varchar](250) NOT NULL,
	[sms_id] [bigint] NULL,
 CONSTRAINT [PK_SMS_CUTTOFFMASTER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_CUTTOFFMASTER] ON 

INSERT [dbo].[SMS_CUTTOFFMASTER] ([Id], [Title], [Description], [Status], [cutoffDay], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (1, N'Actvation CutOff', N'Full Month Bill will be charged', 1, N'1 - 10', CAST(N'2012-01-11T00:00:00.000' AS DateTime), 1, NULL, NULL, 0, N'ertre', NULL)
INSERT [dbo].[SMS_CUTTOFFMASTER] ([Id], [Title], [Description], [Status], [cutoffDay], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (2, N'Actvation CutOff', N'Two Third of Month Bill will be charged', 1, N'11-20', CAST(N'2012-01-11T00:00:00.000' AS DateTime), 1, NULL, NULL, 0, N'werew', NULL)
INSERT [dbo].[SMS_CUTTOFFMASTER] ([Id], [Title], [Description], [Status], [cutoffDay], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id]) VALUES (3, N'Actvation CutOff', N'One Third of Month Bill will be charged', 1, N'21-30', CAST(N'2012-01-11T00:00:00.000' AS DateTime), 1, NULL, NULL, 0, N'sdfs', NULL)
SET IDENTITY_INSERT [dbo].[SMS_CUTTOFFMASTER] OFF
GO
ALTER TABLE [dbo].[SMS_CUTTOFFMASTER] ADD  CONSTRAINT [DF_SMS_CUTTOFFMASTER_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

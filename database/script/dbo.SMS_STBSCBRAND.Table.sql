USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_STBSCBRAND]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_STBSCBRAND](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BrandTitle] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[BoxType] [bit] NOT NULL,
	[TimeShift] [bit] NOT NULL,
	[Maxlength] [int] NOT NULL,
	[SignificantDigits] [int] NOT NULL,
	[CharAllowed] [tinyint] NOT NULL,
	[FORSMARTCARD] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sms_id] [bigint] NULL,
	[CASTYPEID] [bigint] NOT NULL,
 CONSTRAINT [PK_SMS_STBBRAND] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_STBSCBRAND] ON 

INSERT [dbo].[SMS_STBSCBRAND] ([Id], [BrandTitle], [Price], [BoxType], [TimeShift], [Maxlength], [SignificantDigits], [CharAllowed], [FORSMARTCARD], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [CASTYPEID]) VALUES (1, N'ABV_SMC', 0, 0, 0, 16, 16, 1, 1, 1, CAST(N'2022-08-06T13:04:42.877' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, 1)
INSERT [dbo].[SMS_STBSCBRAND] ([Id], [BrandTitle], [Price], [BoxType], [TimeShift], [Maxlength], [SignificantDigits], [CharAllowed], [FORSMARTCARD], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [CASTYPEID]) VALUES (2, N'ABV_STB', 0, 0, 0, 14, 14, 1, 0, 1, CAST(N'2022-08-06T13:06:07.880' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[SMS_STBSCBRAND] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_STBBRAND]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_STBSCBRAND] ADD  CONSTRAINT [IX_SMS_STBBRAND] UNIQUE NONCLUSTERED 
(
	[BrandTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_STBSCBRAND] ADD  CONSTRAINT [DF_SMS_STBBRAND_BoxType]  DEFAULT ((0)) FOR [BoxType]
GO
ALTER TABLE [dbo].[SMS_STBSCBRAND] ADD  CONSTRAINT [DF_SMS_STBBRAND_TimeShift]  DEFAULT ((0)) FOR [TimeShift]
GO
ALTER TABLE [dbo].[SMS_STBSCBRAND] ADD  CONSTRAINT [DF_SMS_STBSCBRAND_SignificantDigits]  DEFAULT ((10)) FOR [SignificantDigits]
GO
ALTER TABLE [dbo].[SMS_STBSCBRAND] ADD  CONSTRAINT [DF_SMS_STBSCBRAND_FORSMARTCARD]  DEFAULT ((0)) FOR [FORSMARTCARD]
GO
ALTER TABLE [dbo].[SMS_STBSCBRAND] ADD  CONSTRAINT [DF_SMS_STBBRAND_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_STBSCBRAND] ADD  CONSTRAINT [DF_SMS_STBBRAND_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_STBSCBRAND] ADD  DEFAULT ((0)) FOR [CASTYPEID]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-SD
1-HD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_STBSCBRAND', @level2type=N'COLUMN',@level2name=N'BoxType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-TimeShiftAvailable
0-TimeShift not Available' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_STBSCBRAND', @level2type=N'COLUMN',@level2name=N'TimeShift'
GO

USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_BULK_UPLOAD_FILE]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_BULK_UPLOAD_FILE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OperatorId] [bigint] NOT NULL,
	[BouqueId] [bigint] NOT NULL,
	[Month] [int] NOT NULL,
	[Count] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK_SMS_BULK_UPLOAD_FILE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_BULK_UPLOAD_FILE] ADD  CONSTRAINT [DF_SMS_BULK_UPLOAD_FILE_Count]  DEFAULT ((0)) FOR [Count]
GO

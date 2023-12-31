USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_BULK_UPLOAD_DETAILS]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_BULK_UPLOAD_DETAILS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UploadId] [bigint] NOT NULL,
	[SmartcardNo] [varchar](50) NOT NULL,
	[OperatorId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[BouqueId] [bigint] NOT NULL,
	[ActivationDate] [date] NOT NULL,
	[DeactivationDate] [date] NOT NULL,
	[Rate] [float] NOT NULL,
	[Month] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Process_status] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK_SMS_BULK_UPLOAD_DETAILS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_BULK_UPLOAD_DETAILS] ADD  CONSTRAINT [DF_SMS_BULK_UPLOAD_DETAILS_BouqueId]  DEFAULT ((0)) FOR [BouqueId]
GO

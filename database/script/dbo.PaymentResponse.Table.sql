USE [MNSMS]
GO
/****** Object:  Table [dbo].[PaymentResponse]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentResponse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NULL,
	[Message] [varchar](500) NULL,
	[Category] [varchar](100) NULL,
	[Status] [int] NULL,
	[AddedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentResponse] ADD  DEFAULT ((1)) FOR [Status]
GO

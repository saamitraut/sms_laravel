USE [MNSMS]
GO
/****** Object:  Table [dbo].[PaymentBank]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentBank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bank] [varchar](255) NULL,
	[BankCode] [varchar](50) NULL,
	[Status] [int] NULL,
	[AddedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentBank] ADD  DEFAULT ((1)) FOR [Status]
GO

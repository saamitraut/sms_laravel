USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PackageName] [varchar](100) NOT NULL,
	[CasCode] [varchar](50) NOT NULL,
	[IsAlacarte] [bit] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[thirtyDays] [int] NOT NULL,
	[sixtydays] [int] NOT NULL,
	[nintydays] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SMS_PACK_ALACA_ACTIVE_AGEING] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING] ON 

INSERT [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING] ([ID], [PackageName], [CasCode], [IsAlacarte], [ProductId], [thirtyDays], [sixtydays], [nintydays], [CreatedOn]) VALUES (1, N'All Channel Pack', N'999', 0, 1, 5, 0, 0, CAST(N'2022-10-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SMS_PACK_ALACA_ACTIVE_AGEING] OFF
GO

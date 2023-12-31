USE [MNSMS]
GO
/****** Object:  Table [dbo].[LatensErrorCodes]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LatensErrorCodes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ErrorCode] [bigint] NOT NULL,
	[SubError] [bigint] NOT NULL,
	[CodeDescription] [varchar](350) NOT NULL,
 CONSTRAINT [PK_SMS_LatensErrorCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [MNSMS]
GO
/****** Object:  Table [dbo].[Conax_Cas_Command_Param]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conax_Cas_Command_Param](
	[CommandId] [bigint] NOT NULL,
	[StartTime] [varchar](20) NOT NULL,
	[XAxis] [varchar](10) NULL,
	[YAxis] [varchar](10) NULL,
	[Duration] [varchar](20) NULL,
	[Height] [varchar](10) NULL,
	[Msg] [varchar](150) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[Repetition] [varchar](10) NULL,
	[Interval] [varchar](10) NULL
) ON [PRIMARY]
GO

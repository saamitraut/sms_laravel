USE [MNSMS]
GO
/****** Object:  Table [dbo].[tempdeletethis]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tempdeletethis](
	[rid] [bigint] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[Rate] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[LCOSharing] [float] NOT NULL,
	[NCFAmount] [float] NOT NULL,
	[NCF_LCOSharing] [float] NOT NULL,
	[BouqueId] [bigint] NULL,
	[DemoBouqueId] [bigint] NULL,
	[Status] [tinyint] NOT NULL,
	[ActivationDate] [date] NOT NULL,
	[DeactivationDate] [date] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[OperatorId] [bigint] NOT NULL,
	[SessionFlag] [bigint] NULL,
	[CASStatus] [tinyint] NOT NULL
) ON [PRIMARY]
GO

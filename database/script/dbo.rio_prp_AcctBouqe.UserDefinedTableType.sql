USE [MNSMS]
GO
/****** Object:  UserDefinedTableType [dbo].[rio_prp_AcctBouqe]    Script Date: 2023-11-10 06:13:54 ******/
CREATE TYPE [dbo].[rio_prp_AcctBouqe] AS TABLE(
	[bouqueId] [bigint] NOT NULL,
	[s_date] [date] NOT NULL,
	[e_date] [date] NULL,
	[Alacarte] [varchar](max) NULL,
	[IsDemo] [bit] NOT NULL DEFAULT ((0))
)
GO

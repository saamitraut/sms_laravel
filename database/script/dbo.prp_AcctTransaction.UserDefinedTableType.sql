USE [MNSMS]
GO
/****** Object:  UserDefinedTableType [dbo].[prp_AcctTransaction]    Script Date: 2023-11-10 06:13:54 ******/
CREATE TYPE [dbo].[prp_AcctTransaction] AS TABLE(
	[TransactionId] [bigint] NOT NULL
)
GO

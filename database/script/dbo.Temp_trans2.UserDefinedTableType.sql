USE [MNSMS]
GO
/****** Object:  UserDefinedTableType [dbo].[Temp_trans2]    Script Date: 2023-11-10 06:13:54 ******/
CREATE TYPE [dbo].[Temp_trans2] AS TABLE(
	[BouqueId] [int] NOT NULL,
	[AType] [int] NOT NULL,
	[BouqueName] [varchar](500) NOT NULL,
	[activationdate] [date] NULL,
	[ExpiryDate] [date] NULL,
	[Months] [int] NOT NULL DEFAULT ((1)),
	[noDays] [int] NOT NULL DEFAULT ((30)),
	[Tax] [float] NOT NULL DEFAULT ((0)),
	[Amt] [float] NOT NULL DEFAULT ((0)),
	[Balance] [float] NOT NULL DEFAULT ((0)),
	[CreditId] [int] NOT NULL DEFAULT ((0)),
	[adjustedAmt] [float] NOT NULL DEFAULT ((0)),
	[accountId] [int] NOT NULL DEFAULT ((0)),
	[InvoiceAmt] [float] NOT NULL DEFAULT ((0))
)
GO

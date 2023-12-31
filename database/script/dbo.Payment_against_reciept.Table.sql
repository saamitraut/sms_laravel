USE [MNSMS]
GO
/****** Object:  Table [dbo].[Payment_against_reciept]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_against_reciept](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RecieptNo] [varchar](150) NOT NULL,
	[Installlation] [float] NOT NULL,
	[Subscription] [float] NOT NULL,
	[taxonSubs] [float] NOT NULL,
	[taxonInstallation] [float] NOT NULL,
	[HEdu] [float] NOT NULL,
	[Edu] [float] NOT NULL,
	[IsPayConfirmed] [bit] NOT NULL,
	[ConfirmedBy] [bigint] NULL,
	[Complaintid] [bigint] NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[ProspectId] [bigint] NOT NULL,
	[RecieptDate] [datetime] NULL,
	[IsheadConfirmed] [bit] NOT NULL,
	[CashierId] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[Updatedby] [bigint] NULL,
 CONSTRAINT [PK_Payment_against_reciept] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payment_against_reciept] ADD  CONSTRAINT [DF_Payment_against_reciept_IsPayConfirmed]  DEFAULT ((0)) FOR [IsPayConfirmed]
GO
ALTER TABLE [dbo].[Payment_against_reciept] ADD  CONSTRAINT [DF__Payment_a__Subsc__73E77B11]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[Payment_against_reciept] ADD  CONSTRAINT [DF__Payment_a__Accou__74DB9F4A]  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[Payment_against_reciept] ADD  CONSTRAINT [DF__Payment_a__Prosp__75CFC383]  DEFAULT ((0)) FOR [ProspectId]
GO
ALTER TABLE [dbo].[Payment_against_reciept] ADD  CONSTRAINT [DF_Payment_against_reciept_IsheadConfirmed]  DEFAULT ((0)) FOR [IsheadConfirmed]
GO

USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_SHIFTINGREQUEST_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_SHIFTINGREQUEST_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FId] [bigint] NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[Complaintid] [bigint] NOT NULL,
	[OperatorId] [bigint] NOT NULL,
	[SocietyId] [bigint] NOT NULL,
	[AreaId] [bigint] NOT NULL,
	[FlatNo] [varchar](100) NULL,
	[FloorNo] [varchar](100) NULL,
	[Wing] [varchar](100) NULL,
	[Building] [varchar](100) NULL,
	[Address] [varchar](350) NOT NULL,
	[Zipcode] [varchar](50) NULL,
	[RecieptNo] [varchar](150) NULL,
	[RecieptDate] [date] NULL,
	[RecieptAmount] [float] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SLA_SHIFTINGREQUEST_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_SHIFTINGREQUEST_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SLA_SHIFTINGREQUEST_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

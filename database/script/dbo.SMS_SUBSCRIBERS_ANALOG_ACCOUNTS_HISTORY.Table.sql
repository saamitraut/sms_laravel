USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_SUBSCRIBERS_ANALOG_ACCOUNTS_HISTORY]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_SUBSCRIBERS_ANALOG_ACCOUNTS_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[TVId] [varchar](8) NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[ConnectionId] [bigint] NOT NULL,
	[ApplicableRate] [bigint] NOT NULL,
	[BillingSMonth] [date] NOT NULL,
	[ActivationDate] [date] NOT NULL,
	[DeactivationDate] [date] NULL,
	[IsPrimary] [bit] NOT NULL,
	[Description] [varchar](250) NULL,
	[ActionTaken] [int] NOT NULL,
	[ReasonId] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sms_id] [bigint] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SMS_SUBSCRIBERS_ANALOG_ACCOUNTS_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_ANALOG_ACCOUNTS_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_ANALOG_ACCOUNTS_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

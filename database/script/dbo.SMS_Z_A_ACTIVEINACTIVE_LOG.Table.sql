USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_Z_A_ACTIVEINACTIVE_LOG]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_Z_A_ACTIVEINACTIVE_LOG](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ActionFlag] [int] NOT NULL,
	[ActivationDate] [date] NOT NULL,
	[DeactivationDate] [date] NULL,
	[DateTime] [date] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[Flag] [int] NOT NULL,
 CONSTRAINT [PK_SMS_Z_A_ACTIVEINACTIVE_LOG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_Z_A_ACTIVEINACTIVE_LOG] ADD  CONSTRAINT [DF_SMS_Z_A_ACTIVEINACTIVE_LOG_Flag]  DEFAULT ((0)) FOR [Flag]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Inserted
2=Deactivated
3=Activated
4=Disconnected
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_Z_A_ACTIVEINACTIVE_LOG', @level2type=N'COLUMN',@level2name=N'ActionFlag'
GO

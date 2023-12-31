USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CAS_ABVERRORCODES]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CAS_ABVERRORCODES](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Errorcode] [char](2) NOT NULL,
	[Description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_SMSTABVERRORCODES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_CAS_ABVERRORCODES] ON 

INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (1, N'01', N'Invalid message')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (2, N'02', N'Protocol Version not supported ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (3, N'03', N'Message length error ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (4, N'04', N'Unknown Message Type ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (5, N'05', N'SMS Provider Unique ID value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (6, N'06', N'CAS Provider ID value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (7, N'07', N'SMS SAS Link ID value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (8, N'08', N'Priority value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (9, N'09', N'Provider_id value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (10, N'0A', N'Unique_address value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (11, N'0B', N'Right_period_count value less than 0 ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (12, N'0C', N'Message_date value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (13, N'0D', N'Expiration_date value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (14, N'0E', N'Right_start_date value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (15, N'0F', N'Right_end_date value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (16, N'10', N'Link_count value less than 0 ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (17, N'11', N'Link_id value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (18, N'12', N'Pin_code_length value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (19, N'13', N'Pin code value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (20, N'14', N'Transfer mode value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (21, N'15', N'Suspend mode value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (22, N'16', N'Enquire mode value unknown ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (23, N'17', N'This card is not exit ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (24, N'18', N'The card is exit, but is not used ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (25, N'19', N'The card is used. ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (26, N'1A', N'The card is paused ')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (27, N'1B', N'The card is deleted')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (28, N'1D', N'Some errors from ECMG')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (29, N'1E', N'Failed to access DB')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (30, N'20', N'EMMG don’t connect to ECMG, can’t to send message to ECMG.')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (31, N'21', N'E-mail content is greater than the length of 1024 bytes')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (32, N'22', N'User number is over,please update the system')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (33, N'70', N'Unknown error')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (34, N'00', N'Ok')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (35, N'-1', N'pending')
INSERT [dbo].[SMS_CAS_ABVERRORCODES] ([Id], [Errorcode], [Description]) VALUES (36, N'ew', N'Advance Renew')
SET IDENTITY_INSERT [dbo].[SMS_CAS_ABVERRORCODES] OFF
GO

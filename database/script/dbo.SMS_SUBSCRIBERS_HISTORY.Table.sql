USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_SUBSCRIBERS_HISTORY]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_SUBSCRIBERS_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[FormNo] [varchar](50) NOT NULL,
	[CustomerId] [varchar](20) NOT NULL,
	[OperatorId] [bigint] NOT NULL,
	[SocietyId] [bigint] NOT NULL,
	[MobileNo] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
	[ProspectId] [bigint] NULL,
	[PCustomerId] [varchar](20) NULL,
	[OpTobeBilled] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sms_id] [bigint] NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SMS_SUBSCRIBERS_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ON 

INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, N'FRM00000001', N'OZN0000001', 1, 1, N'9988776665', 1, NULL, NULL, 1, CAST(N'2022-08-06T13:07:30.433' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-08-06T13:07:30.443' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 1, N'FRM00000001', N'OZN0000001', 1, 1, N'9988776665', 1, NULL, NULL, 1, CAST(N'2022-08-06T13:07:30.433' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-08-06T13:09:24.017' AS DateTime), 1, 1, 2, N'CustomerId,')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (3, 3, N'FRM00000002', N'OZN0000002', 1, 1, N'9811998733', 1, NULL, NULL, 1, CAST(N'2022-10-07T16:45:48.273' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-10-07T16:45:48.293' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (4, 4, N'FRM00000003', N'OZN0000003', 1, 1, N'9865755588', 1, NULL, NULL, 1, CAST(N'2022-11-04T12:19:37.283' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-11-04T12:19:37.283' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (5, 5, N'FRM00000004', N'OZN0000004', 1, 1, N'6597554144', 1, NULL, NULL, 1, CAST(N'2022-11-04T12:21:47.270' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-11-04T12:21:47.273' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (6, 6, N'FRM00000005', N'OZN0000005', 1, 1, N'9811998733', 1, NULL, NULL, 1, CAST(N'2023-04-26T13:30:21.120' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-04-26T13:30:21.133' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (7, 7, N'FRM00000006', N'OZN0000006', 2, 2, N'9911944100', 1, NULL, NULL, 1, CAST(N'2023-06-06T14:09:37.867' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-06-06T14:09:37.867' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (8, 8, N'FRM00000007', N'OZN0000007', 2, 2, N'9899695957', 1, NULL, NULL, 1, CAST(N'2023-06-08T17:11:29.150' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-06-08T17:11:29.150' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (9, 9, N'FRM00000008', N'OZN0000008', 2, 3, N'8069878676', 1, NULL, NULL, 1, CAST(N'2023-08-21T13:50:06.817' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-08-21T13:50:06.817' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (10, 10, N'FRM00000009', N'OZN0000009', 2, 2, N'9811998733', 1, NULL, NULL, 1, CAST(N'2023-08-22T12:39:44.543' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-08-22T12:39:44.547' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (11, 5, N'FRM00000004', N'OZN0000004', 1, 1, N'9811998733', 1, NULL, NULL, 1, CAST(N'2022-11-04T12:21:47.270' AS DateTime), 1, CAST(N'2023-08-22T13:33:02.723' AS DateTime), 3, 0, NULL, NULL, CAST(N'2023-08-22T13:33:02.723' AS DateTime), 3, 5, 2, N'MobileNo,')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (12, 11, N'FRM00000010', N'OZN0000010', 2, 3, N'9990086177', 1, NULL, NULL, 1, CAST(N'2023-08-23T14:24:41.860' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-08-23T14:24:41.863' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (13, 12, N'FRM00000011', N'OZN0000011', 2, 2, N'9999895006', 1, NULL, NULL, 1, CAST(N'2023-08-23T14:28:18.550' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-08-23T14:28:18.550' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (14, 13, N'FRM00000012', N'OZN0000012', 2, 2, N'9811096310', 1, NULL, NULL, 1, CAST(N'2023-08-23T14:30:02.087' AS DateTime), 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-08-23T14:30:02.087' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (15, 9, N'FRM00000008', N'OZN0000008', 2, 3, N'9718741499', 1, NULL, NULL, 1, CAST(N'2023-08-21T13:50:06.817' AS DateTime), 3, CAST(N'2023-10-04T14:06:19.620' AS DateTime), 3, 0, NULL, NULL, CAST(N'2023-10-04T14:06:19.663' AS DateTime), 3, 9, 2, N'MobileNo,')
INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] ([Id], [FID], [FormNo], [CustomerId], [OperatorId], [SocietyId], [MobileNo], [Status], [ProspectId], [PCustomerId], [OpTobeBilled], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [sms_id], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (16, 12, N'FRM00000011', N'OZN0000011', 2, 3, N'9999895006', 1, NULL, NULL, 1, CAST(N'2023-08-23T14:28:18.550' AS DateTime), 3, CAST(N'2023-10-14T16:27:26.207' AS DateTime), 3, 0, NULL, NULL, CAST(N'2023-10-14T16:27:26.207' AS DateTime), 3, 13, 2, N'SocietyId,')
SET IDENTITY_INSERT [dbo].[SMS_SUBSCRIBERS_HISTORY] OFF
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBERS_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO

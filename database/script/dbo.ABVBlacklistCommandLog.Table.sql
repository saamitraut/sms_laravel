USE [MNSMS]
GO
/****** Object:  Table [dbo].[ABVBlacklistCommandLog]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ABVBlacklistCommandLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CommandName] [varchar](250) NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[PairingId] [bigint] NOT NULL,
	[SmartcardNo] [varchar](50) NOT NULL,
	[STBNo] [varchar](50) NOT NULL,
	[PackageId] [varchar](50) NULL,
	[AlacarteId] [varchar](50) NULL,
	[XMLRequest] [xml] NULL,
	[XMLResponse] [xml] NULL,
	[Result] [varchar](10) NULL,
	[StatusCode] [varchar](50) NULL,
	[Description] [varchar](250) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_ABVBlacklistCommandLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ABVBlacklistCommandLog] ON 

INSERT [dbo].[ABVBlacklistCommandLog] ([Id], [CommandName], [SubscriberId], [AccountId], [PairingId], [SmartcardNo], [STBNo], [PackageId], [AlacarteId], [XMLRequest], [XMLResponse], [Result], [StatusCode], [Description], [CreatedOn], [CreatedBy]) VALUES (1, N'BlacklistSTB', 1, 30, 46, N'8006064231081145', N'23117080034601', N'0', N'0', N'<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><soap:Body><InsertSTBBlacklist xmlns="http://www.ABVTC.com/WebServices/"><BlacklistSTB><xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata" id="NewDataSet"><xs:element name="NewDataSet" msdata:IsDataSet="true" msdata:UseCurrentLocale="true"><xs:complexType><xs:choice minOccurs="0" maxOccurs="unbounded"><xs:element name="Table1"><xs:complexType><xs:sequence><xs:element name="STBID" type="xs:string" minOccurs="0" /></xs:sequence></xs:complexType></xs:element></xs:choice></xs:complexType></xs:element></xs:schema><diffgr:diffgram xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata"><NewDataSet xmlns=""><Table1 diffgr:id="Table11" msdata:rowOrder="0" diffgr:hasChanges="inserted"><STBID>23117080034601</STBID></Table1></NewDataSet></diffgr:diffgram></BlacklistSTB></InsertSTBBlacklist></soap:Body></soap:Envelope>', N'<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><InsertSTBBlacklistResponse xmlns="http://www.ABVTC.com/WebServices/"><InsertSTBBlacklistResult>OK</InsertSTBBlacklistResult></InsertSTBBlacklistResponse></soap:Body></soap:Envelope>', N'1', N'OK', N'', CAST(N'2022-11-04T21:52:35.150' AS DateTime), 1)
INSERT [dbo].[ABVBlacklistCommandLog] ([Id], [CommandName], [SubscriberId], [AccountId], [PairingId], [SmartcardNo], [STBNo], [PackageId], [AlacarteId], [XMLRequest], [XMLResponse], [Result], [StatusCode], [Description], [CreatedOn], [CreatedBy]) VALUES (2, N'BlacklistUA', 1, 30, 46, N'8006064231081145', N'23117080034601', N'0', N'0', N'<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><soap:Body><InsertUABlacklist xmlns="http://www.ABVTC.com/WebServices/"><BlacklistUA><xs:schema xmlns="" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata" id="NewDataSet"><xs:element name="NewDataSet" msdata:IsDataSet="true" msdata:UseCurrentLocale="true"><xs:complexType><xs:choice minOccurs="0" maxOccurs="unbounded"><xs:element name="Table1"><xs:complexType><xs:sequence><xs:element name="UA" type="xs:string" minOccurs="0" /></xs:sequence></xs:complexType></xs:element></xs:choice></xs:complexType></xs:element></xs:schema><diffgr:diffgram xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgr-v1" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata"><NewDataSet xmlns=""><Table1 diffgr:id="Table11" msdata:rowOrder="0" diffgr:hasChanges="inserted"><UA>257721145874</UA></Table1></NewDataSet></diffgr:diffgram></BlacklistUA></InsertUABlacklist></soap:Body></soap:Envelope>', N'<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><InsertUABlacklistResponse xmlns="http://www.ABVTC.com/WebServices/"><InsertUABlacklistResult>Error:  no parameter</InsertUABlacklistResult></InsertUABlacklistResponse></soap:Body></soap:Envelope>', N'0', N'Error:  no parameter', N'', CAST(N'2022-11-04T21:52:35.200' AS DateTime), 1)
INSERT [dbo].[ABVBlacklistCommandLog] ([Id], [CommandName], [SubscriberId], [AccountId], [PairingId], [SmartcardNo], [STBNo], [PackageId], [AlacarteId], [XMLRequest], [XMLResponse], [Result], [StatusCode], [Description], [CreatedOn], [CreatedBy]) VALUES (3, N'BlacklistUA', 1, 223, 0, N'8006064231081145', N'23117080034601', N'0', N'0', N'<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><soap:Body><InsertUABlacklist xmlns="http://www.ABVTC.com/WebServices/"><BlacklistUA><xs:schema xmlns="" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata" id="NewDataSet"><xs:element name="NewDataSet" msdata:IsDataSet="true" msdata:UseCurrentLocale="true"><xs:complexType><xs:choice minOccurs="0" maxOccurs="unbounded"><xs:element name="Table1"><xs:complexType><xs:sequence><xs:element name="UA" type="xs:string" minOccurs="0" /></xs:sequence></xs:complexType></xs:element></xs:choice></xs:complexType></xs:element></xs:schema><diffgr:diffgram xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgr-v1" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata"><NewDataSet xmlns=""><Table1 diffgr:id="Table11" msdata:rowOrder="0" diffgr:hasChanges="inserted"><UA>257721145874</UA></Table1></NewDataSet></diffgr:diffgram></BlacklistUA></InsertUABlacklist></soap:Body></soap:Envelope>', N'<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><InsertUABlacklistResponse xmlns="http://www.ABVTC.com/WebServices/"><InsertUABlacklistResult>Error:  no parameter</InsertUABlacklistResult></InsertUABlacklistResponse></soap:Body></soap:Envelope>', N'0', N'Error:  no parameter', N'', CAST(N'2022-11-04T21:59:27.050' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[ABVBlacklistCommandLog] OFF
GO

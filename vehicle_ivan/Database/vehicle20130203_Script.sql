USE [VehicleDB]
GO
/****** Object:  Table [dbo].[DailyRecord]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DailyRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HistoricArc] [varchar](50) NULL,
	[SBC_VIN] [varchar](50) NULL,
	[UUID] [varchar](50) NULL,
	[TruckID] [varchar](50) NULL,
	[SerialNumber] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[InstallType] [varchar](50) NULL,
	[InstallComplete] [bit] NOT NULL,
	[DeInstallRequired] [bit] NOT NULL,
	[InstallScheduled] [date] NOT NULL,
	[InstallDate] [date] NOT NULL,
 CONSTRAINT [PK_DailyRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DailyRecordFile]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DailyRecordFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DailyRecordID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[URL] [varchar](50) NULL,
 CONSTRAINT [PK_DailyRecordFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImportFile]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImportFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[URL] [varchar](50) NULL,
	[UploadedByUser] [varchar](50) NULL,
	[UploadedBy] [int] NOT NULL,
	[UploadedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ImportFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Messages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountSid] [varchar](34) NULL,
	[ApiVersion] [varchar](50) NULL,
	[ToNumber] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Sid] [varchar](34) NULL,
	[Uri] [varchar](255) NULL,
	[Body] [varchar](1000) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateSent] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[Direction] [varchar](50) NULL,
	[FromNumber] [varchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[RecordStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OWRInfo]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OWRInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImportFileID] [int] NULL,
	[RequestID] [varchar](50) NULL,
	[SBC_VIN] [varchar](50) NULL,
	[TrackingSheet] [varchar](max) NULL,
	[UPSTrackingNumber] [varchar](50) NULL,
	[IWM_GPS_UNIT] [varchar](50) NULL,
	[SUPER_ARC_CODE] [varchar](50) NULL,
	[VENDOR_CLOSE_DATE] [varchar](50) NULL,
	[REQUEST_TYPE] [varchar](50) NULL,
	[COMPANY] [varchar](50) NULL,
	[GPS_CENTER] [varchar](50) NULL,
	[CASE_NUMBER] [varchar](50) NULL,
	[REPORTED_PROBLEM_CODE] [varchar](50) NULL,
	[PROBLEM_DESCRIPTION] [varchar](255) NULL,
	[PROBLEM_TEXT] [varchar](max) NULL,
	[SPECIAL_ACCESS] [varchar](max) NULL,
	[SPECIAL_HANDLING] [varchar](50) NULL,
	[CENTER_COMMENTS] [varchar](max) NULL,
	[ORIGINATION_DATE] [varchar](50) NULL,
	[SUBMISSION_DATE] [varchar](50) NULL,
	[SBC_CLOSE_DATE] [varchar](50) NULL,
	[WorkingDays] [int] NOT NULL,
	[TotalDuration] [int] NOT NULL,
	[MAKE] [varchar](50) NULL,
	[MODEL] [varchar](50) NULL,
	[LICENSE] [varchar](50) NULL,
	[DATA_MIN] [varchar](50) NULL,
	[GARAGE_ADDRESS] [varchar](max) NULL,
	[GARAGE_CITY] [varchar](50) NULL,
	[GARAGE_STATE] [varchar](50) NULL,
	[SUPER_LAST_NAME] [varchar](50) NULL,
	[SUPER_TELEPHONE_NUM] [varchar](50) NULL,
	[SUPER_PAGER_NUM] [varchar](50) NULL,
	[SUPER_PAGER_PIN] [varchar](50) NULL,
	[E_MAIL] [varchar](50) NULL,
	[CENTER_LAST_NAME] [varchar](50) NULL,
	[CENTER_TELEPHONE_NUM] [varchar](50) NULL,
	[CREW_NAME] [varchar](50) NULL,
	[SCREEN_UUID] [varchar](50) NULL,
	[CLOSE_UUID] [varchar](50) NULL,
	[GATE_CODE] [varchar](50) NULL,
	[ENTITY_DESCRIPTION] [varchar](50) NULL,
	[SUPER_CELLULAR_NUM] [varchar](50) NULL,
	[ORIGINATOR_UUID] [varchar](50) NULL,
	[SUPER_UUID] [varchar](50) NULL,
	[GARAGE_ZIP] [varchar](50) NULL,
	[SUPER_FIRST_NAME] [varchar](50) NULL,
	[LAST_MODIFIED_UUID] [varchar](50) NULL,
	[NO_SHOW_FLAG] [varchar](50) NULL,
	[MODIFICATION_TYPE] [varchar](50) NULL,
 CONSTRAINT [PK_'OWR Info$'] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parts]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectSettings]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectSettings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SmsLogUpdateDate] [datetime] NULL,
	[SmsLogRefreshTime] [int] NOT NULL,
	[StopSmsLogService] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VehicleParts]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleParts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleID] [int] NULL,
	[PartID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_VehiclePart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 2/3/2013 11:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehicles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DailyRecord] ADD  CONSTRAINT [DF_DailyRecord_InstallComplete_1]  DEFAULT ((0)) FOR [InstallComplete]
GO
ALTER TABLE [dbo].[DailyRecord] ADD  CONSTRAINT [DF_DailyRecord_DeInstallRequired]  DEFAULT ((0)) FOR [DeInstallRequired]
GO
ALTER TABLE [dbo].[DailyRecord] ADD  CONSTRAINT [DF_DailyRecord_InstallScheduled_1]  DEFAULT (getdate()) FOR [InstallScheduled]
GO
ALTER TABLE [dbo].[DailyRecord] ADD  CONSTRAINT [DF_DailyRecord_InstalationDate]  DEFAULT (getdate()) FOR [InstallDate]
GO
ALTER TABLE [dbo].[ImportFile] ADD  CONSTRAINT [DF_ImportFile_UploadedAt]  DEFAULT (getdate()) FOR [UploadedAt]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_RecordStatus]  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[DailyRecordFile]  WITH CHECK ADD  CONSTRAINT [FK_DailyRecordFile_DailyRecord] FOREIGN KEY([DailyRecordID])
REFERENCES [dbo].[DailyRecord] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DailyRecordFile] CHECK CONSTRAINT [FK_DailyRecordFile_DailyRecord]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[VehicleParts]  WITH CHECK ADD  CONSTRAINT [FK_VehiclePart_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([ID])
GO
ALTER TABLE [dbo].[VehicleParts] CHECK CONSTRAINT [FK_VehiclePart_Vehicle]
GO
ALTER TABLE [dbo].[VehicleParts]  WITH CHECK ADD  CONSTRAINT [FK_VehicleParts_Parts] FOREIGN KEY([PartID])
REFERENCES [dbo].[Parts] ([ID])
GO
ALTER TABLE [dbo].[VehicleParts] CHECK CONSTRAINT [FK_VehicleParts_Parts]
GO

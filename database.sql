USE [ASSIGNMENT]
GO
/****** Object:  Table [dbo].[CategoryJobs]    Script Date: 12-Mar-24 08:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryJobs](
	[IdCategory] [nvarchar](20) NOT NULL,
	[NameCategory] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12-Mar-24 08:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[IdComment] [int] IDENTITY(1,1) NOT NULL,
	[ContentComment] [nvarchar](max) NULL,
	[IdJob] [int] NULL,
	[IdUser] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdComment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employers]    Script Date: 12-Mar-24 08:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employers](
	[IdEmployer] [int] IDENTITY(1,1) NOT NULL,
	[EmailEmployer] [nvarchar](50) NOT NULL,
	[FoundedYear] [int] NULL,
	[NumberOfEmployees] [nvarchar](50) NULL,
	[Describes] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmployer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EmailEmployer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorySubmit]    Script Date: 12-Mar-24 08:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorySubmit](
	[IdHistory] [int] IDENTITY(1,1) NOT NULL,
	[TimeSubmit] [date] NULL,
	[IdUser] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [char](10) NULL,
	[IdJob] [int] NULL,
	[Status] [nvarchar](20) NULL,
	[Link] [nvarchar](max) NULL,
	[Handle] [nvarchar](20) NULL,
 CONSTRAINT [PK__HistoryS__6845136FEF3C9F6F] PRIMARY KEY CLUSTERED 
(
	[IdHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 12-Mar-24 08:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[IdJob] [int] IDENTITY(1,1) NOT NULL,
	[NameJob] [nvarchar](max) NULL,
	[Salary] [nvarchar](50) NULL,
	[Status] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[Deadline] [date] NULL,
	[Describes] [nvarchar](max) NULL,
	[Requirements] [nvarchar](max) NULL,
	[Benefits] [nvarchar](max) NULL,
	[IdCategory] [nvarchar](20) NULL,
	[IdEmployer] [int] NULL,
	[Experience] [nvarchar](50) NULL,
	[TypeSalary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdJob] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoveJobs]    Script Date: 12-Mar-24 08:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoveJobs](
	[IdLove] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NULL,
	[IdJob] [int] NULL,
	[Status] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLove] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12-Mar-24 08:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Phone] [char](10) NULL,
	[Role] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Logo] [nvarchar](max) NULL,
	[Status] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([IdJob])
REFERENCES [dbo].[Jobs] ([IdJob])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[HistorySubmit]  WITH CHECK ADD  CONSTRAINT [FK__HistorySu__IdJob__5CD6CB2B] FOREIGN KEY([IdJob])
REFERENCES [dbo].[Jobs] ([IdJob])
GO
ALTER TABLE [dbo].[HistorySubmit] CHECK CONSTRAINT [FK__HistorySu__IdJob__5CD6CB2B]
GO
ALTER TABLE [dbo].[HistorySubmit]  WITH CHECK ADD  CONSTRAINT [FK__HistorySu__IdUse__5DCAEF64] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[HistorySubmit] CHECK CONSTRAINT [FK__HistorySu__IdUse__5DCAEF64]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD FOREIGN KEY([IdCategory])
REFERENCES [dbo].[CategoryJobs] ([IdCategory])
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD FOREIGN KEY([IdEmployer])
REFERENCES [dbo].[Employers] ([IdEmployer])
GO
ALTER TABLE [dbo].[LoveJobs]  WITH CHECK ADD FOREIGN KEY([IdJob])
REFERENCES [dbo].[Jobs] ([IdJob])
GO
ALTER TABLE [dbo].[LoveJobs]  WITH CHECK ADD FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO

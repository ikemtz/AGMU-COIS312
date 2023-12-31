USE [master]
GO
/****** Object:  Database [AGMU]    Script Date: 8/31/2023 6:56:58 PM ******/
CREATE DATABASE [AGMU]

GO
ALTER DATABASE [AGMU] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AGMU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AGMU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AGMU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AGMU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AGMU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AGMU] SET ARITHABORT OFF 
GO
ALTER DATABASE [AGMU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AGMU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AGMU] SET AUTO_UPDATE_STATISTICS OFF 
GO
ALTER DATABASE [AGMU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AGMU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AGMU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AGMU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AGMU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AGMU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AGMU] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AGMU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AGMU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AGMU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AGMU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AGMU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AGMU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AGMU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AGMU] SET RECOVERY FULL 
GO
ALTER DATABASE [AGMU] SET  MULTI_USER 
GO
ALTER DATABASE [AGMU] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [AGMU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AGMU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AGMU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AGMU] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AGMU] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AGMU', N'ON'
GO
ALTER DATABASE [AGMU] SET QUERY_STORE = ON
GO
ALTER DATABASE [AGMU] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AGMU]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 8/31/2023 6:56:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NULL,
	[CourseId] [int] NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/31/2023 6:56:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProgramId] [int] NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programs]    Script Date: 8/31/2023 6:56:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Programs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 8/31/2023 6:56:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[IsProfessor] [bit] NOT NULL,
	[IsDirector] [bit] NOT NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentClasses]    Script Date: 8/31/2023 6:56:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClasses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[Grade] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/31/2023 6:56:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] NOT NULL,
	[ProgramId] [int] NULL,
	[Name] [nvarchar](250) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([Id], [StaffId], [CourseId], [StartDate]) VALUES (2, 3, 1, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Classes] ([Id], [StaffId], [CourseId], [StartDate]) VALUES (3, 1, 2, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Classes] ([Id], [StaffId], [CourseId], [StartDate]) VALUES (4, 3, 1, CAST(N'2022-08-25' AS Date))
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [ProgramId], [Name]) VALUES (1, 2, N'COIS312')
INSERT [dbo].[Courses] ([Id], [ProgramId], [Name]) VALUES (2, 1, N'CYBS103')
INSERT [dbo].[Courses] ([Id], [ProgramId], [Name]) VALUES (4, 1, N'CYBS104')
INSERT [dbo].[Courses] ([Id], [ProgramId], [Name]) VALUES (5, 2, N'COIS216')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Programs] ON 

INSERT [dbo].[Programs] ([Id], [Name]) VALUES (1, N'Cybersecurity')
INSERT [dbo].[Programs] ([Id], [Name]) VALUES (2, N'Business Administration')
SET IDENTITY_INSERT [dbo].[Programs] OFF
GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([Id], [FullName], [IsProfessor], [IsDirector]) VALUES (1, N'Isaac Martinez', 1, 0)
INSERT [dbo].[Staffs] ([Id], [FullName], [IsProfessor], [IsDirector]) VALUES (2, N'Rosa Musi', 0, 1)
INSERT [dbo].[Staffs] ([Id], [FullName], [IsProfessor], [IsDirector]) VALUES (3, N'Luis Dominguez', 1, 0)
SET IDENTITY_INSERT [dbo].[Staffs] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentClasses] ON 

INSERT [dbo].[StudentClasses] ([Id], [StudentId], [ClassId], [Grade]) VALUES (1, 3, 2, N'A')
INSERT [dbo].[StudentClasses] ([Id], [StudentId], [ClassId], [Grade]) VALUES (2, 2, 2, NULL)
INSERT [dbo].[StudentClasses] ([Id], [StudentId], [ClassId], [Grade]) VALUES (4, 3, 4, N'A')
INSERT [dbo].[StudentClasses] ([Id], [StudentId], [ClassId], [Grade]) VALUES (6, 3, 3, N'A')
SET IDENTITY_INSERT [dbo].[StudentClasses] OFF
GO
INSERT [dbo].[Students] ([Id], [ProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (1, 1, N'asdfasdf', CAST(N'2020-01-05' AS Date), NULL)
INSERT [dbo].[Students] ([Id], [ProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (2, 2, N'Luis', CAST(N'2018-01-01' AS Date), NULL)
INSERT [dbo].[Students] ([Id], [ProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (3, 1, N'Gabriel', CAST(N'2010-01-05' AS Date), NULL)
INSERT [dbo].[Students] ([Id], [ProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (4, 2, N'Luis #2', CAST(N'2013-01-01' AS Date), NULL)
INSERT [dbo].[Students] ([Id], [ProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (5, 1, N'Gabriel #2', CAST(N'2010-01-05' AS Date), NULL)
GO
/****** Object:  Index [IX_StudentClasses]    Script Date: 8/31/2023 6:56:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StudentClasses] ON [dbo].[StudentClasses]
(
	[ClassId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staffs] ADD  CONSTRAINT [DF_Staffs_IsProfessor]  DEFAULT ((0)) FOR [IsProfessor]
GO
ALTER TABLE [dbo].[Staffs] ADD  CONSTRAINT [DF_Staffs_IsDirector]  DEFAULT ((0)) FOR [IsDirector]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_Staffs] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_Staffs]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Classes] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Courses_Classes]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Programs] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[Programs] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Programs]
GO
ALTER TABLE [dbo].[StudentClasses]  WITH CHECK ADD  CONSTRAINT [FK_StudentClasses_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[StudentClasses] CHECK CONSTRAINT [FK_StudentClasses_Classes]
GO
ALTER TABLE [dbo].[StudentClasses]  WITH CHECK ADD  CONSTRAINT [FK_StudentClasses_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[StudentClasses] CHECK CONSTRAINT [FK_StudentClasses_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Programs] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[Programs] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Programs]
GO
USE [master]
GO
ALTER DATABASE [AGMU] SET  READ_WRITE 
GO

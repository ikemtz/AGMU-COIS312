USE [AGMU]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 9/21/2023 9:50:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 9/21/2023 9:50:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AcademicProgramId] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programs]    Script Date: 9/21/2023 9:50:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Programs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 9/21/2023 9:50:56 PM ******/
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
/****** Object:  Table [dbo].[StudentClasses]    Script Date: 9/21/2023 9:50:56 PM ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 9/21/2023 9:50:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AcademicProgramId] [int] NULL,
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

INSERT [dbo].[Courses] ([Id], [AcademicProgramId], [Name]) VALUES (1, 2, N'COIS312')
INSERT [dbo].[Courses] ([Id], [AcademicProgramId], [Name]) VALUES (2, 1, N'CYBS103')
INSERT [dbo].[Courses] ([Id], [AcademicProgramId], [Name]) VALUES (4, 1, N'CYBS104')
INSERT [dbo].[Courses] ([Id], [AcademicProgramId], [Name]) VALUES (5, 2, N'COIS216')
INSERT [dbo].[Courses] ([Id], [AcademicProgramId], [Name]) VALUES (7, 3, N'NURS101')
INSERT [dbo].[Courses] ([Id], [AcademicProgramId], [Name]) VALUES (8, 3, N'NURS102')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Programs] ON 

INSERT [dbo].[Programs] ([Id], [Name]) VALUES (1, N'Cybersecurity')
INSERT [dbo].[Programs] ([Id], [Name]) VALUES (2, N'Business Administration')
INSERT [dbo].[Programs] ([Id], [Name]) VALUES (3, N'Nursing')
INSERT [dbo].[Programs] ([Id], [Name]) VALUES (4, N'Social Services')
SET IDENTITY_INSERT [dbo].[Programs] OFF
GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([Id], [FullName], [IsProfessor], [IsDirector]) VALUES (1, N'Isaac Martinez', 1, 0)
INSERT [dbo].[Staffs] ([Id], [FullName], [IsProfessor], [IsDirector]) VALUES (2, N'Rosa Musi', 0, 1)
INSERT [dbo].[Staffs] ([Id], [FullName], [IsProfessor], [IsDirector]) VALUES (3, N'Luis Dominguez', 0, 0)
SET IDENTITY_INSERT [dbo].[Staffs] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentClasses] ON 

INSERT [dbo].[StudentClasses] ([Id], [StudentId], [ClassId], [Grade]) VALUES (1, 3, 2, N'A')
INSERT [dbo].[StudentClasses] ([Id], [StudentId], [ClassId], [Grade]) VALUES (2, 2, 2, NULL)
INSERT [dbo].[StudentClasses] ([Id], [StudentId], [ClassId], [Grade]) VALUES (4, 3, 4, N'A')
INSERT [dbo].[StudentClasses] ([Id], [StudentId], [ClassId], [Grade]) VALUES (6, 3, 3, N'A')
INSERT [dbo].[StudentClasses] ([Id], [StudentId], [ClassId], [Grade]) VALUES (12, 4, 3, NULL)
INSERT [dbo].[StudentClasses] ([Id], [StudentId], [ClassId], [Grade]) VALUES (14, 4, 2, NULL)
SET IDENTITY_INSERT [dbo].[StudentClasses] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [AcademicProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (1, 1, N'asdfacsdf', CAST(N'2020-01-05' AS Date), NULL)
INSERT [dbo].[Students] ([Id], [AcademicProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (2, 3, N'Luis', CAST(N'2018-01-01' AS Date), NULL)
INSERT [dbo].[Students] ([Id], [AcademicProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (3, 1, N'Gabriel', CAST(N'2010-01-05' AS Date), NULL)
INSERT [dbo].[Students] ([Id], [AcademicProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (4, 4, N'Captain America', CAST(N'2013-01-01' AS Date), N'123 456 7812')
INSERT [dbo].[Students] ([Id], [AcademicProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (6, 2, N'Sancho Panza', CAST(N'2023-09-15' AS Date), N'704 123 4567')
INSERT [dbo].[Students] ([Id], [AcademicProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (7, 4, N'Lone Ranger', CAST(N'2000-02-14' AS Date), NULL)
INSERT [dbo].[Students] ([Id], [AcademicProgramId], [Name], [DateOfBirth], [PhoneNumber]) VALUES (8, 1, N'Isaac Martinez', CAST(N'2000-10-13' AS Date), N'732 123 1342')
SET IDENTITY_INSERT [dbo].[Students] OFF
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
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Programs] FOREIGN KEY([AcademicProgramId])
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
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Programs] FOREIGN KEY([AcademicProgramId])
REFERENCES [dbo].[Programs] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Programs]
GO

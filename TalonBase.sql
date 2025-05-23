USE [master]
GO
/****** Object:  Database [TalonBase]    Script Date: 29.04.2025 12:15:30 ******/
CREATE DATABASE [TalonBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TalonBase_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TalonBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TalonBase_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TalonBase.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TalonBase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TalonBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TalonBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TalonBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TalonBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TalonBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TalonBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TalonBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TalonBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TalonBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TalonBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TalonBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TalonBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TalonBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TalonBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TalonBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TalonBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TalonBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TalonBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TalonBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TalonBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TalonBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TalonBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TalonBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TalonBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TalonBase] SET  MULTI_USER 
GO
ALTER DATABASE [TalonBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TalonBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TalonBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TalonBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TalonBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TalonBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TalonBase] SET QUERY_STORE = ON
GO
ALTER DATABASE [TalonBase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TalonBase]
GO
/****** Object:  Table [dbo].[Business_Trip]    Script Date: 29.04.2025 12:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_Trip](
	[Id] [int] IDENTITY(6,1) NOT FOR REPLICATION NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Manager_Id] [int] NOT NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[Destination] [nvarchar](100) NOT NULL,
	[Purpose] [nvarchar](max) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Business_Trip] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 29.04.2025 12:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] NOT NULL,
	[Department_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eployee]    Script Date: 29.04.2025 12:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Full_Name] [nvarchar](100) NOT NULL,
	[Position] [nvarchar](100) NOT NULL,
	[Deportament_Id] [int] NOT NULL,
	[Contact_info] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Eployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Financial_Expense]    Script Date: 29.04.2025 12:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Financial_Expense](
	[Expense_Id] [int] NOT NULL,
	[Trip_Id] [int] NOT NULL,
	[Manager_Id] [int] NOT NULL,
	[Expense_type] [nvarchar](max) NOT NULL,
	[Amout] [money] NOT NULL,
	[Expense_Date] [date] NOT NULL,
 CONSTRAINT [PK_Financial_Expense] PRIMARY KEY CLUSTERED 
(
	[Expense_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 29.04.2025 12:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Full_Name] [nvarchar](100) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](15) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Business_Trip] ON 

INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (16, 1, 1, CAST(N'2025-04-10' AS Date), CAST(N'2025-04-27' AS Date), N'ВОКУТА', N'Отдохнуть', 1)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (25, 2, 0, CAST(N'2025-04-27' AS Date), CAST(N'2025-05-04' AS Date), N'Минск', N'Совещание ', 1)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (26, 2, 1, CAST(N'2025-04-25' AS Date), CAST(N'2025-04-30' AS Date), N'Самара', N'Тестирование', 1)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (88, 1, 0, CAST(N'2025-04-10' AS Date), CAST(N'2025-04-15' AS Date), N'Москва', N'Конференция', 1)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (89, 2, 1, CAST(N'2025-04-11' AS Date), CAST(N'2025-04-29' AS Date), N'Санкт-Петербург', N'Переговоры', 1)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (91, 4, 0, CAST(N'2025-04-13' AS Date), CAST(N'2025-04-28' AS Date), N'Казань', N'Командировка', 1)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (92, 5, 1, CAST(N'2025-04-14' AS Date), CAST(N'2025-04-22' AS Date), N'Екатеринбург', N'Встреча с партнёрами', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (93, 1, 11, CAST(N'2025-04-15' AS Date), CAST(N'2025-04-20' AS Date), N'Нижний Новгород', N'Семинар', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (94, 2, 0, CAST(N'2025-04-16' AS Date), CAST(N'2025-04-29' AS Date), N'Самара', N'Тренинг', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (95, 3, 1, CAST(N'2025-04-17' AS Date), CAST(N'2025-04-23' AS Date), N'Омск', N'Работа с клиентами', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (96, 4, 11, CAST(N'2025-04-18' AS Date), CAST(N'2025-04-26' AS Date), N'Челябинск', N'Аудит', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (97, 5, 0, CAST(N'2025-04-19' AS Date), CAST(N'2025-05-02' AS Date), N'Ростов-на-Дону', N'Сопровождение проекта', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (98, 1, 1, CAST(N'2025-04-20' AS Date), CAST(N'2025-05-02' AS Date), N'Уфа', N'Консультация', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (99, 2, 11, CAST(N'2025-04-21' AS Date), CAST(N'2025-05-06' AS Date), N'Красноярск', N'Разработка', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (100, 3, 0, CAST(N'2025-04-22' AS Date), CAST(N'2025-05-02' AS Date), N'Пермь', N'Проверка', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (101, 4, 1, CAST(N'2025-04-23' AS Date), CAST(N'2025-05-01' AS Date), N'Волгоград', N'Инспекция', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (102, 5, 11, CAST(N'2025-04-24' AS Date), CAST(N'2025-05-14' AS Date), N'Воронеж', N'Обсуждение', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (103, 1, 0, CAST(N'2025-04-10' AS Date), CAST(N'2025-04-25' AS Date), N'Саратов', N'Мониторинг', 1)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (104, 2, 1, CAST(N'2025-04-11' AS Date), CAST(N'2025-04-28' AS Date), N'Краснодар', N'Ведение проекта', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (105, 3, 11, CAST(N'2025-04-12' AS Date), CAST(N'2025-04-24' AS Date), N'Тольятти', N'Инновации', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (106, 4, 0, CAST(N'2025-04-13' AS Date), CAST(N'2025-04-22' AS Date), N'Ижевск', N'Консалтинг', 1)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (107, 5, 1, CAST(N'2025-04-14' AS Date), CAST(N'2025-04-22' AS Date), N'Барнаул', N'Развитие', 0)
INSERT [dbo].[Business_Trip] ([Id], [Employee_Id], [Manager_Id], [Start_Date], [End_Date], [Destination], [Purpose], [Status]) VALUES (108, 2, 0, CAST(N'2025-04-29' AS Date), CAST(N'2025-05-11' AS Date), N'Горный', N'Я ЗАКОНЧИЛ', 1)
SET IDENTITY_INSERT [dbo].[Business_Trip] OFF
GO
INSERT [dbo].[Department] ([Id], [Department_name]) VALUES (1, N'Отдел разработки ПО')
INSERT [dbo].[Department] ([Id], [Department_name]) VALUES (2, N'Отдел продаж')
INSERT [dbo].[Department] ([Id], [Department_name]) VALUES (3, N'Технический')
GO
SET IDENTITY_INSERT [dbo].[Eployee] ON 

INSERT [dbo].[Eployee] ([Id], [Full_Name], [Position], [Deportament_Id], [Contact_info]) VALUES (1, N'Серенков Владислав Алексеевич', N'Бухгалтер', 1, N'+7 (987) 654-32-10')
INSERT [dbo].[Eployee] ([Id], [Full_Name], [Position], [Deportament_Id], [Contact_info]) VALUES (2, N'Петров Моисей Альвианович', N'Ст.Специалист', 2, N'+7 (987) 654-32-10')
INSERT [dbo].[Eployee] ([Id], [Full_Name], [Position], [Deportament_Id], [Contact_info]) VALUES (3, N'Кузнецов Богдан Дамирович', N'Бухгалтер', 2, N'+7 (987) 654-32-10')
INSERT [dbo].[Eployee] ([Id], [Full_Name], [Position], [Deportament_Id], [Contact_info]) VALUES (4, N'Соколова Анна Дмитриевна', N'Менеджер по закупкам', 3, N'+7 (987) 654-32-10')
INSERT [dbo].[Eployee] ([Id], [Full_Name], [Position], [Deportament_Id], [Contact_info]) VALUES (5, N'Громов Павел Сергеевич', N'Начальник отдела кадров', 3, N'+7 (926) 123-45-67')
SET IDENTITY_INSERT [dbo].[Eployee] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([Id], [Full_Name], [Position], [Login], [Password], [Email]) VALUES (0, N'Соколова Анна Андреевна', N'Сотрудник', N'1', N'1', N'Immortal@mail.ru')
INSERT [dbo].[Manager] ([Id], [Full_Name], [Position], [Login], [Password], [Email]) VALUES (1, N'Цибко Виктор Васильевич', N'Администратор', N'Clime', N'123', N'123@mail.ru')
INSERT [dbo].[Manager] ([Id], [Full_Name], [Position], [Login], [Password], [Email]) VALUES (11, N'Щапова Анна Андреевна', N'Сотрудник', N'АняКотенок', N'123', N'AnnaCat@pingvin.ru')
INSERT [dbo].[Manager] ([Id], [Full_Name], [Position], [Login], [Password], [Email]) VALUES (12, N'Веренков Владислав Алексеевич', N'Руководитель', N'2', N'2', N'Ruc@mail.ru')
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
ALTER TABLE [dbo].[Business_Trip]  WITH CHECK ADD  CONSTRAINT [FK_Business_Trip_Eployee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Eployee] ([Id])
GO
ALTER TABLE [dbo].[Business_Trip] CHECK CONSTRAINT [FK_Business_Trip_Eployee]
GO
ALTER TABLE [dbo].[Business_Trip]  WITH CHECK ADD  CONSTRAINT [FK_Business_Trip_Manager] FOREIGN KEY([Manager_Id])
REFERENCES [dbo].[Manager] ([Id])
GO
ALTER TABLE [dbo].[Business_Trip] CHECK CONSTRAINT [FK_Business_Trip_Manager]
GO
ALTER TABLE [dbo].[Eployee]  WITH CHECK ADD  CONSTRAINT [FK_Eployee_Department] FOREIGN KEY([Deportament_Id])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Eployee] CHECK CONSTRAINT [FK_Eployee_Department]
GO
ALTER TABLE [dbo].[Financial_Expense]  WITH CHECK ADD  CONSTRAINT [FK_Financial_Expense_Business_Trip] FOREIGN KEY([Trip_Id])
REFERENCES [dbo].[Business_Trip] ([Id])
GO
ALTER TABLE [dbo].[Financial_Expense] CHECK CONSTRAINT [FK_Financial_Expense_Business_Trip]
GO
ALTER TABLE [dbo].[Financial_Expense]  WITH CHECK ADD  CONSTRAINT [FK_Financial_Expense_Manager] FOREIGN KEY([Manager_Id])
REFERENCES [dbo].[Manager] ([Id])
GO
ALTER TABLE [dbo].[Financial_Expense] CHECK CONSTRAINT [FK_Financial_Expense_Manager]
GO
USE [master]
GO
ALTER DATABASE [TalonBase] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [PaymentsBase]    Script Date: 03.05.2023 9:37:59 ******/
CREATE DATABASE [PaymentsBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Payment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Payment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Payment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Payment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PaymentsBase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PaymentsBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PaymentsBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PaymentsBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PaymentsBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PaymentsBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PaymentsBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [PaymentsBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PaymentsBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PaymentsBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PaymentsBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PaymentsBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PaymentsBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PaymentsBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PaymentsBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PaymentsBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PaymentsBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PaymentsBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PaymentsBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PaymentsBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PaymentsBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PaymentsBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PaymentsBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PaymentsBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PaymentsBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PaymentsBase] SET  MULTI_USER 
GO
ALTER DATABASE [PaymentsBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PaymentsBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PaymentsBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PaymentsBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PaymentsBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PaymentsBase] SET QUERY_STORE = OFF
GO
USE [PaymentsBase]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03.05.2023 9:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Icon] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 03.05.2023 9:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] NOT NULL,
	[UserId] [int] NULL,
	[CategoryId] [int] NULL,
	[Date] [date] NULL,
	[Name] [varchar](50) NULL,
	[Num] [int] NULL,
	[Price] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 03.05.2023 9:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[FIO] [varchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[PIN] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([ID], [Name], [Icon]) VALUES (1, N'Коммунальные услуги', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Icon]) VALUES (2, N'Автомобиль', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Icon]) VALUES (3, N'Питание и быт', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Icon]) VALUES (4, N'Медицина', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Icon]) VALUES (5, N'Разное', NULL)
GO
INSERT [dbo].[Payment] ([ID], [UserId], [CategoryId], [Date], [Name], [Num], [Price]) VALUES (1, 1, 1, CAST(N'2023-04-10' AS Date), N'оплата жилья', 1, CAST(4356.58 AS Decimal(10, 2)))
INSERT [dbo].[Payment] ([ID], [UserId], [CategoryId], [Date], [Name], [Num], [Price]) VALUES (2, 1, 2, CAST(N'2023-04-10' AS Date), N'бензин', 2, CAST(5499.00 AS Decimal(10, 2)))
INSERT [dbo].[Payment] ([ID], [UserId], [CategoryId], [Date], [Name], [Num], [Price]) VALUES (3, 1, 3, CAST(N'2023-04-10' AS Date), N'продукты', 3, CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[Payment] ([ID], [UserId], [CategoryId], [Date], [Name], [Num], [Price]) VALUES (4, 1, 4, CAST(N'2023-04-10' AS Date), N'лекарства', 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Payment] ([ID], [UserId], [CategoryId], [Date], [Name], [Num], [Price]) VALUES (5, 2, 5, CAST(N'2023-05-10' AS Date), N'бензин', 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Payment] ([ID], [UserId], [CategoryId], [Date], [Name], [Num], [Price]) VALUES (6, 4, 4, CAST(N'2023-05-10' AS Date), N'лекарства', 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Payment] ([ID], [UserId], [CategoryId], [Date], [Name], [Num], [Price]) VALUES (7, 3, 1, CAST(N'2023-06-10' AS Date), N'оплата за комунальные услуги', 1, CAST(8900.00 AS Decimal(10, 2)))
INSERT [dbo].[Payment] ([ID], [UserId], [CategoryId], [Date], [Name], [Num], [Price]) VALUES (8, 3, 2, CAST(N'2023-06-10' AS Date), N'замена диска', 2, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Payment] ([ID], [UserId], [CategoryId], [Date], [Name], [Num], [Price]) VALUES (9, 3, 3, CAST(N'2023-06-10' AS Date), N'ресторан', 3, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[Payment] ([ID], [UserId], [CategoryId], [Date], [Name], [Num], [Price]) VALUES (10, 3, 5, CAST(N'2023-06-10' AS Date), N'подарки родителям', 5, CAST(10000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[User] ([ID], [FIO], [Login], [Password], [PIN]) VALUES (1, N'Бойко Игорь Петрович', N'boiko-ip', N'12345', 12345)
INSERT [dbo].[User] ([ID], [FIO], [Login], [Password], [PIN]) VALUES (2, N'Василенка Василий Александрович', N'vasilenko-va', N'123456', 123456)
INSERT [dbo].[User] ([ID], [FIO], [Login], [Password], [PIN]) VALUES (3, N'Контеенко Дмитрий Семенович', N'konteenko-ds', N'1234567', 1234567)
INSERT [dbo].[User] ([ID], [FIO], [Login], [Password], [PIN]) VALUES (4, N'Лазарьков Петр Михайлович', N'lazarkov-pm', N'12345678', 12345678)
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Category]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_User]
GO
USE [master]
GO
ALTER DATABASE [PaymentsBase] SET  READ_WRITE 
GO

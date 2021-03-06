USE [master]
GO
/****** Object:  Database [PeopleAddressData]    Script Date: 09-Oct-15 9:18:01 PM ******/
CREATE DATABASE [PeopleAddressData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PeopleData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PeopleData.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PeopleData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PeopleData_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PeopleAddressData] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PeopleAddressData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PeopleAddressData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PeopleAddressData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PeopleAddressData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PeopleAddressData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PeopleAddressData] SET ARITHABORT OFF 
GO
ALTER DATABASE [PeopleAddressData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PeopleAddressData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PeopleAddressData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PeopleAddressData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PeopleAddressData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PeopleAddressData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PeopleAddressData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PeopleAddressData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PeopleAddressData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PeopleAddressData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PeopleAddressData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PeopleAddressData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PeopleAddressData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PeopleAddressData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PeopleAddressData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PeopleAddressData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PeopleAddressData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PeopleAddressData] SET RECOVERY FULL 
GO
ALTER DATABASE [PeopleAddressData] SET  MULTI_USER 
GO
ALTER DATABASE [PeopleAddressData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PeopleAddressData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PeopleAddressData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PeopleAddressData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PeopleAddressData] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PeopleAddressData', N'ON'
GO
USE [PeopleAddressData]
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 09-Oct-15 9:18:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address_text] [nvarchar](255) NOT NULL,
	[town_id] [int] NOT NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CONTINENT]    Script Date: 09-Oct-15 9:18:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTINENT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CONTINENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COUNTRY]    Script Date: 09-Oct-15 9:18:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRY](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 09-Oct-15 9:18:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[address_id] [bigint] NOT NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TOWN]    Script Date: 09-Oct-15 9:18:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOWN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_TOWN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ADDRESS] ON 

INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (1, N'acad Stefan Mladenov Str', 1)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (2, N'Africa Unity Square 1', 4)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (3, N'Queen Victoria Street 55', 2)
SET IDENTITY_INSERT [dbo].[ADDRESS] OFF
SET IDENTITY_INSERT [dbo].[CONTINENT] ON 

INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (1, N'Europe')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (2, N'Asia')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (3, N'Africa')
SET IDENTITY_INSERT [dbo].[CONTINENT] OFF
SET IDENTITY_INSERT [dbo].[COUNTRY] ON 

INSERT [dbo].[COUNTRY] ([id], [name], [country_id]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[COUNTRY] ([id], [name], [country_id]) VALUES (2, N'Zimbabwe', 3)
INSERT [dbo].[COUNTRY] ([id], [name], [country_id]) VALUES (3, N'Germany', 1)
INSERT [dbo].[COUNTRY] ([id], [name], [country_id]) VALUES (4, N'UK', 1)
SET IDENTITY_INSERT [dbo].[COUNTRY] OFF
SET IDENTITY_INSERT [dbo].[PERSON] ON 

INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (1, N'Ivan', N'Petrov', 2)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (2, N'Georgi', N'Dimitrov', 1)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (3, N'Maria', N'Ivanova', 3)
SET IDENTITY_INSERT [dbo].[PERSON] OFF
SET IDENTITY_INSERT [dbo].[TOWN] ON 

INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (2, N'London', 4)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (3, N'Munich', 3)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (4, N'Harare', 2)
SET IDENTITY_INSERT [dbo].[TOWN] OFF
ALTER TABLE [dbo].[ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESS_TOWN] FOREIGN KEY([town_id])
REFERENCES [dbo].[TOWN] ([id])
GO
ALTER TABLE [dbo].[ADDRESS] CHECK CONSTRAINT [FK_ADDRESS_TOWN]
GO
ALTER TABLE [dbo].[COUNTRY]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRY_CONTINENT] FOREIGN KEY([country_id])
REFERENCES [dbo].[CONTINENT] ([id])
GO
ALTER TABLE [dbo].[COUNTRY] CHECK CONSTRAINT [FK_COUNTRY_CONTINENT]
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_ADDRESS] FOREIGN KEY([address_id])
REFERENCES [dbo].[ADDRESS] ([id])
GO
ALTER TABLE [dbo].[PERSON] CHECK CONSTRAINT [FK_PERSON_ADDRESS]
GO
ALTER TABLE [dbo].[TOWN]  WITH CHECK ADD  CONSTRAINT [FK_TOWN_COUNTRY] FOREIGN KEY([country_id])
REFERENCES [dbo].[COUNTRY] ([id])
GO
ALTER TABLE [dbo].[TOWN] CHECK CONSTRAINT [FK_TOWN_COUNTRY]
GO
USE [master]
GO
ALTER DATABASE [PeopleAddressData] SET  READ_WRITE 
GO

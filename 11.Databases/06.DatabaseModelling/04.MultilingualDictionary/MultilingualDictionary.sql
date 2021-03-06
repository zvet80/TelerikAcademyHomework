USE [master]
GO
/****** Object:  Database [Multilingual Dictionary]    Script Date: 09-Oct-15 11:13:00 PM ******/
CREATE DATABASE [Multilingual Dictionary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Multilingual Dictionary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Multilingual Dictionary.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Multilingual Dictionary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Multilingual Dictionary_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Multilingual Dictionary] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Multilingual Dictionary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Multilingual Dictionary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET ARITHABORT OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Multilingual Dictionary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Multilingual Dictionary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Multilingual Dictionary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Multilingual Dictionary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET RECOVERY FULL 
GO
ALTER DATABASE [Multilingual Dictionary] SET  MULTI_USER 
GO
ALTER DATABASE [Multilingual Dictionary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Multilingual Dictionary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Multilingual Dictionary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Multilingual Dictionary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Multilingual Dictionary] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Multilingual Dictionary', N'ON'
GO
USE [Multilingual Dictionary]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 09-Oct-15 11:13:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Synonyms]    Script Date: 09-Oct-15 11:13:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Synonyms](
	[WordId] [int] NOT NULL,
	[SynonymId] [int] NOT NULL,
 CONSTRAINT [PK_Synonyms] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC,
	[SynonymId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Translations]    Script Date: 09-Oct-15 11:13:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translations](
	[WordId] [int] NOT NULL,
	[TranslationId] [int] NOT NULL,
 CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC,
	[TranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words]    Script Date: 09-Oct-15 11:13:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[Id] [int] NOT NULL,
	[Word] [nvarchar](50) NOT NULL,
	[Explanation] [nvarchar](50) NOT NULL,
	[LanguageId] [int] NOT NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Synonyms_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[Synonyms] CHECK CONSTRAINT [FK_Synonyms_Words]
GO
ALTER TABLE [dbo].[Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Synonyms_Words1] FOREIGN KEY([SynonymId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[Synonyms] CHECK CONSTRAINT [FK_Synonyms_Words1]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Words]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Words2] FOREIGN KEY([TranslationId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Words2]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Languages]
GO
USE [master]
GO
ALTER DATABASE [Multilingual Dictionary] SET  READ_WRITE 
GO

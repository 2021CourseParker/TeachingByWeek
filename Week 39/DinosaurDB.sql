USE [master]
GO
/****** Object:  Database [Advanture_of_Dinosaur_db]    Script Date: 5/21/2022 3:24:13 PM ******/
CREATE DATABASE [Advanture_of_Dinosaur_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Advanture_of_Dinosaur_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Advanture_of_Dinosaur_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Advanture_of_Dinosaur_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Advanture_of_Dinosaur_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Advanture_of_Dinosaur_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET RECOVERY FULL 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET  MULTI_USER 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Advanture_of_Dinosaur_db', N'ON'
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET QUERY_STORE = OFF
GO
USE [Advanture_of_Dinosaur_db]
GO
/****** Object:  Table [dbo].[DifficultyLevelRules]    Script Date: 5/21/2022 3:24:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DifficultyLevelRules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Speed] [int] NOT NULL,
	[Obstacle] [int] NOT NULL,
 CONSTRAINT [PK_DifficultyLevelRules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DifficultyLevels]    Script Date: 5/21/2022 3:24:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DifficultyLevels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [varchar](50) NOT NULL,
	[LevelRuleId] [int] NULL,
 CONSTRAINT [PK_DifficultyLevels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 5/21/2022 3:24:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Records]    Script Date: 5/21/2022 3:24:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Records](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[DifficultyLevelID] [int] NOT NULL,
	[Point] [int] NULL,
 CONSTRAINT [PK_Records] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_Records_DifficultyLevelId] FOREIGN KEY([DifficultyLevelID])
REFERENCES [dbo].[DifficultyLevels] ([ID])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_Records_DifficultyLevelId]
GO
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_Records_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Players] ([ID])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_Records_PlayerID]
GO
USE [master]
GO
ALTER DATABASE [Advanture_of_Dinosaur_db] SET  READ_WRITE 
GO

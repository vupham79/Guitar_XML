USE [master]
GO
/****** Object:  Database [Instruments]    Script Date: 10/05/2019 18:50:27 ******/
CREATE DATABASE [Instruments] ON  PRIMARY 
( NAME = N'Appropriate_Instrument', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Appropriate_Instrument.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Appropriate_Instrument_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Appropriate_Instrument_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Instruments] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Instruments].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Instruments] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Instruments] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Instruments] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Instruments] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Instruments] SET ARITHABORT OFF
GO
ALTER DATABASE [Instruments] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Instruments] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Instruments] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Instruments] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Instruments] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Instruments] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Instruments] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Instruments] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Instruments] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Instruments] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Instruments] SET  DISABLE_BROKER
GO
ALTER DATABASE [Instruments] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Instruments] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Instruments] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Instruments] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Instruments] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Instruments] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Instruments] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Instruments] SET  READ_WRITE
GO
ALTER DATABASE [Instruments] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Instruments] SET  MULTI_USER
GO
ALTER DATABASE [Instruments] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Instruments] SET DB_CHAINING OFF
GO
USE [Instruments]
GO
/****** Object:  User [vupham]    Script Date: 10/05/2019 18:50:27 ******/
CREATE USER [vupham] FOR LOGIN [vupham] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT SERVICE\MSSQLSERVER]    Script Date: 10/05/2019 18:50:27 ******/
CREATE USER [NT SERVICE\MSSQLSERVER] FOR LOGIN [NT SERVICE\MSSQLSERVER]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 10/05/2019 18:50:27 ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DESKTOP-OBAU54U\VuPH]    Script Date: 10/05/2019 18:50:27 ******/
CREATE USER [DESKTOP-OBAU54U\VuPH] FOR LOGIN [DESKTOP-OBAU54U\VuPH] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 10/05/2019 18:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 10/05/2019 18:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[fullname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStore]    Script Date: 10/05/2019 18:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStore](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[logo] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInstrument]    Script Date: 10/05/2019 18:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInstrument](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[url] [nvarchar](100) NOT NULL,
	[imageUrl] [nvarchar](100) NULL,
	[cateId] [int] NULL,
	[storeId] [int] NULL,
	[click] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_tblInstrument_tblCategory]    Script Date: 10/05/2019 18:50:28 ******/
ALTER TABLE [dbo].[tblInstrument]  WITH CHECK ADD  CONSTRAINT [FK_tblInstrument_tblCategory] FOREIGN KEY([cateId])
REFERENCES [dbo].[tblCategory] ([id])
GO
ALTER TABLE [dbo].[tblInstrument] CHECK CONSTRAINT [FK_tblInstrument_tblCategory]
GO
/****** Object:  ForeignKey [FK_tblInstrument_tblStore]    Script Date: 10/05/2019 18:50:28 ******/
ALTER TABLE [dbo].[tblInstrument]  WITH CHECK ADD  CONSTRAINT [FK_tblInstrument_tblStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[tblStore] ([id])
GO
ALTER TABLE [dbo].[tblInstrument] CHECK CONSTRAINT [FK_tblInstrument_tblStore]
GO

USE [master]
GO
/****** Object:  Database [shoppingdb]    Script Date: 07-04-2019 12.36.29 PM ******/
CREATE DATABASE [shoppingdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shoppingdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\shoppingdb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'shoppingdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\shoppingdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [shoppingdb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shoppingdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shoppingdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shoppingdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shoppingdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shoppingdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shoppingdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [shoppingdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shoppingdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shoppingdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shoppingdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shoppingdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shoppingdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shoppingdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shoppingdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shoppingdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shoppingdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shoppingdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shoppingdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shoppingdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shoppingdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shoppingdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shoppingdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shoppingdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shoppingdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shoppingdb] SET  MULTI_USER 
GO
ALTER DATABASE [shoppingdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shoppingdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shoppingdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shoppingdb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [shoppingdb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [shoppingdb]
GO
/****** Object:  Table [dbo].[tbladmin]    Script Date: 07-04-2019 12.36.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbladmin](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_tbladmin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblcat]    Script Date: 07-04-2019 12.36.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblcat](
	[cat_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[cat_name] [varchar](50) NULL,
	[cat_desc] [varchar](max) NULL,
 CONSTRAINT [PK_tblcat] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblproduct]    Script Date: 07-04-2019 12.36.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblproduct](
	[p_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[p_name] [varchar](max) NOT NULL,
	[p_price] [numeric](18, 2) NOT NULL,
	[p_qty] [int] NOT NULL,
	[cat_id] [numeric](18, 0) NOT NULL,
	[subcat_id] [numeric](18, 0) NOT NULL,
	[p_desc] [varchar](max) NOT NULL,
	[p_img_original] [varchar](max) NOT NULL,
	[p_img1] [varchar](max) NOT NULL,
	[p_img2] [varchar](max) NOT NULL,
	[p_status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblproduct] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblsubcat]    Script Date: 07-04-2019 12.36.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblsubcat](
	[subcat_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[subcat_name] [varchar](max) NOT NULL,
	[cat_id] [numeric](18, 0) NOT NULL,
	[subcat_desc] [varchar](max) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblsubcat] PRIMARY KEY CLUSTERED 
(
	[subcat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbladmin] ON 

INSERT [dbo].[tbladmin] ([id], [username], [password]) VALUES (CAST(1 AS Numeric(18, 0)), N'Admin', N'admin')
SET IDENTITY_INSERT [dbo].[tbladmin] OFF
SET IDENTITY_INSERT [dbo].[tblcat] ON 

INSERT [dbo].[tblcat] ([cat_id], [cat_name], [cat_desc]) VALUES (CAST(1 AS Numeric(18, 0)), N'shop', NULL)
INSERT [dbo].[tblcat] ([cat_id], [cat_name], [cat_desc]) VALUES (CAST(2 AS Numeric(18, 0)), N'Tshart', NULL)
INSERT [dbo].[tblcat] ([cat_id], [cat_name], [cat_desc]) VALUES (CAST(3 AS Numeric(18, 0)), N'mobile', NULL)
SET IDENTITY_INSERT [dbo].[tblcat] OFF
USE [master]
GO
ALTER DATABASE [shoppingdb] SET  READ_WRITE 
GO

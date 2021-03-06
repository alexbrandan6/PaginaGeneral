USE [master]
GO
/****** Object:  Database [Web_General]    Script Date: 23/1/2022 17:32:07 ******/
CREATE DATABASE [Web_General]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web_General', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Web_General.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Web_General_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Web_General_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Web_General] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web_General].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web_General] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web_General] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web_General] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web_General] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web_General] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web_General] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Web_General] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web_General] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web_General] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web_General] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web_General] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web_General] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web_General] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web_General] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web_General] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Web_General] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web_General] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web_General] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web_General] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web_General] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web_General] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Web_General] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web_General] SET RECOVERY FULL 
GO
ALTER DATABASE [Web_General] SET  MULTI_USER 
GO
ALTER DATABASE [Web_General] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web_General] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web_General] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web_General] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Web_General] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Web_General] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Web_General', N'ON'
GO
ALTER DATABASE [Web_General] SET QUERY_STORE = OFF
GO
USE [Web_General]
GO
/****** Object:  Table [dbo].[tblDescripciones]    Script Date: 23/1/2022 17:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDescripciones](
	[Descripcion] [varchar](500) NULL,
	[idSeccion] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSecciones]    Script Date: 23/1/2022 17:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSecciones](
	[idSeccion] [int] NULL,
	[Descripcion] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSysUsuarios]    Script Date: 23/1/2022 17:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSysUsuarios](
	[NombreUsuario] [varchar](50) NULL,
	[Contra] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTitulos]    Script Date: 23/1/2022 17:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTitulos](
	[Titulo] [varchar](50) NULL,
	[idSeccion] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tblDescripciones] ([Descripcion], [idSeccion]) VALUES (N'Testeo de descripcion banner', 1)
GO
INSERT [dbo].[tblSecciones] ([idSeccion], [Descripcion]) VALUES (1, N'Banner')
GO
INSERT [dbo].[tblSysUsuarios] ([NombreUsuario], [Contra]) VALUES (N'test', N'1234')
GO
INSERT [dbo].[tblTitulos] ([Titulo], [idSeccion]) VALUES (N'Bienvenidos', 1)
GO
/****** Object:  StoredProcedure [dbo].[SP_SYS_Usuario_Logear]    Script Date: 23/1/2022 17:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_SYS_Usuario_Logear]
(
@NombreUsuario varchar(50),
@Contra varchar(50)
)
as
IF @NombreUsuario IN (SELECT NombreUsuario FROM tblSysUsuarios WHERE NombreUsuario = @NombreUsuario AND Contra = @Contra) BEGIN
	SELECT 'OK' AS msj
END
ELSE BEGIN
	SELECT 'Nombre de usuario o contraseña incorrectos' msj
END
GO
USE [master]
GO
ALTER DATABASE [Web_General] SET  READ_WRITE 
GO

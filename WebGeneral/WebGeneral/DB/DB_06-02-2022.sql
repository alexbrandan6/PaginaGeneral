USE [master]
GO
/****** Object:  Database [Web_General]    Script Date: 6/2/2022 20:22:57 ******/
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
/****** Object:  Table [dbo].[tblBanner]    Script Date: 6/2/2022 20:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBanner](
	[idBanner] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[Descripcion] [varchar](300) NULL,
	[Imagen] [varchar](300) NULL,
	[Estado] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstados]    Script Date: 6/2/2022 20:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstados](
	[idEstado] [tinyint] NULL,
	[Descripcion] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSysUsuarios]    Script Date: 6/2/2022 20:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSysUsuarios](
	[NombreUsuario] [varchar](50) NULL,
	[Contra] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblBanner] ON 

INSERT [dbo].[tblBanner] ([idBanner], [Titulo], [Descripcion], [Imagen], [Estado]) VALUES (1, N'titulo ejemplo WBO', N'descripción ejemplo WBO', N'D:\Users\Alex\Documents\GitHub\PaginaGeneral\WebGeneral\WebGeneral\img\banners\bannerTest.png', 1)
SET IDENTITY_INSERT [dbo].[tblBanner] OFF
GO
INSERT [dbo].[tblEstados] ([idEstado], [Descripcion]) VALUES (1, N'ACTIVO')
INSERT [dbo].[tblEstados] ([idEstado], [Descripcion]) VALUES (2, N'INACTIVO')
GO
INSERT [dbo].[tblSysUsuarios] ([NombreUsuario], [Contra]) VALUES (N'test', N'1234')
GO
/****** Object:  StoredProcedure [dbo].[SP_Banner_Actualizar]    Script Date: 6/2/2022 20:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_Banner_Actualizar]
(
@idBanner int,
@Titulo varchar(50),
@Descripcion varchar(300),
@Imagen varchar(300),
@Estado tinyint,
@withFile tinyint
)
as
IF(SELECT COUNT(*) FROM tblBanner WHERE idBanner = @idBanner) > 0
BEGIN

	IF @withFile = '1'
	BEGIN
		IF @Estado = 1
		BEGIN
			UPDATE tblBanner SET Estado = 2
		END

		UPDATE tblBanner SET Titulo = @Titulo, Descripcion = @Descripcion, Imagen = @Imagen, Estado = @Estado
		WHERE idBanner = @idBanner
		SELECT 'Banner actualizado.' AS msj
	END
	ELSE
	BEGIN
		IF @Estado = 1
		BEGIN
			UPDATE tblBanner SET Estado = 2
		END

		UPDATE tblBanner SET Titulo = @Titulo, Descripcion = @Descripcion, Estado = @Estado
		WHERE idBanner = @idBanner
		SELECT 'Banner actualizado.' AS msj
	END
END
ELSE
BEGIN
	SELECT 'Error. No hay banner con numero de identificación ingresado.' AS msj
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Banner_Guardar]    Script Date: 6/2/2022 20:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Banner_Guardar]
(
@Titulo varchar(50),
@Descripcion varchar(300),
@Imagen varchar(300),
@Estado tinyint
)
as
IF(SELECT COUNT(*) FROM tblBanner WHERE Estado = 1) > 0
BEGIN
	INSERT INTO tblBanner(Titulo, Descripcion, Imagen, Estado)
	VALUES (@Titulo, @Descripcion, @Imagen, 2)
	SELECT 'Banner guardado. El estado estará desactivado debido a que existe un banner activado.' AS msj
END
ELSE
BEGIN
	INSERT INTO tblBanner(Titulo, Descripcion, Imagen, Estado)
	VALUES (@Titulo, @Descripcion, @Imagen, @Estado)
	SELECT 'Banner guardado' AS msj
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Banner_Inactivar]    Script Date: 6/2/2022 20:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_Banner_Inactivar]
(
@idBanner int
)
as
IF (SELECT COUNT(*) FROM tblBanner WHERE idBanner = @idBanner) > 0
BEGIN
	UPDATE tblBanner SET Estado = 2 WHERE idBanner = @idBanner
	SELECT 'Banner inactivado' AS msj
END
ELSE
BEGIN
	SELECT 'Error, no existe banner' AS msj
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Banner_Obtener_Activo]    Script Date: 6/2/2022 20:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_Banner_Obtener_Activo]
as
SELECT a.idBanner, a.Titulo, a.Descripcion, a.Imagen, b.Descripcion AS Estado FROM tblBanner a
INNER JOIN tblEstados b
ON a.Estado = b.idEstado
WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Banner_Obtener_Id]    Script Date: 6/2/2022 20:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Banner_Obtener_Id]
(
@idBanner int
)
as
SELECT * FROM tblBanner WHERE idBanner = @idBanner
GO
/****** Object:  StoredProcedure [dbo].[SP_Banner_Obtener_Todos]    Script Date: 6/2/2022 20:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Banner_Obtener_Todos]
as
SELECT a.idBanner, a.Titulo, a.Descripcion, a.Imagen, b.Descripcion AS Estado FROM tblBanner a
INNER JOIN tblEstados b
ON a.Estado = b.idEstado
GO
/****** Object:  StoredProcedure [dbo].[SP_SYS_Usuario_Logear]    Script Date: 6/2/2022 20:22:57 ******/
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

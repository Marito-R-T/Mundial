USE [master]
GO
/****** Object:  Database [Mundial]    Script Date: 18/05/2022 23:02:57 ******/
CREATE DATABASE [Mundial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mundial', FILENAME = N'F:\InstalledPrograms\SQLServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\Mundial.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Mundial_log', FILENAME = N'F:\InstalledPrograms\SQLServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\Mundial_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Mundial] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mundial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mundial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mundial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mundial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mundial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mundial] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mundial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mundial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mundial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mundial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mundial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mundial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mundial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mundial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mundial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mundial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mundial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mundial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mundial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mundial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mundial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mundial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mundial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mundial] SET RECOVERY FULL 
GO
ALTER DATABASE [Mundial] SET  MULTI_USER 
GO
ALTER DATABASE [Mundial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mundial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mundial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mundial] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mundial] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Mundial] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Mundial', N'ON'
GO
ALTER DATABASE [Mundial] SET QUERY_STORE = OFF
GO
USE [Mundial]
GO
/****** Object:  Table [dbo].[Dim_Equipo]    Script Date: 18/05/2022 23:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Equipo](
	[id_equipo] [bigint] NOT NULL,
	[equipo] [nchar](50) NOT NULL,
	[DT] [nchar](70) NOT NULL,
	[año] [int] NOT NULL,
	[seleccion] [int] NOT NULL,
	[partidos_jugados] [int] NOT NULL,
	[goles_favor] [int] NOT NULL,
	[goles_contra] [int] NOT NULL,
	[amarillas] [int] NOT NULL,
	[rojas_directas] [int] NOT NULL,
	[abreviatura] [nchar](5) NULL,
	[confederacion] [nchar](10) NOT NULL,
	[grupo] [char](1) NULL,
	[es_local] [bit] NULL,
	[id_mundial] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Equipo] PRIMARY KEY CLUSTERED 
(
	[id_equipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Jugador]    Script Date: 18/05/2022 23:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Jugador](
	[id_jugador] [bigint] NOT NULL,
	[nombre] [nchar](70) NOT NULL,
	[posicion] [nchar](20) NOT NULL,
	[edad] [smallint] NULL,
	[pj] [smallint] NULL,
	[equipo] [bigint] NOT NULL,
	[club] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_Jugador] PRIMARY KEY CLUSTERED 
(
	[id_jugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Mundial]    Script Date: 18/05/2022 23:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Mundial](
	[id_mundial] [int] NOT NULL,
	[cede] [nchar](50) NULL,
	[año] [int] NULL,
	[participantes] [int] NULL,
	[participantes_fase_final] [int] NULL,
	[participantes_penales] [int] NULL,
	[penales_marcados] [int] NULL,
	[penales_lanzados] [int] NULL,
	[id_seleccion_campeon] [int] NULL,
 CONSTRAINT [PK_Dim_Mundial] PRIMARY KEY CLUSTERED 
(
	[id_mundial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Partido]    Script Date: 18/05/2022 23:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Partido](
	[id_partido] [bigint] NOT NULL,
	[id_tiempo_partido] [bigint] NOT NULL,
	[id_equipo1] [bigint] NOT NULL,
	[id_equipo2] [bigint] NOT NULL,
	[goles_equipo2] [int] NOT NULL,
	[fase] [nchar](15) NOT NULL,
	[grupo] [nchar](1) NULL,
	[penales_anotados_equipo1] [int] NULL,
	[penales_anotados_equipo2] [int] NULL,
	[penales_fallados_equipo1] [int] NULL,
	[penales_fallados_equipo2] [int] NULL,
	[goles_equipo1] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Partido] PRIMARY KEY CLUSTERED 
(
	[id_partido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Seleccion]    Script Date: 18/05/2022 23:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Seleccion](
	[id_seleccion] [int] NOT NULL,
	[nombre] [nchar](50) NULL,
	[mundiales] [int] NULL,
	[campeon] [int] NULL,
	[pts] [int] NULL,
	[partidos_jugados] [int] NULL,
	[ganados] [int] NULL,
	[empatados] [int] NULL,
	[perdidos] [int] NULL,
	[goles_favor] [int] NULL,
	[goles_contra] [int] NULL,
	[dif] [int] NULL,
 CONSTRAINT [PK_Dim_Seleccion] PRIMARY KEY CLUSTERED 
(
	[id_seleccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Tiempo_Gol]    Script Date: 18/05/2022 23:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Tiempo_Gol](
	[id_tiempo] [bigint] NOT NULL,
	[minuto] [int] NOT NULL,
	[agregado] [int] NULL,
	[tiempo_extra] [bit] NOT NULL,
	[es_penal] [bit] NOT NULL,
	[numero_penal] [int] NULL,
 CONSTRAINT [PK_Dim_Tiempo_Gol] PRIMARY KEY CLUSTERED 
(
	[id_tiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Tiempo_Partido]    Script Date: 18/05/2022 23:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Tiempo_Partido](
	[id_tiempo_partido] [bigint] NOT NULL,
	[año] [int] NOT NULL,
	[dia] [smallint] NOT NULL,
	[dia_semana] [nchar](10) NOT NULL,
	[mes] [smallint] NOT NULL,
	[fecha_equivalente] [date] NOT NULL,
 CONSTRAINT [PK_Dim_Tiempo_Partido] PRIMARY KEY CLUSTERED 
(
	[id_tiempo_partido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Gol]    Script Date: 18/05/2022 23:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Gol](
	[id_partido] [bigint] NOT NULL,
	[id_equipo] [bigint] NOT NULL,
	[id_jugador] [bigint] NOT NULL,
	[id_tiempo] [bigint] NOT NULL,
	[esPenal] [bit] NOT NULL,
	[portero] [nchar](25) NULL,
	[esAutogol] [bit] NOT NULL,
 CONSTRAINT [PK_Fact_Gol] PRIMARY KEY CLUSTERED 
(
	[id_partido] ASC,
	[id_equipo] ASC,
	[id_jugador] ASC,
	[id_tiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Equipo]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Equipo_Dim_Mundial] FOREIGN KEY([id_mundial])
REFERENCES [dbo].[Dim_Mundial] ([id_mundial])
GO
ALTER TABLE [dbo].[Dim_Equipo] CHECK CONSTRAINT [FK_Dim_Equipo_Dim_Mundial]
GO
ALTER TABLE [dbo].[Dim_Equipo]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Equipo_Dim_Seleccion] FOREIGN KEY([seleccion])
REFERENCES [dbo].[Dim_Seleccion] ([id_seleccion])
GO
ALTER TABLE [dbo].[Dim_Equipo] CHECK CONSTRAINT [FK_Dim_Equipo_Dim_Seleccion]
GO
ALTER TABLE [dbo].[Dim_Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Jugador_Dim_Equipo] FOREIGN KEY([equipo])
REFERENCES [dbo].[Dim_Equipo] ([id_equipo])
GO
ALTER TABLE [dbo].[Dim_Jugador] CHECK CONSTRAINT [FK_Dim_Jugador_Dim_Equipo]
GO
ALTER TABLE [dbo].[Dim_Mundial]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Mundial_Dim_Seleccion] FOREIGN KEY([id_seleccion_campeon])
REFERENCES [dbo].[Dim_Seleccion] ([id_seleccion])
GO
ALTER TABLE [dbo].[Dim_Mundial] CHECK CONSTRAINT [FK_Dim_Mundial_Dim_Seleccion]
GO
ALTER TABLE [dbo].[Dim_Partido]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Partido_Dim_Equipo] FOREIGN KEY([id_equipo1])
REFERENCES [dbo].[Dim_Equipo] ([id_equipo])
GO
ALTER TABLE [dbo].[Dim_Partido] CHECK CONSTRAINT [FK_Dim_Partido_Dim_Equipo]
GO
ALTER TABLE [dbo].[Dim_Partido]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Partido_Dim_Equipo1] FOREIGN KEY([id_equipo2])
REFERENCES [dbo].[Dim_Equipo] ([id_equipo])
GO
ALTER TABLE [dbo].[Dim_Partido] CHECK CONSTRAINT [FK_Dim_Partido_Dim_Equipo1]
GO
ALTER TABLE [dbo].[Dim_Partido]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Partido_Dim_Tiempo_Partido] FOREIGN KEY([id_tiempo_partido])
REFERENCES [dbo].[Dim_Tiempo_Partido] ([id_tiempo_partido])
GO
ALTER TABLE [dbo].[Dim_Partido] CHECK CONSTRAINT [FK_Dim_Partido_Dim_Tiempo_Partido]
GO
ALTER TABLE [dbo].[Fact_Gol]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Gol_Dim_Equipo] FOREIGN KEY([id_equipo])
REFERENCES [dbo].[Dim_Equipo] ([id_equipo])
GO
ALTER TABLE [dbo].[Fact_Gol] CHECK CONSTRAINT [FK_Fact_Gol_Dim_Equipo]
GO
ALTER TABLE [dbo].[Fact_Gol]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Gol_Dim_Jugador] FOREIGN KEY([id_jugador])
REFERENCES [dbo].[Dim_Jugador] ([id_jugador])
GO
ALTER TABLE [dbo].[Fact_Gol] CHECK CONSTRAINT [FK_Fact_Gol_Dim_Jugador]
GO
ALTER TABLE [dbo].[Fact_Gol]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Gol_Dim_Partido] FOREIGN KEY([id_partido])
REFERENCES [dbo].[Dim_Partido] ([id_partido])
GO
ALTER TABLE [dbo].[Fact_Gol] CHECK CONSTRAINT [FK_Fact_Gol_Dim_Partido]
GO
ALTER TABLE [dbo].[Fact_Gol]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Gol_Dim_Tiempo_Gol] FOREIGN KEY([id_tiempo])
REFERENCES [dbo].[Dim_Tiempo_Gol] ([id_tiempo])
GO
ALTER TABLE [dbo].[Fact_Gol] CHECK CONSTRAINT [FK_Fact_Gol_Dim_Tiempo_Gol]
GO
USE [master]
GO
ALTER DATABASE [Mundial] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [proyecto_academico]    Script Date: 5/7/2023 20:46:48 ******/
CREATE DATABASE [proyecto_academico]
 CONTAINMENT = NONE
GO
ALTER DATABASE [proyecto_academico] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyecto_academico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyecto_academico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyecto_academico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyecto_academico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyecto_academico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyecto_academico] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyecto_academico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proyecto_academico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyecto_academico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyecto_academico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyecto_academico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyecto_academico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyecto_academico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyecto_academico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyecto_academico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyecto_academico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [proyecto_academico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyecto_academico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyecto_academico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyecto_academico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyecto_academico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyecto_academico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyecto_academico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyecto_academico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [proyecto_academico] SET  MULTI_USER 
GO
ALTER DATABASE [proyecto_academico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyecto_academico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyecto_academico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyecto_academico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyecto_academico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [proyecto_academico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [proyecto_academico] SET QUERY_STORE = OFF
GO
USE [proyecto_academico]
GO
/****** Object:  Table [dbo].[clase]    Script Date: 5/7/2023 20:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clase](
	[Clase_ID] [int] NOT NULL,
	[Division_ID] [int] NOT NULL,
	[Materia_ID] [varchar](50) NOT NULL,
	[Profesor_ID] [varchar](50) NOT NULL,
	[Fecha_Comienzo] [date] NOT NULL,
	[Fecha_Final] [date] NULL,
 CONSTRAINT [PK_clase] PRIMARY KEY CLUSTERED 
(
	[Clase_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[division]    Script Date: 5/7/2023 20:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[division](
	[Division_ID] [int] NOT NULL,
	[Anio_Escolar] [int] NOT NULL,
	[Division_Escolar] [int] NOT NULL,
	[Turno] [varchar](50) NOT NULL,
 CONSTRAINT [PK_division] PRIMARY KEY CLUSTERED 
(
	[Division_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[division_de_alumnos]    Script Date: 5/7/2023 20:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[division_de_alumnos](
	[DivisionDA_ID] [int] NOT NULL,
	[DNI_Alumno] [int] NOT NULL,
	[Division_ID] [int] NOT NULL,
	[Anio_Calendario] [int] NOT NULL,
 CONSTRAINT [PK_division_de_alumnos] PRIMARY KEY CLUSTERED 
(
	[DivisionDA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ejemplo]    Script Date: 5/7/2023 20:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ejemplo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluaciones]    Script Date: 5/7/2023 20:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluaciones](
	[Evaluacion_ID] [int] NOT NULL,
	[Clase_ID] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Detalles] [varchar](50) NOT NULL,
 CONSTRAINT [PK_evaluaciones] PRIMARY KEY CLUSTERED 
(
	[Evaluacion_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faltas]    Script Date: 5/7/2023 20:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faltas](
	[Falta_ID] [int] NOT NULL,
	[DNI_Alumno] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Tipo] [decimal](10, 1) NOT NULL,
	[jutificada] [tinyint] NOT NULL,
 CONSTRAINT [PK_faltas] PRIMARY KEY CLUSTERED 
(
	[Falta_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materia]    Script Date: 5/7/2023 20:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materia](
	[Materia_ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Anio_escolar] [int] NOT NULL,
	[Horas_Semanales] [int] NOT NULL,
 CONSTRAINT [PK_materia] PRIMARY KEY CLUSTERED 
(
	[Materia_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notas]    Script Date: 5/7/2023 20:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notas](
	[Notas_ID] [int] NOT NULL,
	[Nota] [decimal](10, 2) NOT NULL,
	[DNI_Alumno] [int] NOT NULL,
	[Evaluacion_ID] [int] NOT NULL,
 CONSTRAINT [PK_notas] PRIMARY KEY CLUSTERED 
(
	[Notas_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 5/7/2023 20:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[DNI] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Contrasena] [varchar](50) NULL,
	[Nivel] [int] NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (1, 1, N'1', N'26911147', CAST(N'2023-03-22' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (2, 1, N'5', N'36073248', CAST(N'2023-03-22' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (3, 1, N'14', N'330617946', CAST(N'2023-03-15' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (4, 1, N'4', N'40321542', CAST(N'2023-03-16' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (5, 1, N'7', N'26911147', CAST(N'2023-03-22' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (6, 1, N'12', N'40321542', CAST(N'2023-03-30' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (7, 1, N'7', N'44879840', CAST(N'2023-03-29' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (8, 5, N'8', N'44879840', CAST(N'2023-04-03' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (9, 5, N'3', N'45843469', CAST(N'2023-03-06' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (10, 5, N'10', N'26911147', CAST(N'2023-03-13' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (11, 5, N'11', N'45843469', CAST(N'2023-03-08' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (12, 5, N'5', N'30617946', CAST(N'2023-03-15' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (13, 5, N'13', N'46570763', CAST(N'2023-03-17' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (14, 5, N'14', N'36073248', CAST(N'2023-03-21' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (15, 2, N'12', N'60824508', CAST(N'2023-03-06' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (16, 2, N'5', N'81669035', CAST(N'2023-03-12' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (17, 2, N'11', N'66671306', CAST(N'2023-03-10' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (18, 2, N'7', N'81233569', CAST(N'2023-03-08' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (19, 2, N'3', N'71589467', CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (20, 2, N'10', N'80910575', CAST(N'2023-03-03' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (21, 2, N'13', N'46570763', CAST(N'2023-03-15' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (22, 7, N'14', N'36073248', CAST(N'2023-03-06' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (23, 7, N'1', N'81669035', CAST(N'2023-03-09' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (24, 7, N'3', N'70477729', CAST(N'2023-03-02' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (25, 7, N'8', N'80910575', CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (26, 7, N'10', N'40321542', CAST(N'2023-03-06' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (27, 7, N'5', N'30617946', CAST(N'2023-03-08' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (28, 7, N'6', N'40321542', CAST(N'2023-03-09' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (29, 7, N'12', N'71589467', CAST(N'2023-03-13' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (30, 4, N'9', N'26911147', CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (31, 4, N'13', N'70477729', CAST(N'2023-03-03' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (32, 4, N'5', N'36073248', CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (33, 4, N'1', N'46570763', CAST(N'2023-03-07' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (34, 4, N'11', N'66671306', CAST(N'2023-03-16' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (35, 4, N'4', N'81233569', CAST(N'2023-03-08' AS Date), NULL)
INSERT [dbo].[clase] ([Clase_ID], [Division_ID], [Materia_ID], [Profesor_ID], [Fecha_Comienzo], [Fecha_Final]) VALUES (36, 4, N'10', N'40321542', CAST(N'2023-03-15' AS Date), NULL)
GO
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (1, 1, 1, N'maniana')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (2, 1, 2, N'tarde')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (3, 1, 3, N'noche')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (4, 1, 4, N'maniana')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (5, 2, 1, N'maniana')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (6, 2, 2, N'tarde')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (7, 2, 3, N'maniana')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (8, 2, 4, N'maniana')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (9, 3, 1, N'maniana')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (10, 3, 2, N'tarde')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (11, 3, 3, N'noche')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (12, 3, 4, N'tarde')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (13, 4, 1, N'maniana')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (14, 4, 2, N'tarde')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (15, 4, 3, N'noche')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (16, 4, 4, N'maniana')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (17, 5, 1, N'tarde')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (18, 5, 2, N'maniana')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (19, 5, 3, N'tarde')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (20, 5, 4, N'noche')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (21, 6, 1, N'tarde')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (22, 6, 2, N'maniana')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (23, 6, 3, N'noche')
INSERT [dbo].[division] ([Division_ID], [Anio_Escolar], [Division_Escolar], [Turno]) VALUES (24, 6, 4, N'maniana')
GO
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (1, 36595167, 1, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (2, 93752192, 1, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (3, 54070271, 5, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (4, 55719308, 5, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (5, 36595178, 1, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (10, 11763489, 2, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (11, 11794349, 2, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (12, 19198515, 2, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (13, 27066540, 3, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (14, 28787007, 3, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (15, 30728792, 3, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (22, 34768096, 4, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (23, 45396209, 4, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (24, 48192861, 4, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (33, 51886426, 5, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (34, 53796361, 6, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (35, 61561229, 6, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (36, 54616843, 6, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (37, 64419692, 7, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (38, 69058336, 7, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (39, 73789450, 7, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (40, 76103238, 8, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (41, 78721686, 8, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (42, 81222167, 8, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (43, 81853671, 9, 2023)
INSERT [dbo].[division_de_alumnos] ([DivisionDA_ID], [DNI_Alumno], [Division_ID], [Anio_Calendario]) VALUES (44, 83852143, 9, 2023)
GO
SET IDENTITY_INSERT [dbo].[Ejemplo] ON 

INSERT [dbo].[Ejemplo] ([ID], [Nombre], [Apellido]) VALUES (1, N'Nombre 4073', N'Apellido 1')
INSERT [dbo].[Ejemplo] ([ID], [Nombre], [Apellido]) VALUES (2, N'Nombre 3125', N'Apellido 2')
INSERT [dbo].[Ejemplo] ([ID], [Nombre], [Apellido]) VALUES (3, N'Nombre 9895', N'Apellido 3')
INSERT [dbo].[Ejemplo] ([ID], [Nombre], [Apellido]) VALUES (4, N'Nombre 10709', N'Apellido 4')
INSERT [dbo].[Ejemplo] ([ID], [Nombre], [Apellido]) VALUES (5, N'Nombre 1004', N'Apellido 5')
INSERT [dbo].[Ejemplo] ([ID], [Nombre], [Apellido]) VALUES (6, N'Nombre 7255', N'Apellido 6')
INSERT [dbo].[Ejemplo] ([ID], [Nombre], [Apellido]) VALUES (7, N'Nombre 4706', N'Apellido 7')
INSERT [dbo].[Ejemplo] ([ID], [Nombre], [Apellido]) VALUES (8, N'Nombre 1487', N'Apellido 8')
INSERT [dbo].[Ejemplo] ([ID], [Nombre], [Apellido]) VALUES (9, N'Nombre 709', N'Apellido 9')
INSERT [dbo].[Ejemplo] ([ID], [Nombre], [Apellido]) VALUES (10, N'Nombre 3117', N'Apellido 10')
SET IDENTITY_INSERT [dbo].[Ejemplo] OFF
GO
INSERT [dbo].[evaluaciones] ([Evaluacion_ID], [Clase_ID], [Fecha], [Detalles]) VALUES (1, 4, CAST(N'2023-07-14' AS Date), N'multiplechoice')
INSERT [dbo].[evaluaciones] ([Evaluacion_ID], [Clase_ID], [Fecha], [Detalles]) VALUES (2, 6, CAST(N'2023-06-21' AS Date), N'examen oral')
GO
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (1, 36595167, CAST(N'2023-05-19' AS Date), CAST(0.5 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (2, 54070271, CAST(N'2023-06-15' AS Date), CAST(1.0 AS Decimal(10, 1)), 1)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (3, 36595167, CAST(N'2023-05-20' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (4, 36595167, CAST(N'2023-05-21' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (5, 36595167, CAST(N'2023-05-22' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (6, 36595167, CAST(N'2023-05-23' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (7, 36595167, CAST(N'2023-05-24' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (8, 36595167, CAST(N'2023-05-25' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (9, 36595167, CAST(N'2023-05-26' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (10, 36595167, CAST(N'2023-05-27' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (11, 36595167, CAST(N'2023-05-28' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (12, 36595167, CAST(N'2023-05-29' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (13, 36595167, CAST(N'2023-05-30' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
INSERT [dbo].[faltas] ([Falta_ID], [DNI_Alumno], [Fecha], [Tipo], [jutificada]) VALUES (14, 36595167, CAST(N'2023-06-01' AS Date), CAST(1.0 AS Decimal(10, 1)), 2)
GO
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (1, N'matematica', 1, 4)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (2, N'lengua y literatura', 1, 2)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (3, N'biologia', 1, 2)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (4, N'ingles', 1, 2)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (5, N'educacion fisica', 1, 4)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (6, N'educacion ciudadana', 1, 3)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (7, N'taller', 1, 3)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (8, N'biologia', 2, 2)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (9, N'ingles', 2, 2)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (10, N'matematicas', 2, 1)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (11, N'educacion fisica', 2, 2)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (12, N'lengua y literatura', 2, 4)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (13, N'taller', 2, 4)
INSERT [dbo].[materia] ([Materia_ID], [Nombre], [Anio_escolar], [Horas_Semanales]) VALUES (14, N'educacion ciudadana', 2, 2)
GO
INSERT [dbo].[notas] ([Notas_ID], [Nota], [DNI_Alumno], [Evaluacion_ID]) VALUES (1, CAST(7.00 AS Decimal(10, 2)), 54070271, 1)
INSERT [dbo].[notas] ([Notas_ID], [Nota], [DNI_Alumno], [Evaluacion_ID]) VALUES (2, CAST(4.00 AS Decimal(10, 2)), 55719308, 2)
GO
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (301464, N'tomas', N'mari', N'tomasmari@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (3868668, N'silvia', N'galan', N'silviagalan@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (6046189, N'jennifer ', N'prada', N'jenniferprada@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (8306524, N'kevin ', N'corral', N'kevincorral@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (8837419, N'nora', N'campo', N'noracampo@gmai.com', N'1234', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (9972472, N'nicoleta ', N'rosales', N'nicoletarosales@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (10710361, N'miquel ', N'murcia', N'miquelmurcia@gmail.com', N'1234', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (11763489, N'felicita', N'aguirre', N'felicitaaguirre@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (11794349, N'yanira', N'aguilar', N'yaniraaguilar@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (15253985, N'eduard ', N' romera', N'eduardromera@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (19198515, N'Miguela', N'Felicidad Sancho', N'miguelaFelicidadSancho@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (20982264, N'carlos', N'garreno', N'carlosgarreno@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (25032594, N'gisela', N'soria', N'giselasoria@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (26888080, N'Estrella Rogelio', N'Pardo', N'estrellaRogelioPardo@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 1)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (26911147, N'nilo wilmar', N'simon', N'niloWilmarSimon@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (27066540, N'narciso', N'segui', N'narcisosegui@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (28787007, N'saray', N'collado', N'saraycollado@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (30318061, N'joan', N'valencia', N'joanvalencia@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (30617946, N'maria', N'cruz', N'mariaCruz66@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (30728792, N'Felisa', N'Rosalva Duarte', N'felisaRosalvaDuarte@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (34768096, N'isidora', N'lloret', N'isidoralloret@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (36073248, N'moreno', N'panfilo', N'morenoPanfilo22@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (36165581, N'Alejo Fabian', N'Nieto', N'alejoFabianNieto@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 1)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (36595167, N'eloy', N'rodriguez', N'eloyrodriguez@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (36595178, N'jose', N'martin', N'josemartin@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (37418882, N'aritz ', N'gisbert', N'artizgisbert@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (38703622, N'ines', N'aroca', N'inesaroca@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (40321542, N'cloe', N'ciro', N'cloeCiro54@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (44879840, N'ruben dario', N'olmo', N'rubenDarioOlmo@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (45396209, N'Cruz', N' Albina Clemente', N'cruzAlbinaClemente@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (45843469, N'nelson', N'carmen', N'nelsonCarmen66@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (46283697, N'Jose Angel Luis Angel', N'Quijada', N'joseAngelLuisAngelQuijada@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 1)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (46570763, N'rosendo ciro', N'arenas', N'rosendoCiroArenas@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (47181893, N'Osvaldo Filomena', N'Ruiz', N'osvaldoFilomenaRuiz@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 1)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (48192861, N'Javiera', N'Silvino Olmo', N'javieraSilvinoOlmo@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (48397598, N'imane ', N' vazquez', N'imanevazquez@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (51886426, N'Amado', N'Felipa Valencia', N'amadoFelipaValencia@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (53796361, N'Leopoldo', N'Mireya Francisco', N'leopoldoMireyaFrancisco@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (54070271, N'marina', N'jurado', N'marinajurado@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (54616843, N'laila', N'gilbert', N'lailagilbert@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (55719308, N'daniela', N'martorell', N'danielamartorell@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (60136659, N'erica ', N'ramirez', N'ericaramirez@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (60824508, N'emilio maximiano', N'del olmo', N'emilioMaximianoDelOlmo@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (61561229, N'Matias', N'Gaspar Esparza', N'matiasGasparEsparza@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (61923966, N'julian', N'lafuente', N'julianlafuente@gmail.com', N'1234', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (64419692, N'Geraldo', N'Ignacia Espinosa', N'geraldoIgnaciaEspinosa@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (66671306, N'jessica', N'patricia', N'jessicaPatricia22@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (68626809, N'Aranzazu Encarnita', N'Araujo', N'aránzazuEncarnitaAraujo@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 1)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (69058336, N'moussa', N'nieto', N'moussanieto@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (70477729, N'mariana', N'abigail', N'marianaAbigail42@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (71589467, N'agapito benjamin', N'rivas', N'agapitoBenjaminRivas@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (73789450, N'Luis', N'Pio Casales', N'luisPioCasales@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (76103238, N'aquilino', N'ocaña', N'aquilinoocaña@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (78721686, N'june', N'alonso', N'junealonso@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (80910575, N'aureliano', N'norberto', N'aurelianoNorberto44@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (81222167, N'Victoriano', N' Melania Gonzales', N'victorianoMelaniaGonzales@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (81233569, N'azahara ', N'dionisia', N'azaharaDionisia@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (81669035, N'modesto', N'gertrudis', N'modestoGertrudis11@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 2)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (81853671, N'enrique', N'marquez', N'enriquemarquez@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (83852143, N'Marina', N'Filemon Chaves', N'marinaFilemonChaves@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (84217460, N'María Guadalupe', N'Inmaculada Aguado', N'mariaGuadalupeInmaculadaAguado@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (84649838, N'Urbana', N'Caridad Morales', N'urbanaCaridadMorales@gmal.com', N'1234', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (86684260, N'abril', N'mateu', N'abrilmateu@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (89354103, N'Bernardo', N'Jessenia Asturias', N'bernardoJesseniaAsturias@gmail.com', N'1234', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (89374374, N'montse ', N'mendoza', N'montsemendoza@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (90211974, N'claudia ', N'granado', N'claudiagranado@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (91245394, N'lorena', N'maldonado', N'lorenamaldonado@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (92767317, N'mariam', N'yuste', N'mariamyuste@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (92789405, N'valeria', N'nuñez', N'valerianuñez@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (93752192, N'felix', N'araujo', N'felixaraujo@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (94260639, N'Leyre', N'Anunciacion Otero', N'leyreAnunciacionOtero@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (94452392, NULL, NULL, NULL, N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (95820922, N'Xiomara', N'Rosalinda Castellano', N'xiomaraRosalindaCastellano@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (96747752, N'sabela', N'trigo', N'sabelatrigo@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (96779259, N'Saul', N'Feliciano Borja', N'saulFelicianoBorja@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (98181845, N'cecilia', N'ordoñez', N'ceciliaordoñez@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (99652265, N'Ainara', N'Fabricio Alonso', N'ainaraFabricioAlonso@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
INSERT [dbo].[persona] ([DNI], [Nombre], [Apellido], [Mail], [Contrasena], [Nivel]) VALUES (99899305, N'Marcelino', N'Rayen Miranda', N'marcelinoRayenMiranda@gmail.com', N'*A4B6157319038724E3560894F7F932C8886EBFCF', 3)
GO
USE [master]
GO
ALTER DATABASE [proyecto_academico] SET  READ_WRITE 
GO

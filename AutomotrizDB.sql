USE [master]
GO
/****** Object:  Database [tp_laboratorio_automotriz]    Script Date: 9/11/2022 14:41:18 ******/
CREATE DATABASE [tp_laboratorio_automotriz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tp_laboratorio_automotriz', FILENAME = N'D:\EscritorioSofi\programacionII\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\tp_laboratorio_automotriz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tp_laboratorio_automotriz_log', FILENAME = N'D:\EscritorioSofi\programacionII\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\tp_laboratorio_automotriz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tp_laboratorio_automotriz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET ARITHABORT OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET RECOVERY FULL 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET  MULTI_USER 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tp_laboratorio_automotriz', N'ON'
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET QUERY_STORE = OFF
GO
USE [tp_laboratorio_automotriz]
GO
/****** Object:  Table [dbo].[barrios]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[barrios](
	[id_barrio] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[id_localidad] [int] NULL,
 CONSTRAINT [pk_barrio] PRIMARY KEY CLUSTERED 
(
	[id_barrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[id_tipo_doc] [int] NULL,
	[num_doc] [int] NULL,
	[telefono] [int] NULL,
	[email] [varchar](50) NULL,
	[id_tipo_cliente] [int] NULL,
	[id_barrio] [int] NULL,
 CONSTRAINT [pk_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_facturas]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_facturas](
	[id_detalle_factura] [int] IDENTITY(1,1) NOT NULL,
	[id_factura] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
	[precio_unitario] [decimal](10, 2) NULL,
 CONSTRAINT [pk_detalles_facturas] PRIMARY KEY CLUSTERED 
(
	[id_detalle_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_ordenes_pedidos]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_ordenes_pedidos](
	[id_detalle_orden] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_factura] [int] NULL,
	[cantidad] [int] NULL,
	[precio_unitario] [decimal](10, 2) NULL,
	[fecha_entrega] [datetime] NULL,
 CONSTRAINT [pk_detalles_orden] PRIMARY KEY CLUSTERED 
(
	[id_detalle_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturas](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[id_forma_pago] [int] NULL,
	[id_forma_envio] [int] NULL,
	[interes] [decimal](10, 2) NULL,
	[descuento] [decimal](10, 2) NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [pk_factura] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[formas_envios]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[formas_envios](
	[id_forma_envio] [int] IDENTITY(1,1) NOT NULL,
	[forma_envio] [varchar](50) NULL,
 CONSTRAINT [pk_forma_envio] PRIMARY KEY CLUSTERED 
(
	[id_forma_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[formas_pagos]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[formas_pagos](
	[id_forma_pago] [int] IDENTITY(1,1) NOT NULL,
	[forma_pago] [varchar](50) NULL,
 CONSTRAINT [pk_forma_pago] PRIMARY KEY CLUSTERED 
(
	[id_forma_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidades]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidades](
	[id_localidad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[id_provincia] [int] NULL,
 CONSTRAINT [pk_localidad] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcas]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcas](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](50) NULL,
 CONSTRAINT [pk_marca] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
	[stock] [int] NULL,
	[stock_minimo] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[id_tipo_producto] [int] NULL,
	[id_marca] [int] NULL,
	[estado] [int] NULL,
 CONSTRAINT [pk_producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincias](
	[id_provincia] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pf_provincia] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_clientes]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_clientes](
	[id_tipo_cliente] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_tipo_cliente] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_doc]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_doc](
	[id_tipo_doc] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_tipo_doc] PRIMARY KEY CLUSTERED 
(
	[id_tipo_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_productos]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_productos](
	[id_tipo_producto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_tipo_producto] PRIMARY KEY CLUSTERED 
(
	[id_tipo_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 9/11/2022 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [varchar](100) NULL,
	[contraseña] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[barrios] ON 

INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (1, N'Centro', 1)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (2, N'General Paz', 1)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (3, N'Observatiorio', 1)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (4, N'Centro', 2)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (5, N'La Quinta ', 2)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (6, N'Villa del Lago', 2)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (7, N'Centro', 3)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (8, N'Pueyrredon', 3)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (9, N'Centro', 4)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (10, N'Alto mieres', 4)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (11, N'Miguel Muños', 4)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (12, N'Las Malvinas', 4)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (13, N'Abasto', 5)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (14, N'Olmos', 5)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (15, N'Romero', 5)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (16, N'Barrio Norte', 6)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (17, N'Plazoleta Barrio', 6)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (18, N'Barrio Bosque Alegre', 6)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (19, N'Colon', 7)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (20, N'Pacifico', 7)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (21, N'El Nacional', 7)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (22, N'Centro', 8)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (23, N'Colon', 8)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (24, N'Malvinas', 8)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (25, N'Microcentro', 9)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (26, N'Area Fundacional', 9)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (27, N'Barrio Bombal', 9)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (28, N'Centro', 10)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (29, N'Villa del Parque', 10)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (30, N'Las Tortugas', 10)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (31, N'El Sauce', 11)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (32, N'Los Corralitos', 11)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (33, N'Kilometro 8', 11)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (34, N'Centro', 12)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (35, N'Belgrano', 12)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (36, N'Barracas', 12)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (37, N'San Geronimo', 13)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (38, N'San Marcos', 13)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (39, N'17 de Agosto', 13)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (40, N'Barrio Villa Dolores', 14)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (41, N'El Brete', 14)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (42, N'Aeroclub ', 14)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (43, N'Barrio Parque', 15)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (44, N'Barrio concepcion', 15)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (45, N'San Antonio', 15)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (46, N'Centro', 16)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (47, N'9 de Julio', 16)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (48, N'Malvinas', 16)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (49, N'San Martin', 17)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (50, N'Belgrano', 17)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (51, N'Suipacha', 17)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (52, N'Belgrano', 18)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (53, N'Sarmiento', 18)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (54, N'Centro', 18)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (55, N'Centro', 19)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (56, N'Don Torcuato', 19)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (57, N'General Pacheco', 19)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (58, N'Barrio 2 de Abril', 20)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (59, N'Barrio Santa Barbara', 20)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (60, N'23 de Agosto', 20)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (61, N'Centro', 21)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (62, N'Oeste', 21)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (63, N'Norte', 21)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (64, N'Centro', 22)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (65, N'Malvinas', 22)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (66, N'b.Grande', 22)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (67, N'Centro', 23)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (68, N'Sarmiento', 23)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (69, N'Belgrano', 23)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (70, N'Tropezon', 24)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (71, N'Urquiza', 24)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (72, N'14 de Octrubre', 24)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (73, N'Las Palmeras', 25)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (74, N'Costa Azul', 25)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (75, N'Los Olivos', 25)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (76, N'Barrio Rivadavia', 26)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (77, N'Barrio Matilde', 26)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (78, N'Centro', 26)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (79, N'Barrio San Carlos', 27)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (80, N'Barrio Parque el Aybal', 27)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (81, N'Barrio Miguel Arao', 27)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (82, N'Centro', 28)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (83, N'Sarmiento', 28)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (84, N'Belgrano', 28)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (85, N'Mariano Moreno', 29)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (86, N'Villa Farrel', 29)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (87, N'Rio Grande', 29)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (88, N'Centro', 30)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (89, N'Alberdi', 30)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (90, N'Norte', 30)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (91, N'Centro', 31)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (92, N'Malvinas', 31)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (93, N'Belgrano', 31)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (94, N'Centro', 32)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (95, N'norte', 32)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (96, N'Crisol', 32)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (97, N'Centro', 33)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (98, N'Oeste', 33)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (99, N'Alberdi', 33)
GO
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (100, N'Barrio Los Eucaliptos', 34)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (101, N'Barrio Los Lapachos', 34)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (102, N'Barrio Los Nogales', 34)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (103, N'Centro', 35)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (104, N'San Antonio', 35)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (105, N'Lagos', 35)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (106, N'B. Danes', 36)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (107, N'Chacre XI', 36)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (108, N'Mutual', 36)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (109, N'Alta Gracia', 37)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (110, N'Bajada vieja', 37)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (111, N'Belgrano', 37)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (112, N'9 de Julio', 38)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (113, N'Malvinas', 38)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (114, N'2 de Abril', 38)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (115, N'Barrio Carlos A ', 39)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (116, N'Barrio Emilce E', 39)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (117, N'Barrio Hector J', 39)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (118, N'iprodhad', 40)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (119, N'Centro', 40)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (120, N'Sur', 40)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (121, N'Alta Rioja', 41)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (122, N'4 de Junio', 41)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (123, N'San Vicente', 41)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (124, N'Barrio Viviana R', 42)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (125, N'Barrio Graciela del V', 42)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (126, N'Barrio Edgardo J', 42)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (127, N'Centro', 43)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (128, N'Norte', 43)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (129, N'Sur', 43)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (130, N'Centro', 44)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (131, N'Alberdi', 44)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (132, N'Belgrano', 44)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (133, N'Centro', 45)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (134, N'41', 45)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (135, N'El redondo', 45)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (136, N'Centro', 46)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (137, N'Norte', 46)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (138, N'Cofico', 46)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (139, N'Centro', 47)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (140, N'Malvinas', 47)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (141, N'Juan Pablo', 47)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (142, N'Villa Ayacucho', 48)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (143, N'Villa Ballester', 48)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (144, N'Villa Chacabuco', 48)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (145, N'Loteo Pagani', 49)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (146, N'Valle Escondido', 49)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (147, N'Don Bosco', 49)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (148, N'General Enrique Godoy', 50)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (149, N'General Fernández Oro', 50)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (150, N'General Roca', 50)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (151, N'Centro', 51)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (152, N'Zona Sur', 51)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (153, N'Alberdi', 51)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (154, N'Centro', 52)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (155, N'Alberdi', 52)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (156, N'Malvinas', 52)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (157, N'12 DE OCTUBRE', 53)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (158, N'2 DE ABRIL', 53)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (159, N'LA PAZ', 53)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (160, N'Barrio AIDA E ', 54)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (161, N'Julia E', 54)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (162, N'Veronica V', 54)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (163, N'Centro', 55)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (164, N'Sur', 55)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (165, N'Oeste', 55)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (166, N'Centro', 56)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (167, N'Cofico', 56)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (168, N'La Loma', 56)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (169, N'17 de octubre', 57)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (170, N'2 de Abril', 57)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (171, N'Centro', 57)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (172, N'Los Pinos', 58)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (173, N'Mutual', 58)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (174, N'San Cayetano', 58)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (175, N'Democracia', 59)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (176, N'Industrial', 59)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (177, N'Fonavi', 59)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (178, N'Centro', 60)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (179, N'Victor H', 60)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (180, N'Eduardo', 60)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (181, N'Centro', 61)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (182, N'Oeste', 61)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (183, N'Malvinas', 61)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (184, N'Centro', 62)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (185, N'Laguna escondida', 62)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (186, N'Belgrano', 62)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (187, N'Margen Sur', 63)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (188, N'Chacras de la Margen Sur', 63)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (189, N'AGP', 63)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (190, N'Centro', 64)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (191, N'3 de Febrero', 64)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (192, N'Malvinas', 64)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (193, N'Centro', 65)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (194, N'Colon', 65)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (195, N'Alberdi', 65)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (196, N'Centro', 66)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (197, N'Barrio Lomada', 66)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (198, N'zona Sur', 66)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (199, N'Centro', 67)
GO
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (200, N'2 de Abril', 67)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (201, N'Belgrano', 67)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (202, N'Centro', 68)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (203, N'Victor Arrudi', 68)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (204, N'Malvinas', 68)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (205, N'Centro', 69)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (206, N'Alberdi', 69)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (207, N'Malvinas', 69)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (208, N'Centro', 70)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (209, N'Alberdi', 70)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (210, N'Malvinas', 70)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (211, N'Ojibar', 71)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (212, N'El Corso', 71)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (213, N'Mendialde', 71)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (214, N'Centro', 72)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (215, N'Barrio Re', 72)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (216, N'Alberdi', 72)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (217, N'Justo Alsua', 73)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (218, N'Los Hornitos', 73)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (219, N'Mulcosur', 73)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (220, N'Centro', 74)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (221, N'Sur', 74)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (222, N'2 de Abril', 74)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (223, N'Centro', 75)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (224, N'27 de Abril', 75)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (225, N'Malvinas', 75)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (226, N'El Álamo', 76)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (227, N'El Faro', 76)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (228, N'El Palmar', 76)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (229, N'Barrio 15 de May', 77)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (230, N'Barrio 17 de Octubre', 77)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (231, N'Barrio 19 de Abril', 77)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (232, N'Centro', 78)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (233, N'Alberdi', 78)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (234, N'3 de Febrero', 78)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (235, N'Centro', 79)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (236, N'4 de Febrero', 79)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (237, N'27 de Abril', 79)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (238, N'Centro', 80)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (239, N'Zona Sur', 80)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (240, N'Alberdi', 80)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (241, N'Villa Cubas', 81)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (242, N'Centro', 81)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (243, N'Juan Manuel de Rosas', 81)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (244, N'Centro', 82)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (245, N'9 de Julio', 82)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (246, N'Malvinas', 82)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (247, N'Centro', 83)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (248, N'Norte', 83)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (249, N'Oeste', 83)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (250, N'Centro', 84)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (251, N'8 de Octubre', 84)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (252, N'27 de Abril', 84)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (253, N'Barrio Aeropuerto', 85)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (254, N'Barrio Aconquija', 85)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (255, N'Barrio Aguas Corrientes', 85)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (256, N'Centro', 86)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (257, N'Alberdi', 86)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (258, N'Malvinas', 86)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (259, N'Los Cerros', 87)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (260, N'El tipai', 87)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (261, N'Las Victorias', 87)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (262, N'El Colmenar', 88)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (263, N'Las Talitas', 88)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (264, N'Tafi Viejo', 88)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (265, N'Aeropuerto', 89)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (266, N'General paz', 89)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (267, N'Alberdi', 89)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (268, N'Centro', 90)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (269, N'San Fernando', 90)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (270, N'Alberdi', 90)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (271, N'Centro', 91)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (272, N'General Paz', 91)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (273, N'Alberdi', 91)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (274, N'Centro', 92)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (275, N'Malvinas', 92)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (276, N'Belgrano', 92)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (277, N'Alta Córdoba', 1)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (278, N'Ayacucho', 1)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (279, N'Nueva Córdoba', 1)
INSERT [dbo].[barrios] ([id_barrio], [descripcion], [id_localidad]) VALUES (280, N'Marqués de Sobremonte', 1)
SET IDENTITY_INSERT [dbo].[barrios] OFF
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (1, N'ANTONIO', N'GARCIA', 1, 40856241, 35215624, N'ANTONIO.GARCIA@gmail.com', 1, 1)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (2, N'MANUEL', N'RODRIGUEZ', 2, 40979810, 35215625, N'MANUEL.RODRIGUEZ@gmail.com', 2, 2)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (3, N'JOSE', N'GONZALEZ', 3, 41103379, 35215626, N'JOSE.GONZALEZ@gmail.com', 3, 3)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (4, N'FRANCISCO', N'FERNANDEZ', 4, 41226948, 35215627, N'FRANCISCO.FERNANDEZ@gmail.com', 4, 4)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (5, N'DAVID', N'LOPEZ', 1, 41350517, 35215628, N'DAVID.LOPEZ@gmail.com', 1, 5)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (6, N'JUAN', N'MARTINEZ', 1, 41474086, 35215629, N'JUAN.MARTINEZ@gmail.com', 1, 6)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (7, N'JAVIER', N'SANCHEZ', 1, 41597655, 35215630, N'JAVIER.SANCHEZ@gmail.com', 1, 7)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (8, N'JOSE ANTONIO', N'PEREZ', 1, 41721224, 35215631, N'JOSE ANTONIO.PEREZ@gmail.com', 1, 24)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (9, N'DANIEL', N'GOMEZ', 2, 41844793, 35215632, N'DANIEL.GOMEZ@gmail.com', 2, 25)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (10, N'FRANCISCO JAVIER', N'MARTIN', 2, 41968362, 35215633, N'FRANCISCO JAVIER.MARTIN@gmail.com', 2, 26)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (11, N'JOSE LUIS', N'JIMENEZ', 2, 42091931, 35215634, N'JOSE LUIS.JIMENEZ@gmail.com', 2, 27)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (12, N'CARLOS', N'HERNANDEZ', 2, 42215500, 35215635, N'CARLOS.HERNANDEZ@gmail.com', 2, 28)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (13, N'JESUS', N'RUIZ', 1, 42339069, 35215636, N'JESUS.RUIZ@gmail.com', 1, 107)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (14, N'ALEJANDRO', N'DIAZ', 1, 42462638, 35215637, N'ALEJANDRO.DIAZ@gmail.com', 1, 108)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (15, N'MIGUEL', N'MORENO', 1, 42586207, 35215638, N'MIGUEL.MORENO@gmail.com', 1, 109)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (16, N'JOSE MANUEL', N'MUÐOZ', 3, 42709776, 35215639, N'JOSE MANUEL.MUÐOZ@gmail.com', 3, 110)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (17, N'RAFAEL', N'ALVAREZ', 2, 42833345, 35215640, N'RAFAEL.ALVAREZ@gmail.com', 2, 111)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (18, N'MIGUEL ANGEL', N'ROMERO', 4, 42956914, 35215641, N'MIGUEL ANGEL.ROMERO@gmail.com', 4, 112)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (19, N'PABLO', N'GUTIERREZ', 4, 43080483, 35215642, N'PABLO.GUTIERREZ@gmail.com', 4, 113)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (20, N'PEDRO', N'ALONSO', 3, 43204052, 35215643, N'PEDRO.ALONSO@gmail.com', 3, 114)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (21, N'ANGEL', N'NAVARRO', 1, 43327621, 35215644, N'ANGEL.NAVARRO@gmail.com', 1, 115)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (22, N'SERGIO', N'TORRES', 3, 43451190, 35215645, N'SERGIO.TORRES@gmail.com', 3, 22)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (23, N'JOSE MARIA', N'DOMINGUEZ', 1, 43574759, 35215646, N'JOSE MARIA.DOMINGUEZ@outlook.com', 1, 23)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (24, N'FERNANDO', N'RAMOS', 1, 43698328, 35215647, N'FERNANDO.RAMOS@outlook.com', 1, 24)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (25, N'JORGE', N'VAZQUEZ', 2, 43821897, 35215648, N'JORGE.VAZQUEZ@outlook.com', 2, 25)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (26, N'LUIS', N'RAMIREZ', 1, 43945466, 35215649, N'LUIS.RAMIREZ@outlook.com', 1, 26)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (27, N'ALBERTO', N'GIL', 1, 44069035, 35215650, N'ALBERTO.GIL@outlook.com', 1, 27)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (28, N'ALVARO', N'SERRANO', 1, 44192604, 35215651, N'ALVARO.SERRANO@outlook.com', 1, 28)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (29, N'JUAN CARLOS', N'MORALES', 1, 44316173, 35215652, N'JUAN CARLOS.MORALES@outlook.com', 1, 29)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (30, N'ADRIAN', N'MOLINA', 3, 44439742, 35215653, N'ADRIAN.MOLINA@outlook.com', 3, 30)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (31, N'DIEGO', N'BLANCO', 1, 44563311, 35215654, N'DIEGO.BLANCO@outlook.com', 1, 31)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (32, N'JUAN JOSE', N'SUAREZ', 1, 44686880, 35215655, N'JUAN JOSE.SUAREZ@outlook.com', 1, 32)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (33, N'RAUL', N'CASTRO', 1, 44810449, 35215656, N'RAUL.CASTRO@outlook.com', 1, 33)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (34, N'IVAN', N'ORTEGA', 4, 44934018, 35215657, N'IVAN.ORTEGA@outlook.com', 4, 34)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (35, N'JUAN ANTONIO', N'DELGADO', 4, 30201562, 35215658, N'JUAN ANTONIO.DELGADO@outlook.com', 4, 35)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (36, N'RUBEN', N'ORTIZ', 3, 30300207, 35215659, N'RUBEN.ORTIZ@outlook.com', 1, 36)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (37, N'ENRIQUE', N'MARIN', 3, 30398852, 35215660, N'ENRIQUE.MARIN@outlook.com', 2, 37)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (38, N'OSCAR', N'RUBIO', 3, 30497497, 35215661, N'OSCAR.RUBIO@outlook.com', 3, 38)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (39, N'RAMON', N'NUÐEZ', 3, 30596142, 35215662, N'RAMON.NUÐEZ@outlook.com', 4, 39)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (40, N'ANDRES', N'SANZ', 1, 30694787, 35215663, N'ANDRES.SANZ@outlook.com', 1, 40)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (41, N'JUAN MANUEL', N'MEDINA', 2, 30793432, 35215664, N'JUAN MANUEL.MEDINA@outlook.com', 1, 41)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (42, N'VICENTE', N'IGLESIAS', 1, 30892077, 35215665, N'VICENTE.IGLESIAS@outlook.com', 1, 42)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (43, N'SANTIAGO', N'CASTILLO', 1, 30990722, 35215666, N'SANTIAGO.CASTILLO@outlook.com', 1, 43)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (44, N'JOAQUIN', N'CORTES', 2, 31089367, 35215667, N'JOAQUIN.CORTES@outlook.com', 2, 44)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (45, N'MARIO', N'GARRIDO', 1, 31188012, 35215668, N'MARIO.GARRIDO@outlook.com', 2, 45)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (46, N'VICTOR', N'SANTOS', 4, 31286657, 35215669, N'VICTOR.SANTOS@outlook.com', 2, 46)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (47, N'EDUARDO', N'GUERRERO', 4, 31385302, 35215670, N'EDUARDO.GUERRERO@outlook.com', 2, 47)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (48, N'ROBERTO', N'LOZANO', 1, 31483947, 35215671, N'ROBERTO.LOZANO@outlook.com', 1, 48)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (49, N'JAIME', N'CANO', 2, 31582592, 35215672, N'JAIME.CANO@outlook.com', 1, 49)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (50, N'FRANCISCO JOSE', N'MENDEZ', 3, 31681237, 35215673, N'FRANCISCO JOSE.MENDEZ@outlook.com', 1, 119)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (51, N'MARCOS', N'CRUZ', 4, 31779882, 35215674, N'MARCOS.CRUZ@outlook.com', 3, 120)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (52, N'HUGO', N'PRIETO', 1, 31878527, 35215675, N'HUGO.PRIETO@outlook.com', 2, 121)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (53, N'IGNACIO', N'FLORES', 2, 31977172, 35215676, N'IGNACIO.FLORES@outlook.com', 4, 122)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (54, N'JORDI', N'HERRERA', 3, 32075817, 35215677, N'JORDI.HERRERA@outlook.com', 4, 123)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (55, N'ALFONSO', N'PEÐA', 4, 32174462, 35215678, N'ALFONSO.PEÐA@outlook.com', 3, 124)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (56, N'RICARDO', N'LEON', 1, 32273107, 35215679, N'RICARDO.LEON@outlook.com', 1, 125)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (57, N'SALVADOR', N'MARQUEZ', 1, 32371752, 35215680, N'SALVADOR.MARQUEZ@outlook.com', 3, 126)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (58, N'GUILLERMO', N'CABRERA', 1, 32470397, 35215681, N'GUILLERMO.CABRERA@outlook.com', 1, 127)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (59, N'MARC', N'GALLEGO', 1, 32569042, 35215682, N'MARC.GALLEGO@outlook.com', 1, 59)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (60, N'GABRIEL', N'CALVO', 2, 32667687, 35215683, N'GABRIEL.CALVO@hotmail.com', 2, 60)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (61, N'MOHAMED', N'VIDAL', 2, 32766332, 35215684, N'MOHAMED.VIDAL@hotmail.com', 1, 61)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (62, N'EMILIO', N'CAMPOS', 2, 32864977, 35215685, N'EMILIO.CAMPOS@hotmail.com', 1, 62)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (63, N'GONZALO', N'REYES', 2, 32963622, 35215686, N'GONZALO.REYES@hotmail.com', 1, 63)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (64, N'MARTIN', N'VEGA', 1, 33062267, 35215687, N'MARTIN.VEGA@hotmail.com', 1, 64)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (65, N'JOSE MIGUEL', N'FUENTES', 1, 33160912, 35215688, N'JOSE MIGUEL.FUENTES@hotmail.com', 3, 65)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (66, N'JULIO', N'CARRASCO', 1, 33259557, 35215689, N'JULIO.CARRASCO@hotmail.com', 1, 28)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (67, N'JULIAN', N'DIEZ', 3, 33358202, 35215690, N'JULIAN.DIEZ@hotmail.com', 1, 29)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (68, N'TOMAS', N'AGUILAR', 2, 33456847, 35215691, N'TOMAS.AGUILAR@hotmail.com', 2, 30)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (69, N'NICOLAS', N'CABALLERO', 4, 33555492, 35215692, N'NICOLAS.CABALLERO@hotmail.com', 3, 31)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (70, N'AGUSTIN', N'NIETO', 4, 33654137, 35215693, N'AGUSTIN.NIETO@hotmail.com', 4, 32)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (71, N'JOSE RAMON', N'SANTANA', 3, 33752782, 35215694, N'JOSE RAMON.SANTANA@hotmail.com', 1, 33)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (72, N'SAMUEL', N'PASCUAL', 1, 33851427, 35215695, N'SAMUEL.PASCUAL@hotmail.com', 1, 34)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (73, N'ISMAEL', N'HERRERO', 3, 33950072, 35215696, N'ISMAEL.HERRERO@hotmail.com', 1, 73)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (74, N'CRISTIAN', N'VARGAS', 1, 34048717, 35215697, N'CRISTIAN.VARGAS@hotmail.com', 1, 74)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (75, N'LUCAS', N'GIMENEZ', 1, 34147362, 35215698, N'LUCAS.GIMENEZ@hotmail.com', 2, 75)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (76, N'JOAN', N'MONTERO', 2, 34246007, 53215486, N'JOAN.MONTERO@hotmail.com', 2, 76)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (77, N'FELIX', N'HIDALGO', 1, 34344652, 53215487, N'FELIX.HIDALGO@hotmail.com', 2, 77)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (78, N'AITOR', N'LORENZO', 1, 34443297, 53215488, N'AITOR.LORENZO@hotmail.com', 2, 78)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (79, N'HECTOR', N'SANTIAGO', 1, 34541942, 53215489, N'HECTOR.SANTIAGO@hotmail.com', 1, 79)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (80, N'IKER', N'IBAÐEZ', 1, 34640587, 53215490, N'IKER.IBAÐEZ@hotmail.com', 1, 80)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (81, N'ALEX', N'DURAN', 3, 34739232, 53215491, N'ALEX.DURAN@hotmail.com', 1, 81)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (82, N'JUAN FRANCISCO', N'BENITEZ', 1, 34837877, 53215492, N'JUAN FRANCISCO.BENITEZ@hotmail.com', 3, 82)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (83, N'JOSE CARLOS', N'FERRER', 1, 34936522, 53215493, N'JOSE CARLOS.FERRER@hotmail.com', 2, 83)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (84, N'JOSEP', N'ARIAS', 1, 35035167, 53215494, N'JOSEP.ARIAS@hotmail.com', 4, 50)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (85, N'SEBASTIAN', N'MORA', 4, 35133812, 53215495, N'SEBASTIAN.MORA@hotmail.com', 4, 51)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (86, N'CESAR', N'CARMONA', 4, 35232457, 53215496, N'CESAR.CARMONA@hotmail.com', 3, 52)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (87, N'MARIANO', N'VICENTE', 3, 35331102, 53215497, N'MARIANO.VICENTE@gmail.com', 1, 53)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (88, N'ALFREDO', N'ROJAS', 3, 35429747, 53215498, N'ALFREDO.ROJAS@gmail.com', 3, 54)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (89, N'DOMINGO', N'SOTO', 3, 35528392, 53215499, N'DOMINGO.SOTO@gmail.com', 1, 55)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (90, N'MATEO', N'CRESPO', 3, 35627037, 53215500, N'MATEO.CRESPO@gmail.com', 1, 56)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (91, N'JOSE ANGEL', N'ROMAN', 1, 35725682, 53215501, N'JOSE ANGEL.ROMAN@gmail.com', 2, 57)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (92, N'RODRIGO', N'PASTOR', 2, 35824327, 53215502, N'RODRIGO.PASTOR@gmail.com', 1, 58)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (93, N'VICTOR MANUEL', N'VELASCO', 1, 35922972, 53215503, N'VICTOR MANUEL.VELASCO@gmail.com', 1, 59)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (94, N'FELIPE', N'PARRA', 1, 36021617, 53215504, N'FELIPE.PARRA@gmail.com', 1, 60)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (95, N'JOSE IGNACIO', N'SAEZ', 2, 36120262, 53215505, N'JOSE IGNACIO.SAEZ@gmail.com', 2, 61)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (96, N'LUIS MIGUEL', N'MOYA', 1, 36218907, 53215506, N'LUIS MIGUEL.MOYA@gmail.com', 3, 62)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (97, N'JOSE FRANCISCO', N'BRAVO', 4, 36317552, 53215507, N'JOSE FRANCISCO.BRAVO@gmail.com', 4, 97)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (98, N'XAVIER', N'SOLER', 4, 36416197, 53215508, N'XAVIER.SOLER@gmail.com', 1, 98)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (99, N'JUAN LUIS', N'GALLARDO', 1, 36514842, 53215509, N'JUAN LUIS.GALLARDO@gmail.com', 1, 99)
GO
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (100, N'ALBERT', N'RIVERA', 2, 36613487, 53215510, N'ALBERT.RIVERA@gmail.com', 1, 100)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (101, N'MARIA CARMEN', N'GIMENEZ', 3, 36712132, 53215511, N'MARIA CARMEN.GIMENEZ@gmail.com', 1, 101)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (102, N'MARIA', N'MONTERO', 4, 36810777, 53215512, N'MARIA.MONTERO@gmail.com', 2, 102)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (103, N'CARMEN', N'HIDALGO', 4, 36909422, 53215513, N'CARMEN.HIDALGO@gmail.com', 2, 103)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (104, N'ANA MARIA', N'LORENZO', 1, 37008067, 53215514, N'ANA MARIA.LORENZO@gmail.com', 2, 104)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (105, N'MARIA PILAR', N'SANTIAGO', 1, 37106712, 53215515, N'MARIA PILAR.SANTIAGO@gmail.com', 2, 105)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (106, N'LAURA', N'IBAÐEZ', 1, 37205357, 53215516, N'LAURA.IBAÐEZ@gmail.com', 1, 106)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (107, N'JOSEFA', N'DURAN', 1, 37304002, 53215517, N'JOSEFA.DURAN@gmail.com', 1, 107)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (108, N'ISABEL', N'BENITEZ', 2, 37402647, 53215518, N'ISABEL.BENITEZ@gmail.com', 1, 108)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (109, N'MARIA DOLORES', N'FERRER', 2, 37501292, 53215519, N'MARIA DOLORES.FERRER@gmail.com', 3, 109)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (110, N'MARIA TERESA', N'GIMENEZ', 2, 37599937, 53215520, N'MARIA TERESA.GIMENEZ@yahoo.com', 2, 110)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (111, N'ANA', N'MONTERO', 2, 37698582, 53215521, N'ANA.MONTERO@yahoo.com', 4, 111)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (112, N'MARTA', N'HIDALGO', 1, 37797227, 53215522, N'MARTA.HIDALGO@yahoo.com', 4, 112)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (113, N'CRISTINA', N'NUÐEZ', 1, 37895872, 53215523, N'CRISTINA.NUÐEZ@yahoo.com', 3, 113)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (114, N'MARIA ANGELES', N'SANZ', 1, 37994517, 53215524, N'MARIA ANGELES.SANZ@yahoo.com', 1, 114)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (115, N'LUCIA', N'MEDINA', 3, 38093162, 53215525, N'LUCIA.MEDINA@yahoo.com', 3, 115)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (116, N'MARIA ISABEL', N'IGLESIAS', 2, 38191807, 36589784, N'MARIA ISABEL.IGLESIAS@yahoo.com', 1, 116)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (117, N'MARIA JOSE', N'CASTILLO', 4, 38290452, 36589785, N'MARIA JOSE.CASTILLO@yahoo.com', 1, 117)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (118, N'FRANCISCA', N'CORTES', 4, 38389097, 36589786, N'FRANCISCA.CORTES@yahoo.com', 1, 118)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (119, N'ANTONIA', N'GARRIDO', 3, 38487742, 36589787, N'ANTONIA.GARRIDO@yahoo.com', 2, 119)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (120, N'DOLORES', N'SANTOS', 1, 38586387, 36589788, N'DOLORES.SANTOS@yahoo.com', 1, 120)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (121, N'SARA', N'GUERRERO', 3, 38685032, 36589789, N'SARA.GUERRERO@yahoo.com', 2, 121)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (122, N'PAULA', N'LOZANO', 1, 38783677, 36589790, N'PAULA.LOZANO@yahoo.com', 3, 122)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (123, N'ELENA', N'CANO', 1, 38882322, 36589791, N'ELENA.CANO@yahoo.com', 4, 123)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (124, N'MARIA LUISA', N'MENDEZ', 2, 38980967, 36589792, N'MARIA LUISA.MENDEZ@yahoo.com', 1, 124)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (125, N'RAQUEL', N'CRUZ', 1, 39079612, 36589793, N'RAQUEL.CRUZ@yahoo.com', 1, 125)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (126, N'ROSA MARIA', N'IGLESIAS', 1, 39178257, 36589794, N'ROSA MARIA.IGLESIAS@yahoo.com', 1, 126)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (127, N'MANUELA', N'CASTILLO', 1, 39276902, 36589795, N'MANUELA.CASTILLO@yahoo.com', 1, 127)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (128, N'PILAR', N'CORTES', 1, 39375547, 36589796, N'PILAR.CORTES@yahoo.com', 2, 128)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (129, N'CONCEPCION', N'GARRIDO', 3, 39474192, 36589797, N'CONCEPCION.GARRIDO@yahoo.com', 2, 129)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (130, N'MARIA JESUS', N'SANTOS', 1, 39572837, 36589798, N'MARIA JESUS.SANTOS@yahoo.com', 2, 130)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (131, N'MERCEDES', N'GUERRERO', 1, 39671482, 36589799, N'MERCEDES.GUERRERO@yahoo.com', 2, 131)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (132, N'JULIA', N'LOZANO', 1, 20148965, 36589800, N'JULIA.LOZANO@yahoo.com', 1, 132)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (133, N'BEATRIZ', N'CANO', 4, 20323663, 36589801, N'BEATRIZ.CANO@yahoo.com', 1, 2)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (134, N'ALBA', N'MENDEZ', 4, 20498361, 36589802, N'ALBA.MENDEZ@yahoo.com', 1, 134)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (135, N'SILVIA', N'CRUZ', 3, 20673059, 36589803, N'SILVIA.CRUZ@yahoo.com', 3, 135)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (136, N'NURIA', N'FERRER', 3, 20847757, 36589804, N'NURIA.FERRER@yahoo.com', 2, 136)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (137, N'IRENE', N'ARIAS', 3, 21022455, 36589805, N'IRENE.ARIAS@yahoo.com', 4, 137)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (138, N'ROSARIO', N'MARTIN', 3, 21197153, 36589806, N'ROSARIO.MARTIN@yahoo.com', 4, 138)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (139, N'PATRICIA', N'GARCIA', 1, 21371851, 36589807, N'PATRICIA.GARCIA@yahoo.com', 3, 139)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (140, N'JUANA', N'JIMENEZ', 2, 21546549, 36589808, N'JUANA.JIMENEZ@yahoo.com', 1, 140)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (141, N'TERESA', N'GONZALEZ', 1, 21721247, 36589809, N'TERESA.GONZALEZ@yahoo.com', 3, 141)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (142, N'ENCARNACION', N'SANCHEZ', 1, 21895945, 36589810, N'ENCARNACION.SANCHEZ@yahoo.com', 1, 142)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (143, N'ANDREA', N'HERNANDEZ', 2, 22070643, 36589811, N'ANDREA.HERNANDEZ@yahoo.com', 1, 143)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (144, N'ROCIO', N'LOPEZ', 1, 22245341, 36589812, N'ROCIO.LOPEZ@yahoo.com', 2, 144)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (145, N'MONTSERRAT', N'RODRIGUEZ', 4, 22420039, 36589813, N'MONTSERRAT.RODRIGUEZ@yahoo.com', 1, 145)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (146, N'MONICA', N'GOMEZ', 4, 22594737, 36589814, N'MONICA.GOMEZ@yahoo.com', 1, 146)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (147, N'ALICIA', N'FERNANDEZ', 1, 22769435, 36589815, N'ALICIA.FERNANDEZ@yahoo.com', 1, 147)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (148, N'MARIA MAR', N'MARTIN', 2, 22944133, 36589816, N'MARIA MAR.MARTIN@yahoo.com', 2, 148)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (149, N'SANDRA', N'GARCIA', 3, 23118831, 36589817, N'SANDRA.GARCIA@yahoo.com', 3, 149)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (150, N'SONIA', N'JIMENEZ', 4, 23293529, 36589818, N'SONIA.JIMENEZ@yahoo.com', 4, 150)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (151, N'MARINA', N'GONZALEZ', 1, 23468227, 36589819, N'MARINA.GONZALEZ@yahoo.com', 1, 151)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (152, N'ROSA', N'SANCHEZ', 2, 23642925, 36589820, N'ROSA.SANCHEZ@yahoo.com', 1, 152)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (153, N'ANGELA', N'HERNANDEZ', 3, 23817623, 36589821, N'ANGELA.HERNANDEZ@yahoo.com', 1, 153)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (154, N'SUSANA', N'LOPEZ', 4, 23992321, 36589822, N'SUSANA.LOPEZ@yahoo.com', 1, 154)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (155, N'NATALIA', N'RODRIGUEZ', 1, 24167019, 36589823, N'NATALIA.RODRIGUEZ@yahoo.com', 2, 155)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (156, N'YOLANDA', N'GOMEZ', 1, 24341717, 36589824, N'YOLANDA.GOMEZ@yahoo.com', 2, 156)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (157, N'MARGARITA', N'FERNANDEZ', 1, 24516415, 36589825, N'MARGARITA.FERNANDEZ@yahoo.com', 2, 157)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (158, N'SOFIA', N'MUÐOZ', 1, 24691113, 36589826, N'SOFIA.MUÐOZ@yahoo.com', 2, 158)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (159, N'CLAUDIA', N'DIAZ', 2, 24865811, 36589827, N'CLAUDIA.DIAZ@yahoo.com', 1, 159)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (160, N'MARIA JOSEFA', N'PEREZ', 2, 25040509, 36589828, N'MARIA JOSEFA.PEREZ@yahoo.com', 1, 160)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (161, N'EVA', N'BLAZQUEZ', 2, 25215207, 36589829, N'EVA.BLAZQUEZ@yahoo.com', 1, 161)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (162, N'CARLA', N'GUTIERREZ', 2, 25389905, 36589830, N'CARLA.GUTIERREZ@yahoo.com', 3, 162)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (163, N'MARIA ROSARIO', N'MARTINEZ', 1, 25564603, 36589831, N'MARIA ROSARIO.MARTINEZ@yahoo.com', 2, 163)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (164, N'INMACULADA', N'ALONSO', 1, 25739301, 36589832, N'INMACULADA.ALONSO@yahoo.com', 4, 164)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (165, N'MARIA MERCEDES', N'MORENO', 1, 25913999, 36589833, N'MARIA MERCEDES.MORENO@gmail.com', 4, 165)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (166, N'ANA ISABEL', N'SAEZ', 3, 26088697, 36589834, N'ANA ISABEL.SAEZ@gmail.com', 3, 166)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (167, N'NOELIA', N'ALVAREZ', 6, 26263395, 36589835, N'NOELIA.ALVAREZ@gmail.com', 1, 167)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (168, N'ESTHER', N'GIL', 5, 26438093, 36589836, N'ESTHER.GIL@gmail.com', 3, 168)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (169, N'VERONICA', N'GALAN', 5, 26612791, 36589837, N'VERONICA.GALAN@gmail.com', 1, 169)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (170, N'NEREA', N'BLANCO', 6, 26787489, 36589838, N'NEREA.BLANCO@gmail.com', 1, 170)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (171, N'CAROLINA', N'NIETO', 6, 26962187, 36589839, N'CAROLINA.NIETO@gmail.com', 2, 171)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (172, N'DANIELA', N'DOMINGUEZ', 6, 27136885, 36589840, N'DANIELA.DOMINGUEZ@gmail.com', 1, 172)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (173, N'INES', N'SANZ', 6, 27311583, 36589841, N'INES.SANZ@gmail.com', 1, 173)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (174, N'EVA MARIA', N'HERRERO', 6, 27486281, 36589842, N'EVA MARIA.HERRERO@gmail.com', 1, 43)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (175, N'MARIA VICTORIA', N'SERRANO', 5, 27660979, 36589843, N'MARIA VICTORIA.SERRANO@gmail.com', 1, 44)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (176, N'ANGELES', N'SAN SEGUNDO', 5, 27835677, 36589844, N'ANGELES.SAN SEGUNDO@gmail.com', 3, 45)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (177, N'MIRIAM', N'RUIZ', 5, 28010375, 36589845, N'MIRIAM.RUIZ@gmail.com', 1, 46)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (178, N'LORENA', N'ARRIBAS', 5, 28185073, 36589846, N'LORENA.ARRIBAS@gmail.com', 2, 47)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (179, N'MARIA ROSA', N'HERRAEZ', 6, 28359771, 36589847, N'MARIA ROSA.HERRAEZ@gmail.com', 3, 179)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (180, N'ANA BELEN', N'DELGADO', 6, 28534469, 36589848, N'ANA BELEN.DELGADO@gmail.com', 4, 180)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (181, N'MARIA ELENA', N'GALLEGO', 5, 28709167, 36589849, N'MARIA ELENA.GALLEGO@gmail.com', 1, 181)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (182, N'MARTINA', N'HERRANZ', 1, 28883865, 36589850, N'MARTINA.HERRANZ@gmail.com', 1, 182)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (183, N'VICTORIA', N'ARROYO', 1, 29058563, 36589851, N'VICTORIA.ARROYO@gmail.com', 2, 43)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (184, N'MARIA CONCEPCION', N'VAZQUEZ', 4, 29233261, 36589852, N'MARIA CONCEPCION.VAZQUEZ@gmail.com', 3, 44)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (185, N'AMPARO', N'PRIETO', 4, 29407959, 36589853, N'AMPARO.PRIETO@gmail.com', 4, 45)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (186, N'ALEJANDRA', N'NUÐEZ', 3, 11023565, 36589854, N'ALEJANDRA.NUÐEZ@gmail.com', 1, 46)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (187, N'MARIA ANTONIA', N'RAMOS', 3, 11122308, 36589855, N'MARIA ANTONIA.RAMOS@gmail.com', 1, 47)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (188, N'LIDIA', N'PASCUAL', 3, 11221051, 36589856, N'LIDIA.PASCUAL@gmail.com', 1, 43)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (189, N'CELIA', N'VELAYOS', 3, 11319794, 36589857, N'CELIA.VELAYOS@gmail.com', 1, 44)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (190, N'CATALINA', N'ESTEBAN', 1, 11418537, 36589858, N'CATALINA.ESTEBAN@gmail.com', 2, 45)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (191, N'MARIA NIEVES', N'PINDADO', 2, 11517280, 36589859, N'MARIA NIEVES.PINDADO@gmail.com', 2, 46)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (192, N'FATIMA', N'CALVO', 1, 11616023, 36589860, N'FATIMA.CALVO@gmail.com', 2, 47)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (193, N'AINHOA', N'VAQUERO', 6, 11714766, 36589861, N'AINHOA.VAQUERO@gmail.com', 2, 1)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (194, N'OLGA', N'IZQUIERDO', 5, 11813509, 36589862, N'OLGA.IZQUIERDO@gmail.com', 1, 1)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (195, N'CONSUELO', N'MENDEZ', 5, 11912252, 36589863, N'CONSUELO.MENDEZ@gmail.com', 1, 1)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (196, N'CLARA', N'YUSTE', 6, 12010995, 36589864, N'CLARA.YUSTE@gmail.com', 1, 3)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (197, N'GLORIA', N'MENDOZA', 6, 12109738, 36589865, N'GLORIA.MENDOZA@gmail.com', 2, 3)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (198, N'MARIA CRISTINA', N'CARRASCO', 6, 12208481, 36589866, N'MARIA CRISTINA.CARRASCO@gmail.com', 3, 3)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (199, N'MARIA SOLEDAD', N'DIEZ', 6, 12307224, 36589867, N'MARIA SOLEDAD.DIEZ@gmail.com', 4, 2)
GO
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (200, N'ADRIANA', N'AGUILAR', 6, 12405967, 36589868, N'ADRIANA.AGUILAR@gmail.com', 1, 3)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (201, N'Martín', N'Ferraro', 1, 40153621, 2824569, N'ferraromat@live.com.ar', 1, 277)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (202, N'Juan', N'Martinez', 1, 27524351, 3491412, N'juanMart@live.com.ar', 1, 278)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (203, N'Luca', N'Uberti', 1, 37652451, 34914451, N'UberLuca@live.com.ar', 1, 279)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (204, N'Leonel', N'Ortiz', 1, 44023678, 441331, N'leoOrtiz@live.com.ar', 1, 280)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (206, N'juan', N'cre', 5, 24315, 45682, N'juanupla', 2, 43)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (207, N'juanupla', N'json', 1, 34914, 215, N'juanuplaemail', 1, 1)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (208, N'Lautaro', N'Correa', 1, 3872435, 351421, N'LautyCorreaEmail', 1, 1)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (209, N'Kumiec', N'Ezequiel', 1, 34092143, 2332, N'KumiecEzecEmail', 1, 3)
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [id_tipo_doc], [num_doc], [telefono], [email], [id_tipo_cliente], [id_barrio]) VALUES (210, N'Agos', N'Acosta', 1, 43251687, 3516545, N'AgosAcosEmail', 1, 2)
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[detalles_facturas] ON 

INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1, 596, 29, 3, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2, 626, 12, 3, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (3, 347, 4, 8, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (4, 166, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (5, 57, 20, 10, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (6, 659, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (7, 644, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (8, 958, 22, 4, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (9, 141, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (10, 587, 5, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (11, 313, 15, 6, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (12, 842, 6, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (13, 130, 23, 9, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (14, 8, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (15, 587, 2, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (16, 421, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (17, 770, 19, 6, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (18, 179, 10, 3, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (19, 479, 30, 9, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (20, 996, 18, 8, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (21, 707, 29, 1, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (22, 858, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (23, 483, 30, 7, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (24, 152, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (25, 963, 1, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (26, 154, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (27, 140, 18, 2, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (28, 74, 1, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (29, 192, 24, 9, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (30, 95, 17, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (31, 327, 22, 4, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (32, 316, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (33, 446, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (34, 538, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (35, 345, 30, 10, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (36, 909, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (37, 840, 6, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (38, 434, 2, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (39, 943, 11, 10, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (40, 966, 30, 7, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (41, 239, 22, 5, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (42, 167, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (43, 335, 10, 4, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (44, 404, 27, 6, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (45, 700, 30, 6, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (46, 685, 17, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (47, 838, 28, 9, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (48, 267, 26, 9, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (49, 508, 26, 8, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (50, 863, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (51, 694, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (52, 11, 11, 8, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (53, 791, 5, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (54, 1, 23, 3, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (55, 369, 19, 10, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (56, 178, 22, 7, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (57, 391, 16, 10, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (58, 323, 13, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (59, 598, 22, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (60, 244, 2, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (61, 992, 15, 2, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (62, 325, 22, 8, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (63, 421, 8, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (64, 184, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (65, 865, 15, 7, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (66, 437, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (67, 759, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (68, 464, 17, 7, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (69, 886, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (70, 627, 8, 5, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (71, 54, 26, 1, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (72, 99, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (73, 781, 2, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (74, 725, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (75, 38, 14, 6, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (76, 714, 5, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (77, 190, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (78, 275, 14, 1, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (79, 536, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (80, 848, 27, 7, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (81, 973, 12, 3, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (82, 123, 11, 1, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (83, 386, 30, 3, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (84, 68, 30, 9, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (85, 855, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (86, 987, 8, 3, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (87, 491, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (88, 392, 13, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (89, 811, 13, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (90, 925, 6, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (91, 234, 30, 9, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (92, 948, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (93, 201, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (94, 287, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (95, 371, 22, 8, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (96, 206, 5, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (97, 985, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (98, 872, 1, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (99, 894, 12, 9, CAST(3600.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (100, 126, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (101, 250, 18, 8, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (102, 242, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (103, 487, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (104, 323, 26, 5, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (105, 749, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (106, 293, 30, 2, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (107, 652, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (108, 592, 8, 5, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (109, 509, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (110, 605, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (111, 2, 21, 8, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (112, 963, 24, 3, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (113, 941, 17, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (114, 971, 28, 8, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (115, 306, 14, 8, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (116, 474, 18, 2, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (117, 120, 12, 7, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (118, 456, 29, 5, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (119, 332, 28, 8, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (120, 905, 26, 2, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (121, 791, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (122, 253, 25, 3, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (123, 285, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (124, 506, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (125, 159, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (126, 270, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (127, 829, 15, 6, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (128, 777, 3, 1, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (129, 484, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (130, 422, 25, 3, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (131, 985, 12, 5, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (132, 950, 7, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (133, 738, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (134, 412, 21, 8, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (135, 7, 20, 10, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (136, 609, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (137, 960, 13, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (138, 562, 10, 1, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (139, 701, 28, 4, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (140, 309, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (141, 780, 19, 9, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (142, 151, 30, 5, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (143, 276, 23, 4, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (144, 664, 22, 2, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (145, 446, 29, 7, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (146, 638, 1, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (147, 129, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (148, 994, 30, 9, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (149, 63, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (150, 936, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (151, 666, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (152, 796, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (153, 47, 2, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (154, 344, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (155, 86, 19, 5, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (156, 771, 26, 4, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (157, 831, 17, 7, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (158, 410, 13, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (159, 83, 18, 1, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (160, 901, 2, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (161, 207, 18, 2, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (162, 301, 17, 6, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (163, 525, 1, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (164, 638, 20, 3, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (165, 466, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (166, 20, 13, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (167, 461, 22, 9, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (168, 982, 30, 1, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (169, 35, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (170, 589, 12, 4, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (171, 174, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (172, 188, 14, 3, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (173, 473, 5, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (174, 822, 10, 3, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (175, 622, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (176, 926, 30, 6, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (177, 728, 5, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (178, 450, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (179, 675, 23, 8, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (180, 981, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (181, 764, 22, 3, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (182, 524, 30, 5, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (183, 210, 12, 9, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (184, 83, 9, 8, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (185, 417, 21, 4, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (186, 173, 21, 7, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (187, 16, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (188, 492, 4, 7, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (189, 32, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (190, 66, 23, 9, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (191, 74, 12, 5, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (192, 556, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (193, 794, 22, 2, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (194, 900, 17, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (195, 200, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (196, 986, 16, 10, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (197, 419, 2, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (198, 656, 14, 8, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (199, 722, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (200, 126, 28, 9, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (201, 160, 30, 8, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (202, 592, 27, 1, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (203, 241, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (204, 883, 14, 1, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (205, 719, 16, 2, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (206, 736, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (207, 226, 1, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (208, 927, 24, 5, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (209, 327, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (210, 586, 11, 5, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (211, 182, 26, 6, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (212, 417, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (213, 279, 24, 8, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (214, 175, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (215, 678, 21, 2, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (216, 844, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (217, 703, 26, 10, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (218, 719, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (219, 818, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (220, 35, 28, 4, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (221, 163, 10, 2, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (222, 647, 7, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (223, 819, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (224, 978, 3, 1, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (225, 727, 26, 5, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (226, 279, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (227, 21, 28, 7, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (228, 791, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (229, 906, 7, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (230, 928, 27, 6, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (231, 964, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (232, 700, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (233, 928, 3, 10, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (234, 199, 1, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (235, 967, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (236, 851, 24, 5, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (237, 77, 3, 1, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (238, 315, 5, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (239, 472, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (240, 807, 9, 1, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (241, 469, 20, 7, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (242, 552, 1, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (243, 81, 6, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (244, 496, 19, 2, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (245, 306, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (246, 697, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (247, 696, 9, 4, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (248, 841, 12, 10, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (249, 427, 3, 3, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (250, 958, 23, 4, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (251, 608, 22, 7, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (252, 198, 14, 5, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (253, 418, 7, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (254, 84, 20, 6, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (255, 650, 25, 4, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (256, 9, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (257, 304, 2, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (258, 579, 6, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (259, 126, 3, 10, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (260, 831, 20, 6, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (261, 761, 19, 4, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (262, 477, 4, 3, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (263, 847, 23, 8, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (264, 802, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (265, 648, 21, 4, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (266, 232, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (267, 761, 16, 1, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (268, 227, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (269, 723, 14, 9, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (270, 473, 5, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (271, 245, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (272, 645, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (273, 86, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (274, 392, 3, 1, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (275, 665, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (276, 836, 23, 3, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (277, 373, 11, 8, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (278, 555, 30, 10, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (279, 866, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (280, 95, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (281, 171, 20, 3, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (282, 803, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (283, 773, 5, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (284, 756, 8, 9, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (285, 525, 1, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (286, 984, 12, 2, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (287, 178, 22, 9, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (288, 992, 11, 6, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (289, 765, 3, 5, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (290, 83, 27, 10, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (291, 301, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (292, 852, 26, 4, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (293, 311, 11, 2, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (294, 544, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (295, 266, 26, 10, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (296, 562, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (297, 139, 21, 2, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (298, 353, 15, 8, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (299, 271, 23, 7, CAST(3999.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (300, 93, 19, 2, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (301, 364, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (302, 150, 13, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (303, 561, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (304, 499, 6, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (305, 514, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (306, 731, 1, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (307, 571, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (308, 259, 2, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (309, 190, 14, 3, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (310, 309, 12, 2, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (311, 796, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (312, 493, 30, 7, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (313, 739, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (314, 935, 20, 10, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (315, 911, 1, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (316, 613, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (317, 804, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (318, 549, 15, 8, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (319, 159, 24, 7, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (320, 774, 28, 9, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (321, 924, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (322, 342, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (323, 661, 28, 4, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (324, 110, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (325, 960, 6, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (326, 614, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (327, 975, 12, 10, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (328, 678, 3, 4, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (329, 608, 30, 4, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (330, 540, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (331, 688, 15, 4, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (332, 423, 4, 9, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (333, 608, 2, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (334, 665, 14, 3, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (335, 291, 30, 6, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (336, 372, 6, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (337, 680, 4, 8, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (338, 752, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (339, 611, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (340, 711, 22, 2, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (341, 858, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (342, 78, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (343, 956, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (344, 596, 3, 1, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (345, 357, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (346, 881, 27, 1, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (347, 909, 30, 7, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (348, 475, 23, 3, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (349, 642, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (350, 179, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (351, 390, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (352, 9, 26, 7, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (353, 239, 13, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (354, 906, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (355, 479, 25, 9, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (356, 976, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (357, 785, 13, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (358, 57, 20, 9, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (359, 466, 14, 4, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (360, 767, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (361, 129, 29, 4, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (362, 457, 19, 8, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (363, 521, 25, 8, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (364, 806, 28, 1, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (365, 764, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (366, 207, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (367, 400, 19, 9, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (368, 263, 8, 10, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (369, 44, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (370, 101, 27, 10, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (371, 551, 3, 8, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (372, 152, 1, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (373, 601, 8, 6, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (374, 733, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (375, 667, 2, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (376, 29, 1, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (377, 577, 21, 5, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (378, 576, 18, 6, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (379, 736, 15, 2, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (380, 296, 12, 8, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (381, 52, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (382, 470, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (383, 111, 10, 8, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (384, 355, 2, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (385, 708, 20, 6, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (386, 76, 9, 4, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (387, 50, 1, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (388, 793, 18, 9, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (389, 312, 6, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (390, 100, 29, 4, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (391, 149, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (392, 872, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (393, 941, 26, 2, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (394, 775, 16, 7, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (395, 318, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (396, 712, 12, 3, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (397, 561, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (398, 221, 7, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (399, 759, 4, 2, CAST(1500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (400, 501, 27, 10, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (401, 61, 7, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (402, 698, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (403, 772, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (404, 187, 15, 1, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (405, 144, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (406, 726, 23, 3, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (407, 702, 15, 2, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (408, 904, 19, 6, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (409, 329, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (410, 644, 21, 1, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (411, 852, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (412, 639, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (413, 739, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (414, 560, 30, 10, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (415, 725, 18, 1, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (416, 268, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (417, 542, 12, 4, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (418, 784, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (419, 700, 22, 5, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (420, 826, 20, 3, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (421, 264, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (422, 915, 16, 5, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (423, 105, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (424, 373, 5, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (425, 209, 14, 6, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (426, 80, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (427, 253, 26, 10, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (428, 946, 19, 10, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (429, 92, 10, 3, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (430, 976, 11, 7, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (431, 531, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (432, 528, 22, 8, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (433, 370, 26, 9, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (434, 474, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (435, 954, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (436, 595, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (437, 18, 25, 3, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (438, 439, 6, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (439, 142, 23, 7, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (440, 159, 4, 8, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (441, 303, 3, 3, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (442, 114, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (443, 883, 11, 6, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (444, 756, 22, 2, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (445, 697, 30, 9, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (446, 209, 30, 3, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (447, 125, 29, 9, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (448, 811, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (449, 992, 4, 9, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (450, 431, 29, 4, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (451, 358, 8, 10, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (452, 493, 21, 10, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (453, 700, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (454, 51, 25, 9, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (455, 535, 9, 10, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (456, 593, 12, 10, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (457, 98, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (458, 92, 7, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (459, 142, 12, 7, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (460, 442, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (461, 913, 9, 9, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (462, 208, 14, 9, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (463, 316, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (464, 623, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (465, 44, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (466, 576, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (467, 30, 20, 7, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (468, 885, 24, 1, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (469, 704, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (470, 798, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (471, 566, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (472, 796, 27, 8, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (473, 539, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (474, 873, 19, 5, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (475, 43, 30, 1, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (476, 318, 19, 10, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (477, 794, 20, 6, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (478, 424, 4, 7, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (479, 213, 5, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (480, 726, 6, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (481, 940, 29, 4, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (482, 49, 6, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (483, 808, 4, 2, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (484, 374, 13, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (485, 55, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (486, 665, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (487, 568, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (488, 645, 22, 4, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (489, 296, 9, 8, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (490, 521, 10, 10, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (491, 900, 19, 10, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (492, 740, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (493, 75, 5, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (494, 66, 5, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (495, 115, 16, 7, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (496, 211, 6, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (497, 8, 21, 8, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (498, 602, 9, 4, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (499, 252, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (500, 544, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (501, 213, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (502, 375, 14, 4, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (503, 644, 15, 8, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (504, 211, 30, 10, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (505, 776, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (506, 92, 12, 2, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (507, 882, 15, 6, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (508, 796, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (509, 585, 19, 4, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (510, 567, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (511, 193, 29, 9, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (512, 42, 1, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (513, 468, 10, 3, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (514, 864, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (515, 872, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (516, 567, 5, 10, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (517, 765, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (518, 256, 12, 2, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (519, 757, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (520, 882, 7, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (521, 570, 17, 6, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (522, 895, 12, 9, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (523, 99, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (524, 558, 7, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (525, 467, 13, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (526, 853, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (527, 93, 15, 3, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (528, 193, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (529, 92, 22, 7, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (530, 368, 17, 10, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (531, 125, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (532, 295, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (533, 107, 18, 3, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (534, 823, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (535, 624, 29, 3, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (536, 268, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (537, 299, 10, 3, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (538, 880, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (539, 571, 14, 3, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (540, 536, 12, 3, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (541, 483, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (542, 494, 10, 2, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (543, 253, 21, 5, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (544, 588, 2, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (545, 28, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (546, 436, 17, 6, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (547, 707, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (548, 973, 15, 7, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (549, 467, 15, 3, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (550, 607, 22, 3, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (551, 215, 18, 3, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (552, 561, 4, 5, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (553, 153, 27, 1, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (554, 864, 3, 3, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (555, 496, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (556, 8, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (557, 266, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (558, 489, 1, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (559, 720, 26, 6, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (560, 533, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (561, 403, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (562, 611, 28, 7, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (563, 658, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (564, 14, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (565, 55, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (566, 480, 5, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (567, 805, 6, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (568, 905, 16, 2, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (569, 775, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (570, 886, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (571, 790, 25, 10, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (572, 798, 26, 7, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (573, 615, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (574, 748, 14, 4, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (575, 760, 4, 7, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (576, 171, 12, 8, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (577, 592, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (578, 745, 2, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (579, 876, 6, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (580, 471, 11, 2, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (581, 103, 6, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (582, 394, 26, 4, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (583, 779, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (584, 984, 26, 2, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (585, 732, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (586, 334, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (587, 110, 3, 10, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (588, 620, 1, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (589, 120, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (590, 23, 13, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (591, 488, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (592, 707, 5, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (593, 323, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (594, 535, 30, 4, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (595, 3, 21, 2, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (596, 896, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (597, 512, 24, 8, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (598, 861, 30, 3, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (599, 942, 3, 9, CAST(7500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (600, 72, 24, 2, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (601, 398, 26, 1, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (602, 756, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (603, 967, 7, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (604, 927, 30, 5, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (605, 215, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (606, 927, 1, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (607, 946, 10, 10, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (608, 380, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (609, 879, 2, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (610, 487, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (611, 272, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (612, 263, 18, 4, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (613, 300, 21, 1, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (614, 978, 5, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (615, 257, 6, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (616, 144, 13, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (617, 844, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (618, 982, 3, 5, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (619, 458, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (620, 323, 27, 6, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (621, 276, 9, 10, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (622, 882, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (623, 900, 2, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (624, 685, 4, 3, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (625, 619, 13, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (626, 885, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (627, 757, 24, 1, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (628, 340, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (629, 323, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (630, 337, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (631, 629, 2, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (632, 712, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (633, 701, 16, 4, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (634, 229, 19, 4, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (635, 332, 7, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (636, 8, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (637, 87, 12, 4, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (638, 852, 5, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (639, 140, 24, 1, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (640, 701, 6, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (641, 692, 15, 9, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (642, 557, 26, 1, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (643, 9, 30, 8, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (644, 303, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (645, 610, 23, 3, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (646, 359, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (647, 983, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (648, 479, 24, 5, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (649, 771, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (650, 658, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (651, 384, 18, 8, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (652, 123, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (653, 697, 16, 7, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (654, 943, 12, 3, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (655, 75, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (656, 221, 18, 9, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (657, 256, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (658, 76, 6, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (659, 995, 5, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (660, 22, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (661, 324, 18, 1, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (662, 540, 1, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (663, 471, 27, 3, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (664, 326, 14, 8, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (665, 971, 14, 9, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (666, 956, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (667, 454, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (668, 978, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (669, 442, 19, 4, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (670, 923, 12, 8, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (671, 386, 14, 9, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (672, 682, 8, 5, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (673, 781, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (674, 223, 8, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (675, 785, 18, 1, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (676, 363, 10, 9, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (677, 802, 10, 2, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (678, 990, 17, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (679, 652, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (680, 961, 6, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (681, 141, 20, 9, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (682, 178, 23, 8, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (683, 76, 9, 3, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (684, 789, 15, 7, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (685, 978, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (686, 651, 21, 4, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (687, 441, 10, 6, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (688, 406, 4, 5, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (689, 154, 17, 10, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (690, 244, 3, 4, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (691, 920, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (692, 806, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (693, 182, 9, 8, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (694, 509, 17, 10, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (695, 790, 25, 8, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (696, 339, 15, 2, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (697, 949, 6, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (698, 534, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (699, 618, 3, 1, CAST(7500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (700, 770, 5, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (701, 972, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (702, 120, 5, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (703, 245, 6, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (704, 457, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (705, 820, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (706, 189, 14, 4, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (707, 875, 23, 9, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (708, 533, 22, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (709, 294, 12, 1, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (710, 360, 9, 3, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (711, 31, 25, 4, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (712, 164, 7, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (713, 711, 13, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (714, 828, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (715, 342, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (716, 80, 8, 9, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (717, 655, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (718, 968, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (719, 866, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (720, 166, 12, 7, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (721, 207, 29, 4, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (722, 119, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (723, 761, 4, 9, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (724, 209, 13, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (725, 103, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (726, 132, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (727, 328, 6, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (728, 419, 24, 2, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (729, 882, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (730, 195, 24, 2, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (731, 49, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (732, 956, 30, 8, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (733, 303, 24, 3, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (734, 81, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (735, 982, 28, 2, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (736, 226, 15, 7, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (737, 628, 27, 7, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (738, 292, 27, 6, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (739, 611, 6, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (740, 195, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (741, 620, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (742, 693, 20, 7, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (743, 239, 2, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (744, 476, 12, 8, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (745, 875, 12, 10, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (746, 514, 19, 5, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (747, 65, 26, 10, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (748, 131, 8, 10, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (749, 614, 26, 2, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (750, 481, 11, 10, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (751, 443, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (752, 597, 24, 9, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (753, 25, 8, 3, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (754, 487, 6, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (755, 687, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (756, 919, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (757, 542, 15, 6, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (758, 68, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (759, 104, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (760, 691, 7, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (761, 546, 29, 5, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (762, 898, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (763, 809, 1, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (764, 225, 3, 8, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (765, 850, 10, 2, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (766, 739, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (767, 429, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (768, 318, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (769, 745, 12, 7, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (770, 638, 13, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (771, 780, 12, 10, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (772, 976, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (773, 790, 25, 3, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (774, 749, 26, 3, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (775, 78, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (776, 533, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (777, 856, 22, 10, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (778, 567, 12, 8, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (779, 861, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (780, 274, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (781, 63, 14, 4, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (782, 915, 30, 10, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (783, 48, 2, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (784, 176, 26, 5, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (785, 102, 9, 2, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (786, 721, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (787, 129, 14, 8, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (788, 190, 4, 2, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (789, 425, 26, 3, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (790, 368, 28, 4, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (791, 34, 3, 3, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (792, 460, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (793, 574, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (794, 702, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (795, 506, 25, 10, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (796, 813, 12, 2, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (797, 448, 1, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (798, 216, 11, 1, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (799, 76, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (800, 682, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (801, 353, 12, 4, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (802, 313, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (803, 446, 28, 1, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (804, 546, 21, 1, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (805, 215, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (806, 292, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (807, 621, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (808, 313, 1, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (809, 988, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (810, 708, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (811, 568, 29, 1, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (812, 607, 7, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (813, 131, 10, 1, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (814, 733, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (815, 597, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (816, 50, 6, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (817, 434, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (818, 762, 3, 10, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (819, 723, 7, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (820, 482, 17, 10, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (821, 408, 11, 6, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (822, 456, 26, 1, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (823, 8, 22, 10, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (824, 932, 3, 1, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (825, 185, 29, 8, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (826, 511, 12, 10, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (827, 262, 26, 4, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (828, 944, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (829, 112, 15, 3, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (830, 700, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (831, 60, 18, 6, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (832, 12, 25, 9, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (833, 118, 16, 10, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (834, 101, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (835, 891, 20, 9, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (836, 577, 13, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (837, 359, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (838, 619, 11, 2, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (839, 578, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (840, 678, 22, 10, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (841, 150, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (842, 849, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (843, 755, 13, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (844, 326, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (845, 636, 28, 4, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (846, 274, 12, 3, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (847, 821, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (848, 543, 4, 3, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (849, 347, 29, 7, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (850, 633, 7, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (851, 446, 5, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (852, 89, 12, 1, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (853, 967, 22, 2, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (854, 247, 3, 5, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (855, 3, 25, 9, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (856, 786, 4, 8, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (857, 957, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (858, 53, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (859, 459, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (860, 863, 30, 7, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (861, 629, 13, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (862, 956, 4, 3, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (863, 66, 22, 5, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (864, 411, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (865, 146, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (866, 207, 11, 7, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (867, 538, 9, 3, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (868, 675, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (869, 528, 13, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (870, 400, 28, 2, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (871, 206, 21, 2, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (872, 989, 15, 7, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (873, 840, 6, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (874, 661, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (875, 859, 6, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (876, 693, 28, 8, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (877, 140, 23, 3, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (878, 755, 26, 4, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (879, 794, 1, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (880, 8, 16, 5, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (881, 266, 9, 2, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (882, 407, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (883, 606, 11, 7, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (884, 806, 4, 5, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (885, 966, 19, 8, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (886, 143, 5, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (887, 273, 1, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (888, 987, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (889, 102, 17, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (890, 458, 25, 5, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (891, 14, 11, 10, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (892, 374, 11, 8, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (893, 101, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (894, 448, 26, 5, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (895, 986, 12, 8, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (896, 437, 24, 6, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (897, 324, 11, 2, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (898, 756, 19, 10, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (899, 280, 1, 2, CAST(5000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (900, 216, 1, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (901, 527, 10, 8, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (902, 116, 27, 7, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (903, 475, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (904, 164, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (905, 602, 10, 5, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (906, 792, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (907, 638, 22, 6, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (908, 530, 23, 1, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (909, 275, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (910, 741, 24, 2, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (911, 397, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (912, 458, 19, 8, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (913, 210, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (914, 871, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (915, 921, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (916, 978, 17, 7, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (917, 7, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (918, 265, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (919, 606, 30, 7, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (920, 210, 13, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (921, 613, 21, 10, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (922, 415, 5, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (923, 30, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (924, 562, 24, 9, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (925, 963, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (926, 71, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (927, 499, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (928, 859, 15, 3, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (929, 943, 21, 5, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (930, 799, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (931, 509, 5, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (932, 477, 25, 9, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (933, 915, 26, 9, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (934, 156, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (935, 3, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (936, 686, 13, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (937, 684, 10, 9, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (938, 214, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (939, 299, 17, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (940, 658, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (941, 543, 11, 1, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (942, 828, 20, 7, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (943, 297, 2, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (944, 73, 4, 7, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (945, 27, 5, 10, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (946, 907, 13, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (947, 488, 16, 7, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (948, 201, 21, 10, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (949, 76, 9, 9, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (950, 530, 29, 1, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (951, 755, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (952, 826, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (953, 437, 27, 7, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (954, 904, 22, 2, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (955, 920, 16, 10, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (956, 673, 22, 6, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (957, 752, 27, 3, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (958, 591, 21, 7, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (959, 785, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (960, 4, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (961, 35, 24, 5, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (962, 541, 6, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (963, 697, 25, 3, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (964, 501, 3, 8, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (965, 598, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (966, 242, 30, 10, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (967, 206, 21, 4, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (968, 268, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (969, 809, 14, 1, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (970, 364, 7, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (971, 410, 13, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (972, 8, 9, 4, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (973, 741, 17, 2, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (974, 854, 6, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (975, 395, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (976, 885, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (977, 150, 30, 6, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (978, 318, 5, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (979, 769, 12, 6, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (980, 870, 15, 4, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (981, 775, 6, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (982, 72, 30, 10, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (983, 768, 15, 10, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (984, 783, 22, 3, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (985, 464, 1, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (986, 110, 25, 4, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (987, 647, 9, 8, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (988, 106, 12, 5, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (989, 616, 4, 5, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (990, 752, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (991, 552, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (992, 343, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (993, 966, 14, 3, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (994, 235, 6, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (995, 954, 1, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (996, 682, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (997, 636, 30, 4, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (998, 542, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (999, 697, 6, 8, CAST(5000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1000, 908, 27, 6, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1001, 160, 12, 1, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1002, 83, 13, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1003, 307, 20, 6, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1004, 471, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1005, 193, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1006, 542, 29, 8, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1007, 421, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1008, 540, 1, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1009, 138, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1010, 361, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1011, 781, 19, 4, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1012, 464, 15, 4, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1013, 911, 30, 3, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1014, 356, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1015, 720, 25, 5, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1016, 619, 5, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1017, 227, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1018, 821, 11, 3, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1019, 584, 9, 10, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1020, 791, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1021, 659, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1022, 357, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1023, 755, 14, 10, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1024, 673, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1025, 544, 22, 10, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1026, 524, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1027, 233, 18, 4, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1028, 26, 15, 4, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1029, 938, 24, 7, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1030, 440, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1031, 245, 4, 6, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1032, 831, 26, 9, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1033, 592, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1034, 369, 23, 7, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1035, 134, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1036, 677, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1037, 604, 27, 1, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1038, 174, 12, 7, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1039, 473, 1, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1040, 182, 23, 8, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1041, 342, 14, 3, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1042, 494, 6, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1043, 943, 27, 7, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1044, 662, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1045, 437, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1046, 686, 29, 1, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1047, 626, 21, 5, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1048, 344, 28, 2, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1049, 406, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1050, 521, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1051, 349, 8, 3, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1052, 198, 23, 4, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1053, 214, 17, 10, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1054, 371, 13, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1055, 840, 25, 4, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1056, 826, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1057, 526, 29, 7, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1058, 945, 30, 8, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1059, 732, 10, 4, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1060, 194, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1061, 447, 17, 6, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1062, 766, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1063, 906, 9, 9, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1064, 701, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1065, 437, 24, 7, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1066, 275, 6, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1067, 472, 26, 2, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1068, 52, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1069, 593, 29, 5, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1070, 84, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1071, 32, 21, 8, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1072, 18, 15, 7, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1073, 134, 19, 5, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1074, 948, 17, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1075, 562, 28, 2, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1076, 818, 19, 6, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1077, 786, 13, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1078, 652, 24, 9, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1079, 467, 15, 8, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1080, 458, 24, 10, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1081, 443, 20, 7, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1082, 211, 27, 1, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1083, 566, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1084, 538, 17, 2, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1085, 326, 9, 10, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1086, 362, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1087, 328, 5, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1088, 106, 4, 9, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1089, 737, 28, 1, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1090, 71, 13, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1091, 354, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1092, 261, 11, 8, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1093, 783, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1094, 127, 10, 5, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1095, 773, 20, 8, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1096, 37, 22, 7, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1097, 4, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1098, 743, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1099, 193, 13, 7, CAST(5000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1100, 441, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1101, 615, 19, 5, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1102, 137, 24, 5, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1103, 559, 24, 8, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1104, 653, 5, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1105, 890, 22, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1106, 742, 9, 10, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1107, 780, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1108, 220, 19, 9, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1109, 11, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1110, 24, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1111, 583, 16, 2, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1112, 251, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1113, 270, 12, 9, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1114, 515, 17, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1115, 801, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1116, 729, 4, 3, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1117, 983, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1118, 390, 28, 2, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1119, 715, 26, 3, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1120, 717, 22, 8, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1121, 954, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1122, 204, 22, 3, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1123, 274, 27, 10, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1124, 977, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1125, 606, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1126, 143, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1127, 825, 28, 4, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1128, 301, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1129, 736, 4, 5, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1130, 400, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1131, 552, 2, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1132, 286, 17, 3, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1133, 983, 20, 6, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1134, 757, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1135, 540, 5, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1136, 837, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1137, 667, 18, 6, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1138, 118, 13, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1139, 935, 15, 8, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1140, 544, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1141, 209, 23, 1, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1142, 906, 6, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1143, 16, 15, 2, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1144, 542, 6, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1145, 321, 8, 9, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1146, 808, 29, 1, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1147, 940, 4, 7, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1148, 5, 3, 5, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1149, 299, 4, 7, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1150, 946, 9, 2, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1151, 259, 28, 8, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1152, 278, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1153, 131, 29, 4, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1154, 938, 5, 10, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1155, 434, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1156, 984, 15, 9, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1157, 534, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1158, 709, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1159, 907, 17, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1160, 527, 22, 9, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1161, 185, 28, 9, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1162, 72, 24, 3, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1163, 467, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1164, 835, 9, 3, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1165, 23, 27, 3, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1166, 54, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1167, 988, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1168, 260, 1, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1169, 336, 11, 6, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1170, 707, 6, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1171, 998, 6, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1172, 914, 3, 8, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1173, 207, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1174, 611, 5, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1175, 527, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1176, 911, 5, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1177, 83, 30, 10, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1178, 996, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1179, 687, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1180, 389, 24, 1, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1181, 751, 26, 5, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1182, 364, 3, 9, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1183, 355, 30, 9, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1184, 924, 8, 6, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1185, 703, 14, 6, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1186, 852, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1187, 265, 10, 8, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1188, 216, 16, 10, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1189, 155, 18, 3, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1190, 53, 27, 10, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1191, 176, 17, 6, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1192, 807, 24, 3, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1193, 688, 12, 1, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1194, 949, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1195, 697, 4, 9, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1196, 904, 4, 8, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1197, 972, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1198, 415, 14, 10, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1199, 321, 22, 2, CAST(599.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1200, 700, 16, 1, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1201, 732, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1202, 572, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1203, 562, 16, 3, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1204, 663, 8, 9, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1205, 387, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1206, 656, 7, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1207, 518, 27, 10, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1208, 771, 23, 3, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1209, 943, 11, 8, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1210, 320, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1211, 117, 9, 4, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1212, 631, 6, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1213, 714, 13, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1214, 687, 12, 7, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1215, 869, 12, 10, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1216, 795, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1217, 133, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1218, 578, 8, 9, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1219, 326, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1220, 454, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1221, 467, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1222, 21, 20, 8, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1223, 918, 3, 9, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1224, 663, 11, 7, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1225, 400, 28, 4, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1226, 969, 24, 3, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1227, 171, 24, 9, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1228, 127, 29, 1, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1229, 146, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1230, 11, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1231, 872, 25, 9, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1232, 682, 14, 3, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1233, 258, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1234, 113, 9, 2, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1235, 658, 16, 5, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1236, 564, 19, 10, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1237, 666, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1238, 179, 24, 3, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1239, 807, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1240, 789, 6, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1241, 254, 15, 6, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1242, 119, 26, 8, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1243, 198, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1244, 897, 18, 9, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1245, 486, 27, 1, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1246, 642, 29, 5, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1247, 366, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1248, 395, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1249, 294, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1250, 243, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1251, 539, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1252, 737, 26, 6, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1253, 71, 28, 8, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1254, 357, 17, 6, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1255, 856, 18, 4, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1256, 404, 11, 7, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1257, 198, 29, 3, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1258, 657, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1259, 912, 10, 4, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1260, 122, 3, 10, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1261, 128, 26, 5, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1262, 329, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1263, 829, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1264, 651, 5, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1265, 256, 29, 10, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1266, 331, 11, 3, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1267, 527, 27, 6, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1268, 63, 23, 4, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1269, 230, 24, 3, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1270, 934, 5, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1271, 542, 26, 9, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1272, 186, 16, 1, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1273, 165, 14, 5, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1274, 465, 18, 4, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1275, 880, 28, 7, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1276, 313, 3, 8, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1277, 579, 20, 7, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1278, 955, 26, 2, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1279, 538, 7, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1280, 622, 3, 3, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1281, 567, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1282, 202, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1283, 834, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1284, 628, 14, 1, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1285, 101, 12, 9, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1286, 344, 8, 9, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1287, 655, 1, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1288, 814, 26, 1, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1289, 15, 20, 8, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1290, 880, 2, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1291, 465, 11, 8, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1292, 429, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1293, 545, 13, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1294, 467, 9, 8, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1295, 624, 29, 3, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1296, 423, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1297, 695, 1, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1298, 143, 16, 2, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1299, 437, 28, 4, CAST(288900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1300, 945, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1301, 887, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1302, 830, 6, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1303, 588, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1304, 250, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1305, 585, 23, 4, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1306, 63, 27, 10, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1307, 968, 5, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1308, 90, 24, 6, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1309, 318, 15, 6, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1310, 746, 22, 9, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1311, 543, 19, 6, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1312, 20, 18, 4, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1313, 853, 4, 2, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1314, 900, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1315, 469, 22, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1316, 221, 26, 6, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1317, 595, 18, 2, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1318, 789, 29, 4, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1319, 226, 7, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1320, 18, 26, 1, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1321, 488, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1322, 807, 11, 6, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1323, 123, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1324, 215, 17, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1325, 21, 10, 10, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1326, 198, 15, 1, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1327, 141, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1328, 283, 3, 10, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1329, 394, 30, 10, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1330, 844, 2, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1331, 884, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1332, 504, 12, 6, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1333, 458, 10, 8, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1334, 923, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1335, 790, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1336, 263, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1337, 579, 24, 6, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1338, 1, 23, 3, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1339, 327, 24, 5, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1340, 423, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1341, 830, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1342, 189, 9, 4, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1343, 236, 15, 4, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1344, 48, 4, 7, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1345, 651, 19, 6, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1346, 375, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1347, 460, 26, 8, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1348, 647, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1349, 853, 16, 3, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1350, 962, 21, 4, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1351, 186, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1352, 639, 12, 9, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1353, 387, 15, 9, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1354, 158, 15, 10, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1355, 93, 6, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1356, 437, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1357, 354, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1358, 31, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1359, 218, 30, 7, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1360, 187, 28, 7, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1361, 196, 13, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1362, 151, 27, 7, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1363, 803, 5, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1364, 110, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1365, 111, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1366, 411, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1367, 880, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1368, 354, 24, 8, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1369, 862, 26, 4, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1370, 19, 2, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1371, 545, 23, 4, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1372, 847, 5, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1373, 121, 27, 6, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1374, 249, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1375, 332, 30, 2, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1376, 45, 20, 6, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1377, 385, 24, 2, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1378, 912, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1379, 855, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1380, 32, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1381, 882, 15, 4, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1382, 353, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1383, 212, 26, 6, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1384, 954, 26, 2, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1385, 835, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1386, 28, 12, 1, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1387, 92, 29, 10, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1388, 594, 15, 3, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1389, 696, 21, 4, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1390, 433, 15, 1, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1391, 791, 12, 8, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1392, 442, 24, 10, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1393, 741, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1394, 899, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1395, 845, 27, 8, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1396, 922, 23, 9, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1397, 635, 29, 5, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1398, 900, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1399, 627, 24, 10, CAST(368900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1400, 848, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1401, 19, 4, 6, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1402, 330, 6, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1403, 581, 15, 7, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1404, 63, 26, 8, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1405, 832, 30, 4, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1406, 235, 2, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1407, 343, 10, 10, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1408, 101, 11, 1, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1409, 878, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1410, 889, 21, 1, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1411, 499, 25, 8, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1412, 262, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1413, 189, 12, 7, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1414, 41, 22, 4, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1415, 528, 29, 8, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1416, 405, 8, 10, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1417, 608, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1418, 79, 1, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1419, 582, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1420, 318, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1421, 893, 20, 10, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1422, 305, 7, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1423, 931, 17, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1424, 913, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1425, 245, 24, 1, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1426, 487, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1427, 361, 28, 1, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1428, 399, 25, 10, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1429, 85, 10, 5, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1430, 399, 8, 6, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1431, 631, 16, 10, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1432, 337, 25, 5, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1433, 45, 21, 5, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1434, 374, 5, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1435, 443, 4, 2, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1436, 947, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1437, 583, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1438, 743, 17, 3, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1439, 344, 18, 2, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1440, 289, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1441, 633, 30, 8, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1442, 240, 20, 8, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1443, 655, 14, 8, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1444, 278, 6, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1445, 486, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1446, 658, 2, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1447, 812, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1448, 381, 12, 4, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1449, 859, 14, 10, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1450, 222, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1451, 837, 10, 5, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1452, 972, 18, 8, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1453, 569, 22, 3, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1454, 868, 18, 8, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1455, 956, 13, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1456, 185, 1, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1457, 750, 8, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1458, 239, 29, 7, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1459, 766, 6, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1460, 175, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1461, 809, 21, 4, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1462, 120, 23, 4, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1463, 210, 4, 2, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1464, 467, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1465, 615, 23, 8, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1466, 198, 8, 9, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1467, 35, 10, 3, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1468, 491, 19, 9, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1469, 944, 22, 10, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1470, 558, 3, 9, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1471, 206, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1472, 828, 23, 1, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1473, 643, 26, 6, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1474, 48, 15, 10, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1475, 159, 23, 1, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1476, 28, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1477, 506, 6, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1478, 602, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1479, 725, 4, 2, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1480, 11, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1481, 861, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1482, 53, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1483, 876, 4, 9, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1484, 679, 18, 4, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1485, 761, 30, 1, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1486, 403, 10, 6, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1487, 535, 29, 10, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1488, 902, 10, 9, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1489, 538, 28, 7, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1490, 28, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1491, 405, 12, 7, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1492, 110, 8, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1493, 852, 27, 3, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1494, 149, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1495, 746, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1496, 407, 12, 3, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1497, 227, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1498, 495, 16, 8, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1499, 837, 19, 3, CAST(800.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1500, 897, 12, 10, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1501, 756, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1502, 417, 17, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1503, 710, 21, 7, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1504, 57, 12, 9, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1505, 111, 13, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1506, 421, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1507, 912, 6, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1508, 277, 2, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1509, 297, 14, 1, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1510, 312, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1511, 527, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1512, 825, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1513, 89, 30, 4, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1514, 753, 24, 8, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1515, 677, 7, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1516, 478, 13, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1517, 15, 5, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1518, 373, 5, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1519, 753, 10, 3, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1520, 246, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1521, 234, 15, 9, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1522, 646, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1523, 251, 24, 8, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1524, 420, 5, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1525, 971, 19, 9, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1526, 301, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1527, 719, 27, 8, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1528, 648, 11, 8, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1529, 582, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1530, 148, 18, 1, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1531, 757, 17, 2, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1532, 722, 6, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1533, 212, 26, 9, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1534, 125, 5, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1535, 171, 19, 2, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1536, 389, 25, 10, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1537, 83, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1538, 43, 11, 6, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1539, 667, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1540, 352, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1541, 987, 4, 9, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1542, 171, 13, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1543, 123, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1544, 582, 25, 7, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1545, 109, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1546, 766, 26, 6, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1547, 332, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1548, 275, 7, 10, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1549, 989, 1, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1550, 837, 20, 9, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1551, 877, 26, 8, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1552, 534, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1553, 265, 6, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1554, 721, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1555, 33, 12, 1, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1556, 581, 27, 6, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1557, 911, 25, 9, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1558, 921, 30, 5, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1559, 147, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1560, 164, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1561, 766, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1562, 571, 7, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1563, 742, 3, 8, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1564, 809, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1565, 867, 24, 2, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1566, 582, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1567, 592, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1568, 573, 3, 3, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1569, 550, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1570, 454, 11, 5, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1571, 63, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1572, 636, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1573, 333, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1574, 956, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1575, 29, 8, 9, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1576, 730, 10, 2, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1577, 266, 18, 4, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1578, 326, 26, 5, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1579, 692, 22, 8, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1580, 913, 23, 1, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1581, 67, 25, 10, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1582, 792, 29, 9, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1583, 31, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1584, 456, 6, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1585, 844, 7, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1586, 281, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1587, 865, 16, 3, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1588, 180, 25, 8, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1589, 995, 26, 2, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1590, 989, 7, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1591, 513, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1592, 640, 5, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1593, 992, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1594, 440, 7, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1595, 210, 24, 7, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1596, 174, 1, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1597, 221, 4, 6, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1598, 794, 30, 1, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1599, 305, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1600, 36, 6, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1601, 796, 7, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1602, 550, 27, 6, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1603, 329, 27, 10, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1604, 310, 24, 1, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1605, 905, 7, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1606, 701, 21, 7, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1607, 248, 17, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1608, 660, 23, 8, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1609, 179, 23, 4, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1610, 343, 29, 9, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1611, 136, 8, 4, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1612, 561, 1, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1613, 239, 4, 8, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1614, 479, 22, 5, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1615, 4, 21, 2, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1616, 764, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1617, 133, 25, 5, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1618, 966, 20, 9, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1619, 522, 30, 4, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1620, 230, 12, 1, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1621, 101, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1622, 720, 15, 9, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1623, 341, 3, 5, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1624, 738, 5, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1625, 262, 4, 2, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1626, 61, 24, 9, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1627, 972, 16, 1, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1628, 462, 10, 6, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1629, 874, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1630, 460, 24, 2, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1631, 355, 13, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1632, 330, 15, 4, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1633, 992, 12, 10, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1634, 782, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1635, 966, 24, 6, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1636, 797, 25, 10, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1637, 517, 20, 9, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1638, 508, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1639, 198, 5, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1640, 549, 18, 4, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1641, 214, 15, 6, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1642, 790, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1643, 554, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1644, 325, 22, 4, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1645, 313, 8, 3, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1646, 18, 25, 4, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1647, 877, 15, 9, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1648, 992, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1649, 197, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1650, 190, 25, 9, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1651, 545, 8, 10, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1652, 54, 11, 1, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1653, 61, 20, 10, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1654, 411, 10, 7, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1655, 350, 26, 5, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1656, 564, 25, 8, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1657, 941, 14, 3, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1658, 897, 23, 1, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1659, 251, 18, 6, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1660, 293, 17, 3, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1661, 385, 11, 6, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1662, 999, 10, 5, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1663, 875, 17, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1664, 492, 9, 8, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1665, 784, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1666, 369, 7, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1667, 479, 26, 4, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1668, 444, 12, 2, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1669, 493, 1, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1670, 160, 6, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1671, 817, 18, 9, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1672, 734, 13, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1673, 489, 15, 1, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1674, 30, 30, 2, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1675, 691, 26, 9, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1676, 362, 5, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1677, 968, 10, 10, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1678, 776, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1679, 876, 14, 1, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1680, 642, 30, 8, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1681, 356, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1682, 739, 23, 7, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1683, 693, 28, 9, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1684, 712, 26, 6, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1685, 2, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1686, 155, 10, 5, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1687, 185, 11, 3, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1688, 94, 7, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1689, 95, 25, 9, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1690, 731, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1691, 782, 10, 1, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1692, 217, 12, 6, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1693, 368, 5, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1694, 926, 27, 1, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1695, 23, 6, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1696, 79, 30, 1, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1697, 151, 14, 9, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1698, 222, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1699, 903, 28, 7, CAST(288900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1700, 754, 18, 9, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1701, 758, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1702, 987, 3, 8, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1703, 522, 11, 8, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1704, 674, 2, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1705, 814, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1706, 87, 27, 10, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1707, 768, 21, 5, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1708, 595, 14, 9, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1709, 498, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1710, 797, 21, 5, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1711, 168, 16, 1, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1712, 149, 5, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1713, 125, 14, 8, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1714, 164, 15, 6, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1715, 122, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1716, 364, 30, 3, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1717, 103, 17, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1718, 980, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1719, 769, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1720, 414, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1721, 432, 3, 9, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1722, 241, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1723, 337, 30, 6, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1724, 789, 21, 1, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1725, 412, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1726, 302, 4, 3, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1727, 897, 9, 2, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1728, 603, 29, 3, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1729, 365, 28, 5, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1730, 394, 5, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1731, 982, 25, 3, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1732, 103, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1733, 112, 22, 9, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1734, 864, 10, 8, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1735, 466, 11, 3, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1736, 331, 29, 7, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1737, 302, 11, 6, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1738, 758, 15, 10, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1739, 658, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1740, 100, 6, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1741, 979, 23, 9, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1742, 2, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1743, 48, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1744, 583, 18, 6, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1745, 366, 5, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1746, 164, 15, 9, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1747, 670, 13, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1748, 407, 28, 5, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1749, 572, 1, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1750, 129, 20, 7, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1751, 672, 28, 8, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1752, 450, 22, 6, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1753, 463, 21, 5, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1754, 49, 11, 2, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1755, 69, 1, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1756, 302, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1757, 247, 17, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1758, 599, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1759, 484, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1760, 885, 12, 6, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1761, 396, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1762, 898, 7, 10, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1763, 797, 9, 4, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1764, 396, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1765, 295, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1766, 879, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1767, 173, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1768, 676, 17, 7, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1769, 449, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1770, 366, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1771, 129, 22, 2, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1772, 164, 3, 10, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1773, 411, 15, 10, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1774, 474, 21, 4, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1775, 261, 27, 10, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1776, 840, 30, 1, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1777, 7, 2, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1778, 743, 23, 4, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1779, 708, 7, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1780, 717, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1781, 358, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1782, 911, 3, 1, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1783, 155, 2, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1784, 416, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1785, 901, 10, 10, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1786, 294, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1787, 130, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1788, 376, 23, 8, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1789, 868, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1790, 179, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1791, 406, 15, 10, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1792, 173, 19, 5, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1793, 537, 30, 2, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1794, 623, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1795, 606, 13, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1796, 343, 8, 6, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1797, 633, 18, 1, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1798, 413, 6, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1799, 461, 26, 2, CAST(618900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1800, 141, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1801, 309, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1802, 943, 25, 10, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1803, 223, 9, 8, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1804, 909, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1805, 307, 22, 8, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1806, 862, 2, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1807, 554, 1, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1808, 29, 7, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1809, 433, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1810, 645, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1811, 792, 22, 3, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1812, 938, 27, 9, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1813, 231, 17, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1814, 258, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1815, 853, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1816, 526, 30, 3, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1817, 101, 23, 7, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1818, 461, 5, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1819, 89, 1, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1820, 385, 12, 1, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1821, 825, 13, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1822, 516, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1823, 678, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1824, 846, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1825, 378, 22, 8, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1826, 372, 18, 8, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1827, 606, 19, 9, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1828, 214, 10, 10, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1829, 671, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1830, 382, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1831, 371, 12, 7, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1832, 917, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1833, 192, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1834, 178, 20, 7, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1835, 67, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1836, 668, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1837, 298, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1838, 392, 11, 10, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1839, 143, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1840, 237, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1841, 284, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1842, 898, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1843, 353, 28, 7, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1844, 384, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1845, 817, 15, 3, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1846, 967, 19, 8, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1847, 965, 1, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1848, 126, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1849, 265, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1850, 237, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1851, 855, 8, 5, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1852, 688, 18, 2, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1853, 764, 11, 7, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1854, 812, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1855, 204, 17, 7, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1856, 717, 5, 10, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1857, 954, 10, 9, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1858, 904, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1859, 715, 24, 10, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1860, 582, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1861, 655, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1862, 650, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1863, 465, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1864, 570, 26, 3, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1865, 593, 29, 8, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1866, 814, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1867, 457, 16, 2, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1868, 298, 24, 3, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1869, 438, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1870, 383, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1871, 22, 13, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1872, 986, 15, 1, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1873, 797, 10, 9, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1874, 639, 2, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1875, 576, 27, 3, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1876, 267, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1877, 262, 18, 9, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1878, 558, 19, 8, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1879, 86, 8, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1880, 981, 5, 7, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1881, 618, 20, 6, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1882, 339, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1883, 547, 28, 2, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1884, 931, 25, 3, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1885, 147, 15, 4, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1886, 93, 4, 6, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1887, 14, 25, 10, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1888, 822, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1889, 965, 27, 6, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1890, 37, 8, 10, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1891, 856, 2, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1892, 375, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1893, 805, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1894, 650, 22, 6, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1895, 850, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1896, 245, 6, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1897, 97, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1898, 213, 28, 4, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1899, 819, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1900, 375, 13, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1901, 798, 19, 4, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1902, 960, 27, 3, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1903, 133, 15, 10, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1904, 993, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1905, 237, 19, 5, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1906, 244, 24, 8, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1907, 832, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1908, 154, 28, 5, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1909, 482, 5, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1910, 332, 12, 2, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1911, 272, 17, 3, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1912, 223, 9, 8, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1913, 825, 7, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1914, 833, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1915, 11, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1916, 567, 10, 6, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1917, 887, 14, 5, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1918, 176, 25, 9, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1919, 492, 20, 6, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1920, 602, 10, 1, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1921, 776, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1922, 919, 9, 4, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1923, 547, 15, 9, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1924, 32, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1925, 879, 25, 4, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1926, 146, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1927, 724, 24, 5, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1928, 249, 19, 10, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1929, 645, 23, 3, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1930, 596, 28, 1, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1931, 263, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1932, 974, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1933, 492, 6, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1934, 180, 3, 2, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1935, 754, 13, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1936, 422, 13, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1937, 614, 30, 3, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1938, 236, 22, 6, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1939, 754, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1940, 467, 1, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1941, 523, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1942, 228, 22, 10, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1943, 599, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1944, 857, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1945, 496, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1946, 951, 20, 9, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1947, 359, 5, 10, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1948, 710, 22, 8, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1949, 773, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1950, 494, 6, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1951, 120, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1952, 525, 12, 4, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1953, 886, 16, 1, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1954, 733, 26, 5, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1955, 275, 17, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1956, 126, 30, 5, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1957, 456, 8, 6, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1958, 317, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1959, 621, 16, 8, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1960, 665, 25, 3, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1961, 302, 20, 9, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1962, 852, 27, 1, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1963, 905, 12, 2, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1964, 967, 5, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1965, 973, 12, 8, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1966, 82, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1967, 128, 20, 8, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1968, 371, 30, 2, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1969, 572, 15, 7, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1970, 620, 26, 6, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1971, 993, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1972, 554, 3, 4, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1973, 467, 30, 10, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1974, 435, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1975, 546, 16, 7, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1976, 661, 12, 8, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1977, 250, 5, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1978, 81, 17, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1979, 178, 3, 1, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1980, 135, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1981, 755, 13, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1982, 393, 22, 6, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1983, 240, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1984, 684, 13, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1985, 38, 15, 8, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1986, 640, 11, 7, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1987, 67, 26, 10, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1988, 333, 12, 10, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1989, 401, 10, 2, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1990, 627, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1991, 288, 17, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1992, 113, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1993, 788, 6, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1994, 128, 13, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1995, 61, 2, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1996, 552, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1997, 739, 25, 4, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1998, 141, 15, 7, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (1999, 487, 10, 2, CAST(2000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2000, 20, 15, 9, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2001, 540, 22, 9, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2002, 795, 22, 7, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2003, 151, 2, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2004, 551, 23, 8, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2005, 793, 4, 7, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2006, 821, 20, 10, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2007, 759, 4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2008, 371, 21, 7, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2009, 809, 15, 10, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2010, 148, 26, 1, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2011, 199, 12, 9, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2012, 881, 2, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2013, 895, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2014, 96, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2015, 581, 4, 3, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2016, 6, 11, 3, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2017, 264, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2018, 6, 4, 8, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2019, 552, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2020, 225, 7, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2021, 832, 1, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2022, 923, 10, 4, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2023, 645, 17, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2024, 690, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2025, 112, 3, 3, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2026, 826, 30, 8, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2027, 73, 16, 3, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2028, 286, 2, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2029, 681, 25, 4, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2030, 459, 6, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2031, 992, 26, 9, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2032, 289, 1, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2033, 691, 25, 8, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2034, 461, 15, 8, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2035, 123, 21, 7, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2036, 601, 21, 5, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2037, 760, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2038, 741, 18, 1, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2039, 166, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2040, 631, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2041, 345, 9, 3, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2042, 938, 6, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2043, 13, 1, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2044, 95, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2045, 143, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2046, 395, 1, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2047, 384, 29, 7, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2048, 451, 18, 8, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2049, 766, 5, 10, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2050, 981, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2051, 137, 2, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2052, 175, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2053, 187, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2054, 588, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2055, 814, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2056, 100, 28, 1, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2057, 74, 7, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2058, 788, 8, 10, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2059, 508, 7, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2060, 926, 25, 4, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2061, 411, 5, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2062, 483, 6, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2063, 892, 6, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2064, 900, 17, 3, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2065, 727, 11, 3, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2066, 783, 6, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2067, 266, 6, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2068, 280, 28, 4, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2069, 317, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2070, 734, 14, 4, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2071, 271, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2072, 412, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2073, 900, 1, 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2074, 456, 22, 10, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2075, 68, 25, 5, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2076, 881, 23, 3, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2077, 602, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2078, 4, 23, 1, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2079, 644, 29, 10, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2080, 601, 24, 3, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2081, 909, 13, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2082, 383, 2, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2083, 662, 14, 9, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2084, 968, 29, 4, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2085, 46, 21, 1, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2086, 374, 21, 2, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2087, 651, 24, 6, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2088, 480, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2089, 131, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2090, 451, 16, 2, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2091, 603, 7, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2092, 466, 24, 10, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2093, 125, 13, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2094, 53, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2095, 820, 28, 8, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2096, 982, 4, 6, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2097, 53, 11, 2, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2098, 381, 21, 3, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2099, 524, 15, 8, CAST(5050.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2100, 526, 9, 1, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2101, 493, 20, 9, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2102, 413, 14, 1, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2103, 303, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2104, 925, 25, 5, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2105, 631, 25, 5, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2106, 231, 2, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2107, 54, 17, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2108, 875, 29, 5, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2109, 833, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2110, 63, 9, 4, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2111, 690, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2112, 284, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2113, 71, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2114, 782, 24, 1, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2115, 248, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2116, 42, 17, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2117, 156, 19, 8, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2118, 876, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2119, 201, 14, 4, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2120, 225, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2121, 775, 1, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2122, 322, 3, 10, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2123, 323, 19, 2, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2124, 575, 5, 6, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2125, 82, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2126, 696, 14, 6, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2127, 690, 24, 7, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2128, 500, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2129, 452, 21, 5, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2130, 380, 28, 10, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2131, 763, 15, 4, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2132, 101, 24, 8, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2133, 485, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2134, 738, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2135, 550, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2136, 625, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2137, 235, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2138, 623, 16, 5, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2139, 965, 6, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2140, 794, 8, 6, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2141, 212, 13, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2142, 404, 14, 10, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2143, 649, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2144, 784, 3, 5, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2145, 731, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2146, 508, 29, 10, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2147, 464, 2, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2148, 336, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2149, 396, 13, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2150, 270, 18, 10, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2151, 741, 1, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2152, 325, 10, 6, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2153, 868, 2, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2154, 473, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2155, 151, 13, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2156, 482, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2157, 494, 4, 2, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2158, 128, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2159, 611, 11, 1, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2160, 495, 16, 4, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2161, 405, 27, 7, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2162, 165, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2163, 340, 6, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2164, 632, 6, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2165, 611, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2166, 248, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2167, 126, 14, 8, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2168, 119, 10, 2, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2169, 274, 24, 7, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2170, 402, 1, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2171, 616, 8, 5, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2172, 253, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2173, 414, 10, 10, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2174, 772, 30, 5, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2175, 182, 17, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2176, 597, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2177, 943, 24, 8, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2178, 512, 11, 10, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2179, 261, 10, 7, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2180, 677, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2181, 244, 5, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2182, 734, 3, 1, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2183, 881, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2184, 901, 27, 5, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2185, 253, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2186, 448, 21, 1, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2187, 122, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2188, 244, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2189, 810, 9, 1, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2190, 320, 7, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2191, 242, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2192, 587, 22, 7, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2193, 820, 22, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2194, 797, 11, 2, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2195, 17, 3, 9, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2196, 140, 14, 5, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2197, 532, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2198, 452, 25, 6, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2199, 546, 20, 6, CAST(5230.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2200, 419, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2201, 987, 5, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2202, 241, 15, 6, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2203, 884, 10, 4, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2204, 565, 25, 5, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2205, 809, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2206, 594, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2207, 471, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2208, 437, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2209, 109, 17, 3, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2210, 834, 9, 8, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2211, 335, 11, 7, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2212, 920, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2213, 491, 11, 9, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2214, 585, 7, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2215, 818, 8, 5, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2216, 786, 15, 8, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2217, 265, 26, 4, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2218, 437, 13, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2219, 500, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2220, 607, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2221, 718, 14, 9, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2222, 281, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2223, 663, 8, 9, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2224, 680, 24, 1, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2225, 21, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2226, 220, 9, 4, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2227, 496, 2, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2228, 958, 13, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2229, 309, 26, 6, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2230, 187, 12, 7, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2231, 246, 2, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2232, 339, 18, 1, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2233, 400, 18, 9, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2234, 345, 15, 2, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2235, 113, 9, 9, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2236, 577, 12, 6, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2237, 961, 2, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2238, 692, 2, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2239, 766, 2, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2240, 112, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2241, 870, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2242, 96, 6, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2243, 760, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2244, 837, 7, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2245, 118, 21, 7, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2246, 837, 4, 2, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2247, 19, 22, 6, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2248, 261, 30, 6, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2249, 60, 29, 2, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2250, 725, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2251, 830, 22, 6, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2252, 811, 3, 9, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2253, 496, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2254, 193, 24, 5, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2255, 166, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2256, 640, 20, 3, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2257, 923, 12, 1, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2258, 421, 16, 4, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2259, 101, 3, 9, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2260, 394, 22, 4, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2261, 327, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2262, 82, 13, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2263, 631, 25, 3, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2264, 474, 17, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2265, 326, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2266, 860, 16, 9, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2267, 885, 8, 5, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2268, 120, 17, 7, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2269, 404, 29, 9, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2270, 773, 8, 7, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2271, 8, 22, 10, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2272, 901, 19, 2, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2273, 831, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2274, 99, 4, 3, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2275, 497, 3, 8, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2276, 610, 15, 2, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2277, 10, 17, 3, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2278, 866, 20, 8, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2279, 710, 7, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2280, 4, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2281, 110, 8, 8, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2282, 525, 26, 1, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2283, 87, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2284, 158, 2, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2285, 630, 23, 6, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2286, 169, 30, 6, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2287, 581, 9, 3, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2288, 793, 15, 1, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2289, 77, 7, 9, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2290, 6, 27, 2, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2291, 243, 18, 1, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2292, 407, 21, 2, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2293, 763, 19, 8, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2294, 389, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2295, 894, 2, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2296, 190, 10, 2, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2297, 994, 26, 5, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2298, 766, 26, 2, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2299, 611, 11, 2, CAST(4500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2300, 410, 29, 6, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2301, 495, 4, 8, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2302, 843, 22, 6, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2303, 24, 26, 4, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2304, 272, 16, 10, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2305, 195, 27, 3, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2306, 932, 3, 4, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2307, 872, 9, 3, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2308, 414, 14, 6, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2309, 743, 27, 8, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2310, 643, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2311, 707, 29, 7, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2312, 661, 3, 8, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2313, 329, 10, 5, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2314, 68, 28, 6, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2315, 342, 23, 6, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2316, 321, 25, 2, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2317, 330, 26, 1, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2318, 657, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2319, 385, 1, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2320, 942, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2321, 696, 14, 10, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2322, 555, 10, 5, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2323, 322, 25, 7, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2324, 457, 15, 1, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2325, 325, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2326, 48, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2327, 238, 10, 7, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2328, 158, 13, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2329, 840, 24, 7, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2330, 75, 3, 9, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2331, 677, 12, 1, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2332, 37, 30, 8, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2333, 185, 23, 5, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2334, 366, 8, 5, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2335, 989, 5, 2, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2336, 834, 6, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2337, 189, 30, 2, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2338, 875, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2339, 971, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2340, 532, 3, 10, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2341, 844, 14, 1, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2342, 140, 1, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2343, 596, 23, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2344, 537, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2345, 460, 30, 6, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2346, 568, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2347, 781, 29, 1, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2348, 627, 11, 6, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2349, 733, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2350, 918, 16, 6, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2351, 938, 11, 5, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2352, 64, 8, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2353, 212, 19, 2, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2354, 123, 4, 8, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2355, 92, 22, 7, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2356, 562, 24, 6, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2357, 909, 9, 6, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2358, 536, 28, 7, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2359, 761, 7, 8, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2360, 462, 17, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2361, 544, 21, 6, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2362, 849, 11, 3, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2363, 710, 26, 10, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2364, 605, 15, 3, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2365, 417, 20, 2, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2366, 48, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2367, 864, 16, 10, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2368, 895, 5, 4, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2369, 776, 30, 9, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2370, 80, 14, 7, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2371, 932, 19, 7, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2372, 640, 18, 7, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2373, 699, 18, 3, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2374, 584, 12, 2, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2375, 228, 3, 5, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2376, 940, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2377, 352, 13, 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2378, 755, 15, 2, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2379, 905, 2, 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2380, 429, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2381, 504, 24, 4, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2382, 160, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2383, 470, 15, 2, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2384, 841, 24, 6, CAST(368900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2385, 117, 15, 3, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2386, 788, 23, 7, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2387, 351, 29, 5, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2388, 48, 1, 3, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2389, 712, 18, 8, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2390, 303, 26, 10, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2391, 952, 27, 3, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2392, 332, 14, 10, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2393, 72, 26, 8, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2394, 172, 20, 5, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2395, 26, 27, 4, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2396, 877, 6, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2397, 591, 25, 5, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2398, 932, 17, 7, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2399, 50, 3, 7, CAST(7500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2400, 485, 11, 1, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2401, 525, 30, 8, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2402, 653, 22, 3, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2403, 432, 11, 5, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2404, 479, 16, 10, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2405, 164, 15, 9, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2406, 361, 8, 3, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2407, 245, 4, 6, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2408, 801, 10, 8, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2409, 89, 25, 1, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2410, 875, 1, 4, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2411, 544, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2412, 393, 10, 3, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2413, 500, 22, 4, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2414, 266, 27, 7, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2415, 741, 23, 7, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2416, 854, 29, 8, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2417, 362, 30, 7, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2418, 926, 17, 3, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2419, 461, 7, 5, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2420, 18, 26, 10, CAST(618900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2421, 46, 21, 7, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2422, 750, 16, 5, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2423, 17, 20, 4, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2424, 318, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2425, 987, 10, 5, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2426, 921, 20, 1, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2427, 229, 8, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2428, 456, 18, 1, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2429, 168, 11, 4, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2430, 997, 25, 3, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2431, 842, 25, 8, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2432, 254, 14, 2, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2433, 566, 17, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2434, 547, 2, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2435, 231, 14, 9, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2436, 630, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2437, 656, 15, 3, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2438, 610, 4, 10, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2439, 575, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2440, 683, 18, 5, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2441, 689, 20, 3, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2442, 438, 12, 4, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2443, 761, 22, 7, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2444, 861, 25, 10, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2445, 525, 19, 3, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2446, 775, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2447, 565, 6, 8, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2448, 682, 30, 4, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2449, 588, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2450, 899, 28, 3, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2451, 786, 14, 3, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2452, 197, 18, 2, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2453, 913, 27, 8, CAST(498900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2454, 239, 17, 7, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2455, 626, 1, 10, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2456, 958, 11, 5, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2457, 988, 17, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2458, 812, 1, 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2459, 467, 30, 4, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2460, 503, 5, 10, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2461, 779, 28, 1, CAST(288900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2462, 761, 19, 2, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2463, 807, 4, 6, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2464, 637, 11, 7, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2465, 887, 9, 9, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2466, 302, 15, 5, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2467, 683, 6, 6, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2468, 699, 10, 6, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2469, 674, 29, 3, CAST(608900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2470, 108, 18, 8, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2471, 115, 17, 4, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2472, 435, 8, 9, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2473, 925, 7, 1, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2474, 290, 19, 9, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2475, 479, 23, 4, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2476, 276, 25, 10, CAST(488900.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2477, 291, 12, 4, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2478, 684, 3, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2479, 264, 30, 2, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2480, 234, 14, 4, CAST(5640.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2481, 945, 2, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2482, 224, 20, 10, CAST(5230.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2483, 855, 18, 6, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2484, 707, 4, 8, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2485, 578, 30, 5, CAST(518000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2486, 168, 23, 10, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2487, 571, 10, 10, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2488, 27, 9, 5, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2489, 137, 10, 4, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2490, 972, 21, 9, CAST(1680.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2491, 53, 3, 9, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2492, 760, 15, 3, CAST(5050.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2493, 3, 4, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2494, 456, 4, 3, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2495, 234, 18, 3, CAST(2350.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2496, 101, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2497, 423, 9, 7, CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2498, 848, 19, 1, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2499, 397, 6, 4, CAST(5000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2500, 1024, 19, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2501, 1025, 1, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2502, 1025, 5, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2503, 1030, 5, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2504, 1031, 16, 2, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2505, 1032, 1, 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[detalles_facturas] ([id_detalle_factura], [id_factura], [id_producto], [cantidad], [precio_unitario]) VALUES (2506, 1033, 1, 1, CAST(1500.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[detalles_facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[detalles_ordenes_pedidos] ON 

INSERT [dbo].[detalles_ordenes_pedidos] ([id_detalle_orden], [id_producto], [id_factura], [cantidad], [precio_unitario], [fecha_entrega]) VALUES (1, 1, 1026, 1, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2022-11-05T18:28:45.000' AS DateTime))
INSERT [dbo].[detalles_ordenes_pedidos] ([id_detalle_orden], [id_producto], [id_factura], [cantidad], [precio_unitario], [fecha_entrega]) VALUES (2, 1, 1027, 1, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2022-11-05T22:27:56.000' AS DateTime))
INSERT [dbo].[detalles_ordenes_pedidos] ([id_detalle_orden], [id_producto], [id_factura], [cantidad], [precio_unitario], [fecha_entrega]) VALUES (3, 12, 1028, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-08T03:04:56.137' AS DateTime))
INSERT [dbo].[detalles_ordenes_pedidos] ([id_detalle_orden], [id_producto], [id_factura], [cantidad], [precio_unitario], [fecha_entrega]) VALUES (4, 1, 1029, 1, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2022-11-10T03:01:14.000' AS DateTime))
INSERT [dbo].[detalles_ordenes_pedidos] ([id_detalle_orden], [id_producto], [id_factura], [cantidad], [precio_unitario], [fecha_entrega]) VALUES (5, 16, 1031, 2, CAST(800.00 AS Decimal(10, 2)), CAST(N'2022-11-10T03:22:45.000' AS DateTime))
INSERT [dbo].[detalles_ordenes_pedidos] ([id_detalle_orden], [id_producto], [id_factura], [cantidad], [precio_unitario], [fecha_entrega]) VALUES (6, 21, 1032, 1, CAST(3689000.00 AS Decimal(10, 2)), CAST(N'2022-11-10T05:51:43.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[detalles_ordenes_pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[facturas] ON 

INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1, 144, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (2, 182, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (3, 146, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (4, 38, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (5, 44, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (6, 155, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (7, 30, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (8, 167, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (9, 30, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (10, 22, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (11, 66, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (12, 110, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (13, 48, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (14, 33, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-07-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (15, 95, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (16, 38, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (17, 183, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (18, 148, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (19, 102, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (20, 19, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-08-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (21, 67, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (22, 68, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (23, 201, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (24, 175, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (25, 93, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (26, 199, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-12-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (27, 182, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (28, 21, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (29, 90, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (30, 1, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (31, 59, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (32, 14, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (33, 45, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-08-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (34, 51, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (35, 42, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (36, 165, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (37, 142, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (38, 130, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (39, 23, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (40, 90, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (41, 138, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (42, 56, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (43, 39, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (44, 194, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (45, 56, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (46, 7, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (47, 90, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (48, 90, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (49, 68, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (50, 5, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-07-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (51, 80, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (52, 133, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (53, 199, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (54, 166, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (55, 145, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (56, 107, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (57, 122, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (58, 172, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (59, 38, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (60, 171, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (61, 182, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (62, 126, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (63, 80, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (64, 4, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (65, 134, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (66, 173, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (67, 141, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (68, 96, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (69, 158, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-11-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (70, 68, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (71, 106, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (72, 100, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (73, 7, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (74, 22, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (75, 41, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (76, 21, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (77, 169, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (78, 40, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-04-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (79, 6, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (80, 130, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (81, 163, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (82, 120, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (83, 83, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (84, 104, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (85, 4, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (86, 111, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (87, 84, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (88, 22, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (89, 184, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-12-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (90, 112, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (91, 166, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (92, 86, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (93, 52, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (94, 159, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (95, 46, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (96, 184, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (97, 23, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (98, 16, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (99, 158, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-10-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (100, 191, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (101, 153, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (102, 143, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (103, 88, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (104, 106, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (105, 141, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (106, 196, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (107, 2, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (108, 175, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (109, 104, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (110, 126, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (111, 141, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (112, 185, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (113, 116, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (114, 149, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (115, 171, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (116, 165, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (117, 96, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (118, 168, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (119, 126, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (120, 173, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (121, 184, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (122, 66, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (123, 107, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (124, 141, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (125, 45, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (126, 109, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (127, 4, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (128, 9, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (129, 123, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (130, 126, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (131, 72, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (132, 86, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (133, 190, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (134, 149, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (135, 74, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (136, 35, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (137, 42, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (138, 192, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (139, 103, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (140, 15, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-06-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (141, 159, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (142, 5, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (143, 167, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (144, 84, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (145, 201, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (146, 38, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (147, 63, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (148, 49, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (149, 117, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (150, 48, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (151, 197, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (152, 117, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (153, 70, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (154, 29, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (155, 57, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (156, 69, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (157, 60, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (158, 89, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (159, 4, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (160, 192, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (161, 127, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (162, 71, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (163, 107, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (164, 44, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (165, 3, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-11-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (166, 61, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (167, 100, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (168, 89, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (169, 171, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (170, 73, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (171, 176, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (172, 24, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (173, 73, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (174, 139, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (175, 121, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (176, 14, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (177, 33, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (178, 181, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (179, 4, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (180, 149, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (181, 144, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (182, 109, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (183, 192, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (184, 26, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (185, 21, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (186, 31, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (187, 72, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (188, 190, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (189, 95, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-11-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (190, 152, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (191, 198, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-12-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (192, 65, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (193, 155, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (194, 195, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (195, 152, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (196, 168, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (197, 75, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (198, 150, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (199, 11, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (200, 146, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (201, 54, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (202, 184, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (203, 143, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (204, 164, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (205, 107, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (206, 141, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (207, 201, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (208, 30, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (209, 45, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (210, 144, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (211, 12, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (212, 172, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (213, 184, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (214, 71, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (215, 164, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (216, 179, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (217, 25, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (218, 26, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (219, 76, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (220, 181, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (221, 151, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (222, 30, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (223, 170, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (224, 107, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (225, 92, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (226, 95, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (227, 59, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (228, 95, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (229, 169, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (230, 168, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (231, 83, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (232, 95, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (233, 73, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (234, 115, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (235, 116, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (236, 36, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-07-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (237, 49, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (238, 114, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (239, 79, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (240, 21, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (241, 58, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (242, 114, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (243, 110, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (244, 124, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (245, 133, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (246, 180, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (247, 140, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (248, 109, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (249, 73, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (250, 114, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (251, 25, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (252, 97, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (253, 42, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (254, 124, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (255, 183, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (256, 42, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (257, 119, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (258, 141, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (259, 184, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (260, 62, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (261, 35, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-04-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (262, 120, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (263, 100, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (264, 121, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-09-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (265, 175, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (266, 178, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (267, 152, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (268, 171, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (269, 178, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (270, 26, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (271, 146, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (272, 39, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (273, 118, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (274, 79, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (275, 147, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (276, 61, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (277, 181, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (278, 201, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (279, 127, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (280, 18, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (281, 137, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (282, 68, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (283, 144, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (284, 173, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (285, 22, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (286, 191, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (287, 142, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (288, 12, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (289, 193, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (290, 120, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (291, 65, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (292, 24, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (293, 94, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (294, 74, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (295, 176, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (296, 21, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (297, 71, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (298, 19, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (299, 29, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-09-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (300, 87, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (301, 110, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (302, 137, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (303, 29, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (304, 114, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (305, 51, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (306, 67, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (307, 120, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (308, 7, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (309, 60, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (310, 95, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (311, 163, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (312, 90, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (313, 90, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (314, 192, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (315, 186, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (316, 64, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (317, 181, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (318, 73, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (319, 147, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (320, 38, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (321, 121, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (322, 93, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (323, 132, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (324, 87, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (325, 90, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (326, 80, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (327, 53, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (328, 16, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (329, 43, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (330, 31, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (331, 163, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (332, 50, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (333, 146, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (334, 135, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (335, 139, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (336, 147, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (337, 15, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (338, 117, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (339, 64, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (340, 157, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (341, 127, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (342, 133, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (343, 160, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-11-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (344, 182, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (345, 99, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (346, 15, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (347, 173, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-07-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (348, 16, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-11-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (349, 92, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (350, 182, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (351, 116, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (352, 186, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (353, 18, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (354, 70, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (355, 65, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (356, 29, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (357, 73, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (358, 198, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (359, 37, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-09-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (360, 57, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (361, 115, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (362, 63, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (363, 77, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (364, 37, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (365, 14, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (366, 9, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (367, 144, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (368, 125, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (369, 143, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (370, 45, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (371, 113, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (372, 175, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (373, 38, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (374, 4, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (375, 167, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (376, 101, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-07-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (377, 179, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (378, 64, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (379, 26, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (380, 11, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (381, 146, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (382, 143, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (383, 67, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (384, 104, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (385, 58, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (386, 7, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (387, 148, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (388, 23, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (389, 163, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (390, 136, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (391, 62, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (392, 91, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (393, 165, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (394, 155, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (395, 105, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (396, 104, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (397, 9, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (398, 145, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (399, 14, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (400, 136, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (401, 35, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (402, 139, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (403, 11, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (404, 165, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (405, 151, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (406, 134, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (407, 147, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (408, 10, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (409, 25, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (410, 75, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (411, 26, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (412, 157, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (413, 5, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (414, 84, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (415, 197, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (416, 107, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (417, 56, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (418, 143, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (419, 183, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (420, 154, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (421, 101, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (422, 5, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (423, 126, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (424, 60, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (425, 184, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (426, 72, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (427, 113, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (428, 31, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (429, 142, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (430, 149, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (431, 196, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (432, 181, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (433, 182, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (434, 96, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (435, 73, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (436, 45, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (437, 95, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (438, 43, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (439, 44, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (440, 5, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (441, 166, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (442, 195, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (443, 110, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (444, 197, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (445, 41, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (446, 172, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (447, 27, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (448, 58, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (449, 90, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (450, 170, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (451, 17, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (452, 156, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (453, 178, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (454, 138, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (455, 45, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (456, 81, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (457, 7, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (458, 171, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (459, 103, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (460, 195, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (461, 91, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-08-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (462, 2, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (463, 70, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (464, 201, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (465, 198, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (466, 60, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (467, 58, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (468, 145, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (469, 176, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (470, 111, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (471, 83, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (472, 92, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (473, 49, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (474, 119, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (475, 51, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (476, 56, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (477, 137, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (478, 95, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (479, 18, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (480, 199, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (481, 30, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (482, 57, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (483, 24, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (484, 175, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (485, 183, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (486, 97, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (487, 1, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (488, 184, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (489, 58, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (490, 24, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (491, 181, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (492, 148, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (493, 142, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (494, 146, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (495, 76, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (496, 37, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (497, 78, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (498, 85, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (499, 180, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-02-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (500, 38, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (501, 130, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (502, 187, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (503, 96, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (504, 35, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (505, 89, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (506, 197, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-11-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (507, 194, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (508, 42, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (509, 144, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (510, 156, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (511, 144, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-11-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (512, 93, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (513, 171, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (514, 35, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (515, 153, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (516, 55, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (517, 133, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (518, 20, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (519, 29, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (520, 63, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (521, 119, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (522, 180, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (523, 86, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (524, 95, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (525, 90, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (526, 99, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (527, 4, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (528, 3, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (529, 45, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (530, 10, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (531, 61, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (532, 16, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (533, 105, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (534, 34, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (535, 30, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (536, 63, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (537, 20, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (538, 127, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (539, 176, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (540, 79, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (541, 200, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (542, 90, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (543, 7, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (544, 59, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (545, 189, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (546, 37, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (547, 194, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (548, 137, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (549, 199, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (550, 23, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (551, 36, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (552, 27, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (553, 150, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (554, 147, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (555, 161, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (556, 197, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (557, 194, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (558, 1, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (559, 147, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-08-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (560, 123, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (561, 124, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (562, 37, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (563, 58, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (564, 150, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (565, 177, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (566, 189, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (567, 50, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (568, 195, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (569, 53, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (570, 165, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (571, 76, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (572, 68, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (573, 82, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (574, 49, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (575, 54, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (576, 91, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (577, 133, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (578, 139, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (579, 108, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (580, 77, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (581, 169, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (582, 96, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (583, 20, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (584, 23, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (585, 1, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (586, 163, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (587, 11, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (588, 189, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (589, 1, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (590, 174, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (591, 172, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (592, 157, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (593, 85, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (594, 122, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (595, 100, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (596, 139, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (597, 194, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (598, 62, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (599, 48, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-02-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (600, 105, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (601, 100, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-08-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (602, 189, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (603, 157, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (604, 83, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (605, 103, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (606, 51, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (607, 83, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (608, 76, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (609, 78, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (610, 85, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (611, 69, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (612, 184, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (613, 97, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (614, 174, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (615, 90, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (616, 165, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (617, 74, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (618, 139, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (619, 187, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (620, 155, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (621, 200, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (622, 185, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (623, 60, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-06-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (624, 22, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (625, 32, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (626, 100, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (627, 32, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (628, 19, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (629, 148, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (630, 12, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (631, 21, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (632, 196, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (633, 116, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (634, 18, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (635, 173, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (636, 64, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (637, 44, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (638, 98, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (639, 127, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (640, 130, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (641, 197, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (642, 35, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (643, 16, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (644, 21, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (645, 123, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (646, 95, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (647, 97, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (648, 139, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (649, 138, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (650, 58, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (651, 82, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (652, 13, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (653, 163, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (654, 129, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (655, 128, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-07-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (656, 116, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (657, 198, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (658, 62, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (659, 46, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (660, 123, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (661, 12, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (662, 185, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (663, 35, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (664, 175, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (665, 3, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (666, 160, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (667, 144, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (668, 15, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (669, 177, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (670, 71, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (671, 48, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (672, 181, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (673, 91, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (674, 126, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (675, 48, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (676, 161, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (677, 125, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (678, 97, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (679, 126, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (680, 200, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (681, 177, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (682, 105, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (683, 12, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (684, 168, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (685, 13, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (686, 29, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (687, 174, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (688, 15, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (689, 115, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (690, 4, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (691, 29, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (692, 66, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (693, 86, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (694, 26, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (695, 121, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (696, 190, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (697, 1, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (698, 148, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (699, 131, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-06-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (700, 87, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (701, 122, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (702, 17, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (703, 14, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (704, 81, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (705, 111, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (706, 60, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (707, 9, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (708, 30, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (709, 166, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (710, 152, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (711, 75, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (712, 116, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (713, 42, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (714, 12, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (715, 5, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (716, 47, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (717, 50, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (718, 79, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (719, 96, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (720, 92, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (721, 69, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (722, 139, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (723, 134, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (724, 22, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (725, 15, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (726, 195, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (727, 49, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (728, 96, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (729, 159, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (730, 158, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (731, 152, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (732, 101, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (733, 180, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (734, 81, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (735, 151, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (736, 191, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (737, 182, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (738, 114, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (739, 106, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (740, 8, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (741, 18, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (742, 99, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (743, 194, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (744, 106, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (745, 131, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (746, 144, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (747, 45, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (748, 129, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (749, 200, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (750, 98, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (751, 36, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (752, 20, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (753, 21, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-09-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (754, 139, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (755, 100, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-11-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (756, 196, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (757, 13, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (758, 94, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (759, 135, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (760, 39, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (761, 175, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (762, 81, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (763, 45, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (764, 73, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (765, 28, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (766, 53, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-07-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (767, 38, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (768, 48, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (769, 145, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (770, 150, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (771, 115, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (772, 87, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (773, 39, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (774, 74, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (775, 103, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (776, 115, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (777, 7, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (778, 81, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (779, 114, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (780, 25, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (781, 191, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (782, 141, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (783, 58, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-07-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (784, 131, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (785, 181, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (786, 188, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (787, 60, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (788, 48, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (789, 127, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-11-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (790, 6, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (791, 152, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-07-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (792, 198, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (793, 166, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (794, 128, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (795, 10, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (796, 12, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (797, 192, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (798, 171, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (799, 137, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (800, 174, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-09-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (801, 100, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (802, 72, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-09-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (803, 151, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (804, 176, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (805, 154, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (806, 76, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (807, 147, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (808, 166, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (809, 129, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (810, 27, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (811, 91, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (812, 29, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (813, 2, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (814, 194, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (815, 7, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (816, 131, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (817, 128, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (818, 182, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (819, 186, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-11-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (820, 116, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-09-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (821, 84, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (822, 108, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (823, 24, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (824, 132, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (825, 8, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (826, 78, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (827, 108, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (828, 56, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (829, 81, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (830, 111, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-08-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (831, 181, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (832, 66, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (833, 62, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (834, 99, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (835, 120, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-07-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (836, 95, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (837, 113, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (838, 143, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (839, 49, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (840, 107, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (841, 105, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (842, 37, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (843, 91, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (844, 166, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (845, 129, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (846, 84, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (847, 5, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (848, 182, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (849, 32, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (850, 57, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (851, 113, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (852, 15, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (853, 174, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (854, 30, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (855, 178, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (856, 54, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (857, 119, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (858, 127, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (859, 67, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (860, 77, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (861, 60, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (862, 138, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (863, 107, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (864, 155, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (865, 112, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (866, 183, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (867, 53, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (868, 45, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-07-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (869, 103, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (870, 112, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (871, 41, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (872, 27, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (873, 15, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (874, 93, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (875, 143, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (876, 182, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (877, 26, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (878, 111, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (879, 107, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (880, 20, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (881, 14, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (882, 181, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (883, 62, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (884, 64, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (885, 80, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (886, 178, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (887, 4, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (888, 68, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (889, 13, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (890, 125, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (891, 95, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (892, 199, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (893, 34, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (894, 62, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (895, 68, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (896, 73, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (897, 81, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (898, 63, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (899, 14, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (900, 74, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (901, 181, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (902, 61, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (903, 161, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (904, 187, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (905, 6, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (906, 37, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (907, 96, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (908, 8, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (909, 136, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (910, 127, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (911, 37, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (912, 194, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (913, 41, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (914, 89, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (915, 2, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (916, 8, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (917, 134, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (918, 31, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (919, 199, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (920, 102, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (921, 119, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (922, 107, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (923, 9, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (924, 174, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (925, 8, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (926, 146, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (927, 49, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (928, 153, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (929, 28, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (930, 158, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (931, 6, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (932, 2, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (933, 108, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (934, 169, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (935, 75, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (936, 79, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (937, 100, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (938, 125, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (939, 47, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (940, 47, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (941, 124, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (942, 11, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (943, 125, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (944, 165, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2015-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (945, 175, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (946, 63, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (947, 77, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (948, 11, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (949, 51, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (950, 134, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (951, 182, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (952, 88, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (953, 171, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (954, 28, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (955, 137, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (956, 97, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (957, 49, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (958, 30, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (959, 128, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (960, 98, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2018-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (961, 149, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (962, 137, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (963, 121, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (964, 13, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (965, 125, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (966, 49, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (967, 81, 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (968, 200, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (969, 38, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2010-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (970, 95, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (971, 78, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (972, 199, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (973, 155, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (974, 161, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (975, 84, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2017-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (976, 78, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (977, 183, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (978, 27, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2012-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (979, 173, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (980, 120, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (981, 19, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (982, 198, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (983, 139, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-04-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (984, 47, 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (985, 50, 1, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-07-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (986, 33, 4, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (987, 101, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (988, 95, 4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2014-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (989, 175, 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2016-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (990, 7, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (991, 34, 1, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (992, 133, 3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2011-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (993, 126, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (994, 168, 2, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (995, 192, 3, 4, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2013-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (996, 43, 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (997, 147, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (998, 62, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (999, 196, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1002, 201, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1003, 201, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1004, 201, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1005, 201, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1006, 201, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1007, 201, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2019-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1008, 202, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1009, 203, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1010, 204, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1011, 201, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1012, 202, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1013, 203, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1014, 204, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1015, 201, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1016, 202, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1017, 203, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2021-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1018, 204, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1019, 204, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1020, 204, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1021, 204, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1022, 204, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1023, 204, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1024, 108, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-10-24T04:11:21.610' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1025, 117, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-01T13:03:09.607' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1026, 178, 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-04T18:28:45.777' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1027, 82, 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-04T22:27:56.717' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1028, 16, 1, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-08T03:04:56.137' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1029, 97, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-09T03:01:14.113' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1030, 192, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-09T03:12:18.687' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1031, 58, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-09T03:22:45.170' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1032, 108, 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-09T05:51:30.597' AS DateTime))
INSERT [dbo].[facturas] ([id_factura], [id_cliente], [id_forma_pago], [id_forma_envio], [interes], [descuento], [fecha]) VALUES (1033, 167, 1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-11-09T14:31:54.700' AS DateTime))
SET IDENTITY_INSERT [dbo].[facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[formas_envios] ON 

INSERT [dbo].[formas_envios] ([id_forma_envio], [forma_envio]) VALUES (1, N'Envío del local')
INSERT [dbo].[formas_envios] ([id_forma_envio], [forma_envio]) VALUES (2, N'Correo')
INSERT [dbo].[formas_envios] ([id_forma_envio], [forma_envio]) VALUES (3, N'Retira en local')
INSERT [dbo].[formas_envios] ([id_forma_envio], [forma_envio]) VALUES (4, N'Otro')
SET IDENTITY_INSERT [dbo].[formas_envios] OFF
GO
SET IDENTITY_INSERT [dbo].[formas_pagos] ON 

INSERT [dbo].[formas_pagos] ([id_forma_pago], [forma_pago]) VALUES (1, N'Efectivo')
INSERT [dbo].[formas_pagos] ([id_forma_pago], [forma_pago]) VALUES (2, N'Débito')
INSERT [dbo].[formas_pagos] ([id_forma_pago], [forma_pago]) VALUES (3, N'Crédito')
INSERT [dbo].[formas_pagos] ([id_forma_pago], [forma_pago]) VALUES (4, N'QR')
SET IDENTITY_INSERT [dbo].[formas_pagos] OFF
GO
SET IDENTITY_INSERT [dbo].[localidades] ON 

INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (1, N'Cordoba', 1)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (2, N'Carlos Paz', 1)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (3, N'Alta Gracia', 1)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (4, N'Cosquín', 1)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (5, N'La Plata', 2)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (6, N'Villa  Gesell', 2)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (7, N'Bahia Blanca', 2)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (8, N'Ayacucho', 2)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (9, N'Mendoza', 3)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (10, N'Godoy Cruz', 3)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (11, N'Guaymallen', 3)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (12, N'Colonia Suiza', 3)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (13, N'Corrientes', 4)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (14, N'Bella Vista', 4)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (15, N'Bon Plan', 4)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (16, N'Chavarria', 4)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (17, N'San Salvador de Jujuy', 5)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (18, N'El Carmen', 5)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (19, N'El Talar', 5)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (20, N'Humahuaca', 5)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (21, N'Santa Fe', 6)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (22, N'Arrufo', 6)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (23, N'Rosario', 6)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (24, N'Galvez', 6)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (25, N'Salta', 7)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (26, N'Cafayate', 7)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (27, N'San Carlos', 7)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (28, N'Molinos', 7)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (29, N'Neuquen', 8)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (30, N'Arroyito', 8)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (31, N'Centenario', 8)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (32, N'Copahue', 8)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (33, N'Merlo', 9)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (34, N'La Punilla', 9)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (35, N'La Florida', 9)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (36, N'Rio Grande', 9)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (37, N'Posadas', 10)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (38, N'Arroyo del Medio', 10)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (39, N'Apostoles', 10)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (40, N'Campo Grande', 10)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (41, N'La Rioja', 11)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (42, N'Chilecito', 11)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (43, N'Famatina', 11)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (44, N'Chamical', 11)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (45, N'Ciudad de Santa Rosa', 12)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (46, N'Ceballos', 12)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (47, N'Colonia Baron', 12)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (48, N'General San Martin', 12)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (49, N'Bariloche', 13)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (50, N'El Bolson', 13)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (51, N'El Condor', 13)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (52, N'Mainque', 13)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (53, N'Formosa', 14)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (54, N'El Colorado', 14)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (55, N'General Manuel Belgrano', 14)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (56, N'Laguna Blanca', 14)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (57, N'Rio Gallegos', 15)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (58, N'Perito Moreno', 15)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (59, N'Pico Truncado', 15)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (60, N'Puerto San Julián', 15)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (61, N'Ushuaia', 16)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (62, N'Laguna Escondida', 16)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (63, N'Río Grande', 16)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (64, N'Tolhuin', 16)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (65, N'Resistencia', 17)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (66, N'Campo Largo', 17)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (67, N'Colonia Elisa', 17)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (68, N'Charata', 17)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (69, N'Caceros', 18)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (70, N'Cerrito', 18)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (71, N'Aranguren', 18)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (72, N'Crespo', 18)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (73, N'Rawson', 19)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (74, N'Bahía Bustamante', 19)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (75, N'Camarones', 19)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (76, N'El Hoyo', 19)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (77, N'San Juan', 20)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (78, N'Rivadavia', 20)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (79, N'Santa Lucía', 20)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (80, N'Caucete', 20)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (81, N'San Fernando del Valle de Catamarca', 21)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (82, N'San Isidro', 21)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (83, N'Belen', 21)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (84, N'Recreo', 21)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (85, N'San Miguel de Tucuman', 22)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (86, N'Banda del Rio Sali', 22)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (87, N'Yerba Buena', 22)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (88, N'Villa Mariano Moreno', 22)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (89, N'Santiago del Estero', 23)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (90, N'La Banda', 23)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (91, N'Termas de Rio Hondo', 23)
INSERT [dbo].[localidades] ([id_localidad], [descripcion], [id_provincia]) VALUES (92, N'Añatuya', 23)
SET IDENTITY_INSERT [dbo].[localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[marcas] ON 

INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (1, N'Honda')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (2, N'Porsche')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (3, N'Toyota')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (4, N'Mitsubishi')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (5, N'BMW')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (6, N'Audi')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (7, N'Mazda')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (8, N'Jaguar')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (9, N'Kia')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (10, N'Subaru')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (11, N'Suzuki')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (12, N'Skoda')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (13, N'Dacia')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (14, N'Hyundai')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (15, N'Volkswagen')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (16, N'Jeep')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (17, N'Nissan')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (18, N'Volvo')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (19, N'Ford')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (20, N'Renault')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (21, N'Peugeot')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (22, N'Citroen')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (23, N'Chevrolet')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (24, N'Fiat')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (25, N'Alfa Romeo')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (26, N'Doge')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (27, N'Smart')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (28, N'Mercedes')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (29, N'Mini')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (30, N'Opel')
INSERT [dbo].[marcas] ([id_marca], [marca]) VALUES (31, N'Land Rover')
SET IDENTITY_INSERT [dbo].[marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (1, N'Fuelles', N'transmision', 99, 5, CAST(1500.00 AS Decimal(10, 2)), 1, 1, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (2, N'Terminales', N'Contamos con una amplia gama de espirales', 100, 5, CAST(2500.00 AS Decimal(10, 2)), 1, 4, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (3, N'Pastillas de freno', N'frenos abs', 150, 5, CAST(15000.00 AS Decimal(10, 2)), 1, 13, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (4, N'bateria', N'bimor 20v', 100, 5, CAST(2500.00 AS Decimal(10, 2)), 1, 16, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (5, N'Correas', N'8mm', 500, 5, CAST(500.00 AS Decimal(10, 2)), 1, 19, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (6, N'Bujes', N'Bujes de arranque que retiene el lubricante.', 50, 5, CAST(8000.00 AS Decimal(10, 2)), 1, 22, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (7, N'Campanas', N'Campanas V2', 95, 5, CAST(2000.00 AS Decimal(10, 2)), 1, 28, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (8, N'Humocin', N'maxima seguridad', 100, 5, CAST(4500.00 AS Decimal(10, 2)), 1, 31, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (9, N'Rotulas', N'Rotulas y extremos de direccion', 153, 5, CAST(3600.00 AS Decimal(10, 2)), 1, 1, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (10, N'Discos de frenos', N'deiscos alto rendimiento', 85, 5, CAST(5000.00 AS Decimal(10, 2)), 1, 5, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (11, N'Embragues', N'embragues de reposicion', 69, 5, CAST(5640.00 AS Decimal(10, 2)), 1, 9, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (12, N'Parrillas', N'parrillas suspension', 89, 5, CAST(5050.00 AS Decimal(10, 2)), 1, 13, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (13, N'Rulemanes', N'rulemanes maxima durabilidad', 123, 5, CAST(1000.00 AS Decimal(10, 2)), 1, 21, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (14, N'Semiejes', N'semiejes con bolillas de acero ', 45, 5, CAST(1200.00 AS Decimal(10, 2)), 1, 25, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (15, N'Encendido', N' llaves para arranque', 85, 5, CAST(2350.00 AS Decimal(10, 2)), 1, 29, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (16, N'Lubricantes', N'lubricantes desarrollados  para autos, motos.', 130, 5, CAST(800.00 AS Decimal(10, 2)), 1, 2, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (17, N'Bombas de nafta', N'bombas mecanicas', 250, 5, CAST(5230.00 AS Decimal(10, 2)), 1, 4, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (18, N'Crucetas', N'crucetas para todas las aplicaciones', 200, 5, CAST(1680.00 AS Decimal(10, 2)), 1, 6, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (19, N'Cables para bujias', N'cables alta durabilidad', 300, 5, CAST(599.00 AS Decimal(10, 2)), 1, 8, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (20, N'Bujias', N'Bujias de encendido', 90, 5, CAST(3999.00 AS Decimal(10, 2)), 1, 10, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (21, N'Peugeot 308', N'2.0 Feline', 0, 0, CAST(3689000.00 AS Decimal(10, 2)), 2, 21, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (22, N'Renault Captur', N'2.0 ZEN', 0, 0, CAST(4889000.00 AS Decimal(10, 2)), 2, 20, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (23, N'Ford Fiesta KD', N'1.6 5ptas Titanium', 0, 0, CAST(6189000.00 AS Decimal(10, 2)), 2, 19, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (24, N'Citroen C-Elysee', N'Feel HDi MT 92cv', 0, 0, CAST(4989000.00 AS Decimal(10, 2)), 2, 22, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (25, N'Chevrolet Prisma', N'LTZ 1.4 MT', 0, 0, CAST(2889000.00 AS Decimal(10, 2)), 2, 23, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (26, N'Peugeot 2008', N'1.6 Sport THP 165cv', 0, 0, CAST(6089000.00 AS Decimal(10, 2)), 2, 21, 1)
INSERT [dbo].[productos] ([id_producto], [nombre], [descripcion], [stock], [stock_minimo], [precio], [id_tipo_producto], [id_marca], [estado]) VALUES (27, N'Nissan Kicks', N'1.6 Advance CVT', 0, 0, CAST(5189000.00 AS Decimal(10, 2)), 2, 17, 1)
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
SET IDENTITY_INSERT [dbo].[provincias] ON 

INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (1, N'Córdoba')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (2, N'Buenos Aires')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (3, N'Mendoza')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (4, N'Corrientes')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (5, N'Jujuy')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (6, N'Santa Fe')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (7, N'Salta')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (8, N'Neuquén')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (9, N'San Luis')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (10, N'Misiones')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (11, N'La Rioja')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (12, N'La Pampa')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (13, N'Rio Negro')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (14, N'Formosa')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (15, N'Santa Cruz')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (16, N'Tierra del Fuego')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (17, N'Chaco')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (18, N'Entre Ríos')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (19, N'Chubut')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (20, N'San Juan')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (21, N'Catamarca')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (22, N'Tucuman')
INSERT [dbo].[provincias] ([id_provincia], [descripcion]) VALUES (23, N'Santiago del Estero')
SET IDENTITY_INSERT [dbo].[provincias] OFF
GO
SET IDENTITY_INSERT [dbo].[tipos_clientes] ON 

INSERT [dbo].[tipos_clientes] ([id_tipo_cliente], [descripcion]) VALUES (1, N'consumidorFinal')
INSERT [dbo].[tipos_clientes] ([id_tipo_cliente], [descripcion]) VALUES (2, N'Empresa')
INSERT [dbo].[tipos_clientes] ([id_tipo_cliente], [descripcion]) VALUES (3, N'Concesionario')
INSERT [dbo].[tipos_clientes] ([id_tipo_cliente], [descripcion]) VALUES (4, N'VendedoraDeAutopartes')
SET IDENTITY_INSERT [dbo].[tipos_clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[tipos_doc] ON 

INSERT [dbo].[tipos_doc] ([id_tipo_doc], [descripcion]) VALUES (1, N'DNI')
INSERT [dbo].[tipos_doc] ([id_tipo_doc], [descripcion]) VALUES (2, N'Pasaporte')
INSERT [dbo].[tipos_doc] ([id_tipo_doc], [descripcion]) VALUES (3, N'Libreta Cívica')
INSERT [dbo].[tipos_doc] ([id_tipo_doc], [descripcion]) VALUES (4, N'Partida de nacimiento')
INSERT [dbo].[tipos_doc] ([id_tipo_doc], [descripcion]) VALUES (5, N'CUIT')
INSERT [dbo].[tipos_doc] ([id_tipo_doc], [descripcion]) VALUES (6, N'Otros')
SET IDENTITY_INSERT [dbo].[tipos_doc] OFF
GO
SET IDENTITY_INSERT [dbo].[tipos_productos] ON 

INSERT [dbo].[tipos_productos] ([id_tipo_producto], [descripcion]) VALUES (1, N'AutoPartes')
INSERT [dbo].[tipos_productos] ([id_tipo_producto], [descripcion]) VALUES (2, N'vehículos')
SET IDENTITY_INSERT [dbo].[tipos_productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id_usuario], [nombreUsuario], [contraseña]) VALUES (1, N'Administrador', 123456)
INSERT [dbo].[Usuarios] ([id_usuario], [nombreUsuario], [contraseña]) VALUES (2, N'CremonaJuan', 113932)
INSERT [dbo].[Usuarios] ([id_usuario], [nombreUsuario], [contraseña]) VALUES (3, N'AcostaAgostina', 113868)
INSERT [dbo].[Usuarios] ([id_usuario], [nombreUsuario], [contraseña]) VALUES (4, N'ChiaraviglioSofia', 114052)
INSERT [dbo].[Usuarios] ([id_usuario], [nombreUsuario], [contraseña]) VALUES (5, N'CorreaLautaro', 114149)
INSERT [dbo].[Usuarios] ([id_usuario], [nombreUsuario], [contraseña]) VALUES (6, N'KumiecEzequiel', 113898)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[barrios]  WITH CHECK ADD  CONSTRAINT [fk_localidad] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidades] ([id_localidad])
GO
ALTER TABLE [dbo].[barrios] CHECK CONSTRAINT [fk_localidad]
GO
ALTER TABLE [dbo].[clientes]  WITH NOCHECK ADD  CONSTRAINT [fk_id_barrio] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[barrios] ([id_barrio])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk_id_barrio]
GO
ALTER TABLE [dbo].[clientes]  WITH NOCHECK ADD  CONSTRAINT [fk_tipo_cliente] FOREIGN KEY([id_tipo_cliente])
REFERENCES [dbo].[tipos_clientes] ([id_tipo_cliente])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk_tipo_cliente]
GO
ALTER TABLE [dbo].[clientes]  WITH NOCHECK ADD  CONSTRAINT [fk_tipo_doc] FOREIGN KEY([id_tipo_doc])
REFERENCES [dbo].[tipos_doc] ([id_tipo_doc])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk_tipo_doc]
GO
ALTER TABLE [dbo].[detalles_facturas]  WITH NOCHECK ADD  CONSTRAINT [fk_factura] FOREIGN KEY([id_factura])
REFERENCES [dbo].[facturas] ([id_factura])
GO
ALTER TABLE [dbo].[detalles_facturas] CHECK CONSTRAINT [fk_factura]
GO
ALTER TABLE [dbo].[detalles_facturas]  WITH NOCHECK ADD  CONSTRAINT [fk_producto_detalle] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[detalles_facturas] CHECK CONSTRAINT [fk_producto_detalle]
GO
ALTER TABLE [dbo].[detalles_ordenes_pedidos]  WITH CHECK ADD  CONSTRAINT [fk_detalles_orden_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[detalles_ordenes_pedidos] CHECK CONSTRAINT [fk_detalles_orden_productos]
GO
ALTER TABLE [dbo].[detalles_ordenes_pedidos]  WITH CHECK ADD  CONSTRAINT [fk_detalles_ordenes_pedidos_facturas] FOREIGN KEY([id_factura])
REFERENCES [dbo].[facturas] ([id_factura])
GO
ALTER TABLE [dbo].[detalles_ordenes_pedidos] CHECK CONSTRAINT [fk_detalles_ordenes_pedidos_facturas]
GO
ALTER TABLE [dbo].[facturas]  WITH NOCHECK ADD  CONSTRAINT [fk_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [fk_cliente]
GO
ALTER TABLE [dbo].[facturas]  WITH NOCHECK ADD  CONSTRAINT [fk_forma_envio] FOREIGN KEY([id_forma_envio])
REFERENCES [dbo].[formas_envios] ([id_forma_envio])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [fk_forma_envio]
GO
ALTER TABLE [dbo].[facturas]  WITH NOCHECK ADD  CONSTRAINT [fk_forma_pago] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[formas_pagos] ([id_forma_pago])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [fk_forma_pago]
GO
ALTER TABLE [dbo].[localidades]  WITH CHECK ADD  CONSTRAINT [fk_provincia] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincias] ([id_provincia])
GO
ALTER TABLE [dbo].[localidades] CHECK CONSTRAINT [fk_provincia]
GO
ALTER TABLE [dbo].[productos]  WITH NOCHECK ADD  CONSTRAINT [fk_marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[marcas] ([id_marca])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [fk_marca]
GO
ALTER TABLE [dbo].[productos]  WITH NOCHECK ADD  CONSTRAINT [fk_tipo_producto] FOREIGN KEY([id_tipo_producto])
REFERENCES [dbo].[tipos_productos] ([id_tipo_producto])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [fk_tipo_producto]
GO
/****** Object:  StoredProcedure [dbo].[clientes_compras_prod_1_10_cons_final]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[clientes_compras_prod_1_10_cons_final]
as
select c.apellido + space(1) + c.nombre 'Cliente', sum(dt.cantidad*dt.precio_unitario) 'Monto consumido'
from clientes c join
tipos_clientes tc on c.id_tipo_cliente=tc.id_tipo_cliente
join facturas f on c.id_cliente=f.id_cliente
join detalles_facturas dt on f.id_factura=dt.id_factura
join productos p on p.id_producto=dt.id_producto
join tipos_productos tiprod on tiprod.id_tipo_producto= p.id_tipo_producto
where p.id_marca between 1 and 10 and tc.descripcion = 'consumidorFinal'
and tiprod.descripcion = 'autoPartes'
group by c.apellido + space(1) + c.nombre
having sum(dt.cantidad*dt.precio_unitario) > 150000
GO
/****** Object:  StoredProcedure [dbo].[clientes_compras_prod_1_10_cons_final_con_param]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[clientes_compras_prod_1_10_cons_final_con_param]
@precio int
as
select c.apellido + space(1) + c.nombre 'Cliente', sum(dt.cantidad*dt.precio_unitario) 'Monto consumido'
from clientes c join
tipos_clientes tc on c.id_tipo_cliente=tc.id_tipo_cliente
join facturas f on c.id_cliente=f.id_cliente
join detalles_facturas dt on f.id_factura=dt.id_factura
join productos p on p.id_producto=dt.id_producto
join tipos_productos tiprod on tiprod.id_tipo_producto= p.id_tipo_producto
where p.id_marca between 1 and 10 and tc.descripcion = 'consumidorFinal'
and tiprod.descripcion = 'autoPartes'
group by c.apellido + space(1) + c.nombre
having sum(dt.cantidad*dt.precio_unitario) > @precio
GO
/****** Object:  StoredProcedure [dbo].[clientes_loc_cordoba_fecha]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[clientes_loc_cordoba_fecha]
as
Select c.apellido + ' , ' + c.nombre 'Cliente', c.telefono 'Tel contacto', f.fecha 'Fecha de compra', sum( df.cantidad) 'Cantidad de productos',
sum(df.cantidad * df.precio_unitario) 'Total de compra'
from clientes c 
join barrios b on c.id_barrio = b.id_barrio
join localidades l on l.id_localidad = b.id_barrio
join facturas f on f.id_cliente = c.id_cliente
join detalles_facturas df on df.id_factura = f.id_factura
join formas_envios fe on fe.id_forma_envio = f.id_forma_envio
where  l.descripcion in ('Cordoba') and
       fe.forma_envio = 'Envío del local'
      and c.telefono is not null 
      --and DATEDIFF(month, f.fecha, getdate()) = 8
group by  c.apellido + ' , ' + c.nombre,c.telefono,f.fecha
having sum(df.cantidad) > 1                                                          --Acá cambio de 50 a 5
and  sum(df.cantidad * df.precio_unitario) > (select avg (cantidad * precio_unitario)
                                               from detalles_facturas dd join facturas ff on ff.id_factura=dd.id_factura)
                                               --	where DATEDIFF(month, ff.fecha, getdate()) = 12) --Aca cambio el total promedio global de 1 mes a 12
order by 1
GO
/****** Object:  StoredProcedure [dbo].[conocer_telefono_nombre_direccion]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[conocer_telefono_nombre_direccion]
as
select c.apellido + ', ' + c.nombre 'Cliente', c.telefono 'Nº de teléfono', c.email 'E-Mail', b.descripcion 'Barrio', sum(df.cantidad*df.precio_unitario) 'Total comprado'
from clientes c 
join barrios b on c.id_barrio = b.id_barrio
join facturas f on c.id_cliente = f.id_cliente
join detalles_facturas df on f.id_factura = df.id_factura
where 5 > (select count(*)
        from detalles_facturas dt
        where year(f.fecha) = year(getdate())
        and f.id_factura = dt.id_factura
       )
and b.descripcion in ('Centro', 'General Paz', 'Observatiorio')
and DATEDIFF(YEAR,f.fecha, GETDATE()) = 0
group by c.apellido + ', ' + c.nombre, c.telefono, c.email , b.descripcion
having sum(df.cantidad*df.precio_unitario) > 5000000
order by 4 asc, 2 desc
GO
/****** Object:  StoredProcedure [dbo].[conocer_telefono_nombre_direccion_con_param]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[conocer_telefono_nombre_direccion_con_param]
@precio decimal(10,2)
as
select c.apellido + ', ' + c.nombre 'Cliente', c.telefono 'Nº de teléfono', c.email 'E-Mail', b.descripcion 'barrio', sum(df.cantidad*df.precio_unitario) 'Total comprado'
from clientes c 
join barrios b on c.id_barrio = b.id_barrio
join facturas f on c.id_cliente = f.id_cliente
join detalles_facturas df on f.id_factura = df.id_factura
where 5 > (select count(*)conocer_tipo_producto
        from detalles_facturas dt
        where year(f.fecha) = year(getdate())
        and f.id_factura = dt.id_factura
        and c.id_cliente = f.id_cliente
       )
and b.descripcion in ('Centro', 'General Paz', 'Observatiorio')
and DATEDIFF(YEAR,f.fecha, GETDATE()) = 0
group by c.apellido + ', ' + c.nombre, c.telefono, c.email , b.descripcion
having sum(df.cantidad*df.precio_unitario) > @precio
order by 4 asc, 2 desc
GO
/****** Object:  StoredProcedure [dbo].[conocer_tipo_producto]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[conocer_tipo_producto]
as
select 'Vehiculos' 'Tipo de producto', count(*) 'Cantidad de ventas'
from facturas f 
join detalles_facturas	 dt on dt.id_factura=f.id_factura
join productos p on p.id_producto=dt.id_producto
join tipos_productos tpp on tpp.id_tipo_producto=p.id_tipo_producto
where tpp.descripcion = 'vehículos'
and datediff(year,f.fecha,getdate()) between 0 and 5
group by tpp.descripcion
union
select 'Autopartes', count(*)
from facturas f 
join detalles_facturas dt on dt.id_factura=f.id_factura
join productos p on p.id_producto=dt.id_producto
join tipos_productos tpp on tpp.id_tipo_producto=p.id_tipo_producto
where tpp.descripcion = 'autoPartes'
and datediff(year,f.fecha,getdate()) between 0 and 5
group by tpp.descripcion
order by 2 desc
GO
/****** Object:  StoredProcedure [dbo].[conocer_tipo_producto_con_param]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[conocer_tipo_producto_con_param]
@año1 int,
@año2 int
as
select 'Vehículos' 'Tipo de producto', count(*) 'Cantidad de ventas'
from facturas f 
join detalles_facturas dt on dt.id_factura=f.id_factura
join productos p on p.id_producto=dt.id_producto
join tipos_productos tpp on tpp.id_tipo_producto=p.id_tipo_producto
where tpp.descripcion = 'vehículos'
and year(fecha) between @año1 and @año2
group by tpp.descripcion
union
select 'Autopartes', count(*)
from facturas f 
join detalles_facturas dt on dt.id_factura=f.id_factura
join productos p on p.id_producto=dt.id_producto
join tipos_productos tpp on tpp.id_tipo_producto=p.id_tipo_producto
where tpp.descripcion = 'autoPartes'
and year(fecha) between @año1 and @año2
group by tpp.descripcion
order by 2 desc
GO
/****** Object:  StoredProcedure [dbo].[conocer_top_3_marcas]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[conocer_top_3_marcas]
as
select top 3 m.marca 'Marca',count(*) 'Cantidad de ventas'
from facturas f join detalles_facturas dt on dt.id_factura=f.id_factura
join productos p on p.id_producto=dt.id_producto
join marcas m on p.id_marca=m.id_marca
join tipos_productos tp on p.id_tipo_producto=tp.id_tipo_producto
where tp.descripcion = 'vehículos'
group by m.marca
order by 2 desc
GO
/****** Object:  StoredProcedure [dbo].[conocer_top_3_marcas_con_param]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[conocer_top_3_marcas_con_param]
@descripcion varchar(50)
as
select top 3 m.marca 'Marca',count(*) 'Cantidad de ventas'
from facturas f join detalles_facturas dt on dt.id_factura=f.id_factura
join productos p on p.id_producto=dt.id_producto
join marcas m on p.id_marca=m.id_marca
join tipos_productos tp on p.id_tipo_producto=tp.id_tipo_producto
where tp.descripcion = @descripcion
group by m.marca
order by 2 desc
GO
/****** Object:  StoredProcedure [dbo].[Listar_cliente_barrio_precio_por_año]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Listar_cliente_barrio_precio_por_año]
as
select c.apellido + space(1) + c.nombre 'Cliente', b.descripcion 'Barrio', sum(dt.cantidad*dt.precio_unitario) 'Total', p.nombre 'Producto'
from clientes c join barrios b
on b.id_barrio = c.id_barrio
join facturas f on c.id_cliente = f.id_cliente
join detalles_facturas dt on f.id_factura = dt.id_factura
join productos p on p.id_producto = dt.id_producto
where DATEDIFF(year,f.fecha,getdate())=0
--and 30 = any (select id_producto
--			 from productos
--			 where dt.id_producto=id_producto)
group by  c.apellido + space(1) + c.nombre, b.descripcion, p.nombre
having sum(dt.cantidad*dt.precio_unitario) >= (Select avg(det.cantidad*det.precio_unitario)
											  from detalles_facturas det join facturas fac on det.id_factura=fac.id_factura
											  where DATEDIFF(year,fac.fecha,getdate())=0)
GO
/****** Object:  StoredProcedure [dbo].[Listar_cliente_barrio_precio_por_año_con_param]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Listar_cliente_barrio_precio_por_año_con_param]
@codigo int
as
select c.apellido + space(1) + c.nombre 'Cliente', b.descripcion 'Barrio', sum(dt.cantidad*dt.precio_unitario) 'Total', p.nombre 'Producto'
from clientes c join barrios b
on b.id_barrio = c.id_barrio
join facturas f on c.id_cliente = f.id_cliente
join detalles_facturas dt on f.id_factura = dt.id_factura
join productos p on p.id_producto = dt.id_producto
where DATEDIFF(year,f.fecha,getdate())=0
and @codigo = any (select id_producto
			 from productos
			 where dt.id_producto=id_producto)
group by  c.apellido + space(1) + c.nombre, b.descripcion, p.nombre
having sum(dt.cantidad*dt.precio_unitario) >= (Select avg(det.cantidad*det.precio_unitario)
											  from detalles_facturas det join facturas fac on det.id_factura=fac.id_factura
											  where DATEDIFF(year,fac.fecha,getdate())=0)
GO
/****** Object:  StoredProcedure [dbo].[mostrar_total_promedio_por_perido]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_total_promedio_por_perido]
as
select sum(cantidad * precio_unitario) 'Total facturado',
       avg(cantidad * precio_unitario) 'Promedio facturado',
       month(fecha) 'Fecha','Mes' 'Periodo' 
from facturas f
     join detalles_facturas df on df.id_factura = f.id_factura
where YEAR(fecha) = year(getdate())
group by month(fecha)
union
select sum(cantidad * precio_unitario),
       avg(cantidad * precio_unitario),
       datepart(quarter, Fecha), 'trimestre'
from facturas f
     join detalles_facturas df on df.id_factura = f.id_factura
where YEAR(fecha) = year(getdate())
group by datepart(QUARTER, Fecha)
union
select sum(cantidad * precio_unitario) ,
       avg(cantidad * precio_unitario),
       year(fecha) ,'Año' 
from facturas f
     join detalles_facturas df on df.id_factura = f.id_factura
where YEAR(fecha) = year(getdate())
group by year(fecha)
union
select sum(cantidad * precio_unitario) 'Total facturado',
       avg(cantidad * precio_unitario) 'Promedio facturado',
       year(fecha) 'Fecha','Año' 'Periodo' 
from facturas f
     join detalles_facturas df on df.id_factura = f.id_factura
where YEAR(fecha) = year(getdate())
group by year(fecha)

order by 4,3
GO
/****** Object:  StoredProcedure [dbo].[mostrar_total_promedio_por_perido_con_param]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_total_promedio_por_perido_con_param]
@año int
as
select sum(cantidad * precio_unitario) 'Total facturado',
       avg(cantidad * precio_unitario) 'Promedio facturado',
       month(fecha) 'Fecha','Mes' 'Periodo' 
from facturas f
     join detalles_facturas df on df.id_factura = f.id_factura
where YEAR(fecha) = @año
group by month(fecha)
union
select sum(cantidad * precio_unitario),
       avg(cantidad * precio_unitario),
       datepart(quarter, Fecha), 'trimestre'
from facturas f
     join detalles_facturas df on df.id_factura = f.id_factura
where YEAR(fecha) = @año
group by datepart(QUARTER, Fecha)
union
select sum(cantidad * precio_unitario) ,
       avg(cantidad * precio_unitario),
       year(fecha) ,'Año' 
from facturas f
     join detalles_facturas df on df.id_factura = f.id_factura
where YEAR(fecha) = @año
group by year(fecha)
union
select sum(cantidad * precio_unitario) 'Total facturado',
       avg(cantidad * precio_unitario) 'Promedio facturado',
       year(fecha) 'Fecha','Año' 'Periodo' 
from facturas f
     join detalles_facturas df on df.id_factura = f.id_factura
where YEAR(fecha) = @año
group by year(fecha)

order by 4,3
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarCliente]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_ActualizarCliente]
@idCliente int,
@nombre varchar(50),
@apellido varchar(50),
@idTipoDoc int,
@numeroDoc int,
@telefono int,
@email varchar(50),
@idTipoCliente int,
@idBarrio int
as
begin
update clientes
set nombre = @nombre,
apellido = @apellido,
id_tipo_doc = @idTipoDoc,
num_doc = @numeroDoc,
telefono = @telefono,
email = @email,
id_tipo_cliente = @idTipoCliente,
id_barrio = @idBarrio
where id_cliente = @idCliente
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_barrio_sinID]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_barrio_sinID]
as
begin
select *
from barrios
order by id_barrio asc
end
GO
/****** Object:  StoredProcedure [dbo].[SP_comboBarrios]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_comboBarrios]
@id_localidad int
as
begin
select *
from barrios
where @id_localidad = id_localidad
end
GO
/****** Object:  StoredProcedure [dbo].[SP_comboLocalidades]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_comboLocalidades]
@id_provincia int
as
begin
select *
from localidades
where @id_provincia = id_provincia
end
GO
/****** Object:  StoredProcedure [dbo].[SP_comboProvincias]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_comboProvincias]
as
begin
select * from provincias
order by id_provincia asc
end
GO
/****** Object:  StoredProcedure [dbo].[SP_DetalleFactura]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DetalleFactura]
@id_factura int,
@id_producto int,
@cantidad int,
@precio decimal (10,2)
as
begin
insert into detalles_facturas
values(@id_factura,@id_producto,@cantidad,@precio)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_DetalleOrdenFactura]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DetalleOrdenFactura]
@id_producto int,
@id_factura int,
@cantidad int,
@precio decimal (10,2),
@fechaDeEntrega datetime
as
begin
insert into detalles_ordenes_pedidos
values (@id_producto,@id_factura,@cantidad,@precio,@fechaDeEntrega)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarCliente]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_EliminarCliente]
@idCliente int
as
begin
delete clientes
where id_cliente = @idCliente
end
GO
/****** Object:  StoredProcedure [dbo].[SP_FormaEnvio]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_FormaEnvio]
as
begin
select *
from formas_envios
end
GO
/****** Object:  StoredProcedure [dbo].[SP_FormaPago]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_FormaPago]
as
begin
select *
from formas_pagos
end
GO
/****** Object:  StoredProcedure [dbo].[SP_insertarCliente]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_insertarCliente]
@nombre varchar(50),
@apellido varchar(50),
@idTipoDoc int,
@numDoc int,
@telefono int,
@email varchar(50),
@idTipoCliente int,
@idBarrio int
as
begin
insert into clientes
values(@nombre,@apellido,@idTipoDoc,@numDoc,@telefono,@email,@idTipoCliente,@idBarrio)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListaClientes]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_ListaClientes]
as
begin
select *
from clientes
order by 3,2
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListaClientesSinFactura]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_ListaClientesSinFactura]
as
begin
select * 
from clientes
where id_cliente not in (select id_cliente
						 from facturas)
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_localidad_sinID]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_localidad_sinID]
as
begin
select *
from localidades
order by id_localidad asc
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Maestro]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Maestro]
@id_cliente int,
@id_formaPago int,
@id_formaEnvio int,
@interes decimal(10,2),
@descuento decimal (10,2),
@fecha Datetime,
@id_factura int output
as
begin
insert into facturas
values(@id_Cliente, @id_FormaPago, @id_FormaEnvio, @interes, @descuento,@fecha);
set @id_factura = SCOPE_IDENTITY();
end
GO
/****** Object:  StoredProcedure [dbo].[SP_prodcutosAutopartes]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_prodcutosAutopartes]
as
begin
select *
from productos
where id_tipo_producto = 1
and estado = 1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_prodcutosVehiculos]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_prodcutosVehiculos]
as
begin
select *
from productos
where id_tipo_producto = 2
and estado = 1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_tipoCliente]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_tipoCliente]
as
begin
select * 
from tipos_clientes
order by id_tipo_cliente asc
end
GO
/****** Object:  StoredProcedure [dbo].[SP_tipoDocumentos]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_tipoDocumentos]
as
begin
select *
from tipos_doc
order by 1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_tipoProducto]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_tipoProducto]
as
begin
select *
from tipos_productos
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ultimaFactura]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_ultimaFactura]
@id int output
as
begin
set @id = (select max(id_factura)
		   from facturas)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Usuarios]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Usuarios]
as
select nombreUsuario, contraseña
from Usuarios
GO
/****** Object:  StoredProcedure [dbo].[total_abonado_op_fp_clientes]    Script Date: 9/11/2022 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[total_abonado_op_fp_clientes]
as
select nombre+', '+apellido 'Cliente',sum(dof.cantidad * dof.precio_unitario)'Total abonado',fp.forma_pago'Forma de Pago' 
from detalles_facturas dof 
     join facturas f on f.id_factura=dof.id_factura 
     join clientes c on c.id_cliente=f.id_cliente 
     join formas_pagos fp on fp.id_forma_pago=f.id_forma_pago 
where year(f.fecha)=year(getdate())
group by nombre+', '+apellido,fp.forma_pago 
having sum(dof.cantidad * dof.precio_unitario)>(select avg(dp.cantidad*dp.precio_unitario) 
                                          from detalles_facturas dp 
                                          join facturas fa on dp.id_factura=fa.id_factura 
                                          where year(fa.fecha)=year(getdate()) )
GO
USE [master]
GO
ALTER DATABASE [tp_laboratorio_automotriz] SET  READ_WRITE 
GO

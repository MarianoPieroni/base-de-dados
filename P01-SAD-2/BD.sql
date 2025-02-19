USE [master]
GO
/****** Object:  Database [P01-SAD]    Script Date: 09/01/2025 01:40:52 ******/
CREATE DATABASE [P01-SAD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SAD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SAD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SAD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SAD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [P01-SAD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [P01-SAD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [P01-SAD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [P01-SAD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [P01-SAD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [P01-SAD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [P01-SAD] SET ARITHABORT OFF 
GO
ALTER DATABASE [P01-SAD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [P01-SAD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [P01-SAD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [P01-SAD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [P01-SAD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [P01-SAD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [P01-SAD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [P01-SAD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [P01-SAD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [P01-SAD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [P01-SAD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [P01-SAD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [P01-SAD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [P01-SAD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [P01-SAD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [P01-SAD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [P01-SAD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [P01-SAD] SET RECOVERY FULL 
GO
ALTER DATABASE [P01-SAD] SET  MULTI_USER 
GO
ALTER DATABASE [P01-SAD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [P01-SAD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [P01-SAD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [P01-SAD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [P01-SAD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [P01-SAD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'P01-SAD', N'ON'
GO
ALTER DATABASE [P01-SAD] SET QUERY_STORE = OFF
GO
USE [P01-SAD]
GO
/****** Object:  Table [dbo].[avaliacao]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avaliacao](
	[avaliacao_id] [int] NOT NULL,
	[oficina_id] [int] NOT NULL,
	[matricula] [char](8) NOT NULL,
	[nota] [int] NULL,
 CONSTRAINT [PK_avaliacao] PRIMARY KEY CLUSTERED 
(
	[avaliacao_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[nif] [int] NOT NULL,
	[nome] [varchar](100) NULL,
	[cp] [int] NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[codigopostal]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[codigopostal](
	[cp] [int] NOT NULL,
	[localidade] [varchar](100) NULL,
 CONSTRAINT [PK_codigopostal] PRIMARY KEY CLUSTERED 
(
	[cp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contacto]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacto](
	[numero_c] [varchar](50) NULL,
	[tipo_contacto_id] [int] NOT NULL,
	[nif] [int] NOT NULL,
	[oficina_id] [int] NULL,
 CONSTRAINT [PK_contacto] PRIMARY KEY CLUSTERED 
(
	[tipo_contacto_id] ASC,
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historico_revisao]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historico_revisao](
	[historico_r_id] [int] NOT NULL,
	[data] [int] NULL,
 CONSTRAINT [PK_historico_revisao] PRIMARY KEY CLUSTERED 
(
	[historico_r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interesse]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interesse](
	[interesse_id] [int] NOT NULL,
	[nif] [int] NULL,
	[modelo_id] [int] NULL,
	[proposta] [money] NULL,
 CONSTRAINT [PK_interesse] PRIMARY KEY CLUSTERED 
(
	[interesse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manutencao]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manutencao](
	[historico_m_id] [int] NOT NULL,
	[data] [datetime] NULL,
	[valor] [decimal](10, 2) NULL,
	[tipo_manu_id] [int] NOT NULL,
	[oficina_id] [int] NULL,
 CONSTRAINT [PK_manutencao] PRIMARY KEY CLUSTERED 
(
	[historico_m_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marca]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marca](
	[marca_id] [int] IDENTITY(1,1) NOT NULL,
	[nome_marca] [varchar](50) NULL,
 CONSTRAINT [PK_marca] PRIMARY KEY CLUSTERED 
(
	[marca_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelo]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelo](
	[modelo_id] [int] NOT NULL,
	[ano] [int] NULL,
	[marca_id] [int] NULL,
 CONSTRAINT [PK_modelo] PRIMARY KEY CLUSTERED 
(
	[modelo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oficina]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oficina](
	[oficina_id] [int] NOT NULL,
	[nome] [nvarchar](50) NULL,
	[cp] [int] NULL,
 CONSTRAINT [PK_oficina] PRIMARY KEY CLUSTERED 
(
	[oficina_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[matricula] [char](8) NOT NULL,
	[quilometragem] [int] NULL,
	[manu_id] [int] NULL,
	[transacao_id] [int] NULL,
	[historico_r_id] [int] NULL,
	[modelo_id] [int] NULL,
	[preco_venda] [decimal](10, 2) NULL,
	[nif] [int] NULL,
 CONSTRAINT [PK_stock_1] PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_contacto]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_contacto](
	[tipo_contacto_id] [int] IDENTITY(1,1) NOT NULL,
	[desc_contacto] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_contacto] PRIMARY KEY CLUSTERED 
(
	[tipo_contacto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_manutencao]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_manutencao](
	[tipo_manu_id] [int] IDENTITY(1,1) NOT NULL,
	[desc_manu] [varchar](100) NULL,
 CONSTRAINT [PK_tipo_manutencao] PRIMARY KEY CLUSTERED 
(
	[tipo_manu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_transacao]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_transacao](
	[tipo_transacao_id] [int] IDENTITY(1,1) NOT NULL,
	[desc_transacao] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_transacao] PRIMARY KEY CLUSTERED 
(
	[tipo_transacao_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transacao]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transacao](
	[transacao_id] [int] NOT NULL,
	[data] [datetime] NULL,
	[preco_compra] [decimal](10, 2) NULL,
	[historico_compras] [int] NOT NULL,
	[tipo_transacao_id] [int] NOT NULL,
 CONSTRAINT [PK_transacao] PRIMARY KEY CLUSTERED 
(
	[transacao_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (2, 10, N'12CC34  ', 4)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (3, 12, N'DD1234  ', 4)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (4, 13, N'5678EE  ', 3)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (5, 14, N'FF89GG  ', 5)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (6, 15, N'34HH56  ', 4)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (7, 16, N'JJ7890  ', 2)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (8, 17, N'1234KK  ', 5)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (9, 18, N'LL45MM  ', 3)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (10, 19, N'67NN89  ', 4)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (12, 21, N'12CC34  ', 1)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (13, 22, N'DD1234  ', 4)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (14, 23, N'5678EE  ', 3)
INSERT [dbo].[avaliacao] ([avaliacao_id], [oficina_id], [matricula], [nota]) VALUES (15, 24, N'FF89GG  ', 5)
GO
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (123789456, N'Paula Cruz', 6000086)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (147258369, N'André Antunes', 8000072)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (159753456, N'Ana Ferreira', 4000008)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (250837655, N'Paulo Borges', 1000001)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (258369147, N'Luís Figueiredo', 2400129)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (321654987, N'Rui Sousa', 5400323)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (369147258, N'Sara Ramos', 3500096)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (369852147, N'Beatriz Correia', 2900105)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (456123789, N'Pedro Oliveira', 3000056)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (654987123, N'Tiago Mendes', 7000537)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (741258963, N'Sofia Rocha', 7350121)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (753951456, N'Isabel Martins', 4900001)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (852741963, N'Miguel Costa', 5000081)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (852963741, N'Mariana Silva', 7600021)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (951357852, N'Carlos Almeida', 4700110)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (951654852, N'Helena Lopes', 5300108)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (963852741, N'Ricardo Pinto', 7400004)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (987321654, N'Vera Carvalho', 6300495)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (987456321, N'Eduardo Vieira', 3700110)
INSERT [dbo].[cliente] ([nif], [nome], [cp]) VALUES (987654321, N'Maria Santos', 2000108)
GO
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (1000001, N'Lisboa')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (2000108, N'Santarém')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (2300512, N'Tomar')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (2400129, N'Leiria')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (2600001, N'Vila Franca de Xira')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (2700336, N'Amadora')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (2800050, N'Almada')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (2900105, N'Setúbal')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (3000056, N'Coimbra')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (3500096, N'Viseu')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (3600111, N'Castro Daire')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (3700110, N'São João da Madeira')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (3800123, N'Aveiro')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (4000008, N'Porto')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (4700110, N'Braga')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (4900001, N'Viana do Castelo')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (5000081, N'Vila Real')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (5300108, N'Bragança')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (5400323, N'Chaves')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (6000086, N'Castelo Branco')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (6300495, N'Guarda')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (7000537, N'Évora')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (7350121, N'Elvas')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (7400004, N'Ponte de Sor')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (7600021, N'Aljustrel')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (8000072, N'Faro')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (9000113, N'Funchal')
INSERT [dbo].[codigopostal] ([cp], [localidade]) VALUES (9500121, N'Ponta Delgada')
GO
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'910987654', 1, 159753456, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'911911775', 1, 250837655, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'934567890', 1, 321654987, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'923768565', 1, 369147258, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'926789123', 1, 456123789, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'937654321', 1, 753951456, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'961234567', 1, 852741963, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'932345678', 1, 987654321, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'ana.ferreira@example.com', 2, 159753456, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'paulo.borges@example.com', 2, 250837655, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'rui.sousa@example.com', 2, 321654987, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'sara.ramos@example.com', 2, 369147258, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'pedro.oliveira@example.com', 2, 456123789, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'isabel.martins@example.com', 2, 753951456, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'miguel.costa@example.com', 2, 852741963, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'carlos.almeida@example.com', 2, 951357852, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'helena.lopes@example.com', 2, 951654852, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'maria.santos@example.com', 2, 987654321, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'214567890', 4, 951357852, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'215678934', 4, 951654852, NULL)
INSERT [dbo].[contacto] ([numero_c], [tipo_contacto_id], [nif], [oficina_id]) VALUES (N'213456789', 4, 987654321, NULL)
GO
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (1, 20240101)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (2, 20240201)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (3, 20240301)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (4, 20240415)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (5, 20240510)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (6, 20240620)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (7, 20240705)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (8, 20240815)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (9, 20240925)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (10, 20241010)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (11, 20241105)
INSERT [dbo].[historico_revisao] ([historico_r_id], [data]) VALUES (12, 20241220)
GO
INSERT [dbo].[interesse] ([interesse_id], [nif], [modelo_id], [proposta]) VALUES (3, 456123789, 1, NULL)
INSERT [dbo].[interesse] ([interesse_id], [nif], [modelo_id], [proposta]) VALUES (4, 951357852, 3, 15000.0000)
INSERT [dbo].[interesse] ([interesse_id], [nif], [modelo_id], [proposta]) VALUES (5, 852741963, 2, 12000.0000)
INSERT [dbo].[interesse] ([interesse_id], [nif], [modelo_id], [proposta]) VALUES (6, 321654987, 5, 8000.0000)
INSERT [dbo].[interesse] ([interesse_id], [nif], [modelo_id], [proposta]) VALUES (7, 987321654, 6, NULL)
INSERT [dbo].[interesse] ([interesse_id], [nif], [modelo_id], [proposta]) VALUES (8, 741258963, 7, 14000.0000)
INSERT [dbo].[interesse] ([interesse_id], [nif], [modelo_id], [proposta]) VALUES (9, 852963741, 8, 18000.0000)
INSERT [dbo].[interesse] ([interesse_id], [nif], [modelo_id], [proposta]) VALUES (10, 258369147, 9, 20000.0000)
GO
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (1, CAST(N'2024-01-15T00:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (2, CAST(N'2024-02-20T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)), 2, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (3, CAST(N'2024-03-15T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), 3, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (4, CAST(N'2024-04-10T00:00:00.000' AS DateTime), CAST(450.00 AS Decimal(10, 2)), 4, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (5, CAST(N'2024-05-05T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)), 5, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (6, CAST(N'2024-06-12T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)), 6, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (7, CAST(N'2024-07-19T00:00:00.000' AS DateTime), CAST(250.00 AS Decimal(10, 2)), 7, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (8, CAST(N'2024-08-25T00:00:00.000' AS DateTime), CAST(600.00 AS Decimal(10, 2)), 8, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (9, CAST(N'2024-09-10T00:00:00.000' AS DateTime), CAST(80.00 AS Decimal(10, 2)), 9, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (10, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(180.00 AS Decimal(10, 2)), 10, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (11, CAST(N'2024-11-15T00:00:00.000' AS DateTime), CAST(220.00 AS Decimal(10, 2)), 11, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (12, CAST(N'2024-12-20T00:00:00.000' AS DateTime), CAST(320.00 AS Decimal(10, 2)), 12, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (13, CAST(N'2024-01-22T00:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)), 13, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (14, CAST(N'2024-02-18T00:00:00.000' AS DateTime), CAST(120.00 AS Decimal(10, 2)), 14, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (15, CAST(N'2024-03-10T00:00:00.000' AS DateTime), CAST(50.00 AS Decimal(10, 2)), 15, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (16, CAST(N'2024-04-05T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)), 16, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (17, CAST(N'2024-05-15T00:00:00.000' AS DateTime), CAST(250.00 AS Decimal(10, 2)), 17, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (18, CAST(N'2024-06-30T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), 18, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (19, CAST(N'2024-07-20T00:00:00.000' AS DateTime), CAST(480.00 AS Decimal(10, 2)), 19, NULL)
INSERT [dbo].[manutencao] ([historico_m_id], [data], [valor], [tipo_manu_id], [oficina_id]) VALUES (20, CAST(N'2024-08-15T00:00:00.000' AS DateTime), CAST(800.00 AS Decimal(10, 2)), 20, NULL)
GO
SET IDENTITY_INSERT [dbo].[marca] ON 

INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (1, N'Toyota')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (2, N'BMW')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (3, N'Ford')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (4, N'Volkswagen')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (5, N'Mercedes-Benz')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (6, N'Audi')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (7, N'Honda')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (8, N'Hyundai')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (9, N'Chevrolet')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (10, N'Nissan')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (11, N'Kia')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (12, N'Peugeot')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (13, N'Renault')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (14, N'Volvo')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (15, N'Jeep')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (16, N'Fiat')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (17, N'Subaru')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (18, N'Mazda')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (19, N'Lexus')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (20, N'Jaguar')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (21, N'Land Rover')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (22, N'Mitsubishi')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (23, N'Porsche')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (24, N'Tesla')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (25, N'Alfa Romeo')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (26, N'Cadillac')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (27, N'Chrysler')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (28, N'Suzuki')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (29, N'Dodge')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (30, N'Bugatti')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (31, N'Ferrari')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (32, N'Lamborghini')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (33, N'Aston Martin')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (34, N'McLaren')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (35, N'Rolls-Royce')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (36, N'Bentley')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (37, N'Skoda')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (38, N'Seat')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (39, N'Mini')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (40, N'Opel')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (41, N'Citroën')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (42, N'Isuzu')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (43, N'Ram')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (44, N'GMC')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (45, N'Pagani')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (46, N'Maserati')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (47, N'Acura')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (48, N'Infiniti')
INSERT [dbo].[marca] ([marca_id], [nome_marca]) VALUES (49, N'Genesis')
SET IDENTITY_INSERT [dbo].[marca] OFF
GO
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (1, 2021, 1)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (2, 2020, 2)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (3, 2019, 3)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (4, 2022, 4)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (5, 2021, 5)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (6, 2020, 6)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (7, 2018, 7)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (8, 2017, 8)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (9, 2016, 9)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (10, 2022, 10)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (11, 2021, 11)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (12, 2019, 12)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (13, 2018, 13)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (14, 2020, 14)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (15, 2022, 15)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (16, 2021, 16)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (17, 2020, 17)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (18, 2019, 18)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (19, 2022, 19)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (20, 2021, 20)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (21, 2020, 21)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (22, 2019, 22)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (23, 2021, 23)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (24, 2022, 24)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (25, 2018, 25)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (26, 2019, 26)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (27, 2017, 27)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (28, 2022, 28)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (29, 2021, 29)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (30, 2020, 30)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (31, 2022, 31)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (32, 2022, 32)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (33, 2021, 33)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (34, 2020, 34)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (35, 2021, 35)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (36, 2020, 36)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (37, 2018, 37)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (38, 2019, 38)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (39, 2020, 39)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (40, 2022, 40)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (41, 2021, 41)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (42, 2020, 42)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (43, 2019, 43)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (44, 2021, 44)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (45, 2022, 45)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (46, 2020, 46)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (47, 2018, 47)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (48, 2019, 48)
INSERT [dbo].[modelo] ([modelo_id], [ano], [marca_id]) VALUES (49, 2021, 49)
GO
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (10, N'Oficina do Zé', 1000001)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (11, N'Mão na Roda', 2000108)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (12, N'Relâmpago Marquinhos', 2700336)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (13, N'Mate', 3000056)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (14, N'Rodas Velozes', 4000008)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (15, N'Auto Reparadora Braga', 4700110)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (16, N'Viana Motors', 4900001)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (17, N'Vila Real Peças', 5000081)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (18, N'Oficina Bragança', 5300108)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (19, N'Chaves Auto Center', 5400323)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (20, N'Castelo Branco Automóveis', 6000086)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (21, N'Oficina da Guarda', 6300495)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (22, N'Évora Mecânica', 7000537)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (23, N'Elvas Auto Shop', 7350121)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (24, N'Aljustrel Car Service', 7600021)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (25, N'Faro Automóveis', 8000072)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (26, N'Setúbal Pneus e Peças', 2900105)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (27, N'Leiria Car Center', 2400129)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (28, N'Viseu Motores', 3500096)
INSERT [dbo].[oficina] ([oficina_id], [nome], [cp]) VALUES (29, N'Aveiro Rodas e Motores', 3700110)
GO
INSERT [dbo].[stock] ([matricula], [quilometragem], [manu_id], [transacao_id], [historico_r_id], [modelo_id], [preco_venda], [nif]) VALUES (N'1234KK  ', 80000, 8, 8, 8, 8, CAST(10000.00 AS Decimal(10, 2)), 951654852)
INSERT [dbo].[stock] ([matricula], [quilometragem], [manu_id], [transacao_id], [historico_r_id], [modelo_id], [preco_venda], [nif]) VALUES (N'12CC34  ', 30000, 2, 2, 2, 2, CAST(30000.00 AS Decimal(10, 2)), 987654321)
INSERT [dbo].[stock] ([matricula], [quilometragem], [manu_id], [transacao_id], [historico_r_id], [modelo_id], [preco_venda], [nif]) VALUES (N'34HH56  ', 35000, 6, 6, 6, 6, CAST(27000.00 AS Decimal(10, 2)), 753951456)
INSERT [dbo].[stock] ([matricula], [quilometragem], [manu_id], [transacao_id], [historico_r_id], [modelo_id], [preco_venda], [nif]) VALUES (N'5678EE  ', 60000, 4, 4, 4, 4, CAST(18000.00 AS Decimal(10, 2)), 159753456)
INSERT [dbo].[stock] ([matricula], [quilometragem], [manu_id], [transacao_id], [historico_r_id], [modelo_id], [preco_venda], [nif]) VALUES (N'67NN89  ', 25000, 10, 10, 10, 10, CAST(40000.00 AS Decimal(10, 2)), 123789456)
INSERT [dbo].[stock] ([matricula], [quilometragem], [manu_id], [transacao_id], [historico_r_id], [modelo_id], [preco_venda], [nif]) VALUES (N'DD1234  ', 45000, 3, 3, 3, 3, CAST(25000.00 AS Decimal(10, 2)), 456123789)
INSERT [dbo].[stock] ([matricula], [quilometragem], [manu_id], [transacao_id], [historico_r_id], [modelo_id], [preco_venda], [nif]) VALUES (N'FF89GG  ', 40000, 5, 5, 5, 5, CAST(22000.00 AS Decimal(10, 2)), 951357852)
INSERT [dbo].[stock] ([matricula], [quilometragem], [manu_id], [transacao_id], [historico_r_id], [modelo_id], [preco_venda], [nif]) VALUES (N'JJ7890  ', 70000, 7, 7, 7, 7, CAST(15000.00 AS Decimal(10, 2)), 852741963)
INSERT [dbo].[stock] ([matricula], [quilometragem], [manu_id], [transacao_id], [historico_r_id], [modelo_id], [preco_venda], [nif]) VALUES (N'LL45MM  ', 30000, 9, 9, 9, 9, CAST(32000.00 AS Decimal(10, 2)), 321654987)
GO
SET IDENTITY_INSERT [dbo].[tipo_contacto] ON 

INSERT [dbo].[tipo_contacto] ([tipo_contacto_id], [desc_contacto]) VALUES (1, N'Telemóvel')
INSERT [dbo].[tipo_contacto] ([tipo_contacto_id], [desc_contacto]) VALUES (2, N'Email')
INSERT [dbo].[tipo_contacto] ([tipo_contacto_id], [desc_contacto]) VALUES (3, N'Fax')
INSERT [dbo].[tipo_contacto] ([tipo_contacto_id], [desc_contacto]) VALUES (4, N'Telefone Fixo')
INSERT [dbo].[tipo_contacto] ([tipo_contacto_id], [desc_contacto]) VALUES (5, N'Carta')
INSERT [dbo].[tipo_contacto] ([tipo_contacto_id], [desc_contacto]) VALUES (6, N'Outro')
SET IDENTITY_INSERT [dbo].[tipo_contacto] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_manutencao] ON 

INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (1, N'Troca de óleo')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (2, N'Revisão geral')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (3, N'Substituição de peças')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (4, N'Inspeção técnica')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (5, N'Alinhamento e balanceamento')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (6, N'Troca de filtros')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (7, N'Reparação de travões')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (8, N'Manutenção do sistema elétrico')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (9, N'Calibração de pneus')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (10, N'Troca de baterias')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (11, N'Limpeza de sistema de injeção')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (12, N'Troca de correia dentada')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (13, N'Manutenção de suspensão')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (14, N'Reparação do sistema de ar condicionado')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (15, N'Lubrificação de componentes')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (16, N'Manutenção preventiva')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (17, N'Reparação de vazamentos')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (18, N'Manutenção do sistema de escapamento')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (19, N'Substituição de amortecedores')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (20, N'Diagnóstico de motor')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (21, N'Atualização de software de bordo')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (22, N'Revisão de segurança')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (23, N'Teste de emissões')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (24, N'Troca de velas de ignição')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (25, N'Manutenção do sistema de combustível')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (26, N'Inspeção de carroçaria')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (27, N'Reparação de faróis')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (28, N'Polimento e conservação de pintura')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (29, N'Reparação de janelas e vidros')
INSERT [dbo].[tipo_manutencao] ([tipo_manu_id], [desc_manu]) VALUES (30, N'Troca de fluido de transmissão')
SET IDENTITY_INSERT [dbo].[tipo_manutencao] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_transacao] ON 

INSERT [dbo].[tipo_transacao] ([tipo_transacao_id], [desc_transacao]) VALUES (1, N'Crédito')
INSERT [dbo].[tipo_transacao] ([tipo_transacao_id], [desc_transacao]) VALUES (2, N'Dinheiro')
INSERT [dbo].[tipo_transacao] ([tipo_transacao_id], [desc_transacao]) VALUES (3, N'Débito')
SET IDENTITY_INSERT [dbo].[tipo_transacao] OFF
GO
INSERT [dbo].[transacao] ([transacao_id], [data], [preco_compra], [historico_compras], [tipo_transacao_id]) VALUES (1, CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(10, 2)), 1, 2)
INSERT [dbo].[transacao] ([transacao_id], [data], [preco_compra], [historico_compras], [tipo_transacao_id]) VALUES (2, CAST(N'2024-03-10T00:00:00.000' AS DateTime), CAST(25000.00 AS Decimal(10, 2)), 2, 1)
INSERT [dbo].[transacao] ([transacao_id], [data], [preco_compra], [historico_compras], [tipo_transacao_id]) VALUES (3, CAST(N'2024-04-15T00:00:00.000' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), 3, 2)
INSERT [dbo].[transacao] ([transacao_id], [data], [preco_compra], [historico_compras], [tipo_transacao_id]) VALUES (4, CAST(N'2024-05-20T00:00:00.000' AS DateTime), CAST(20000.00 AS Decimal(10, 2)), 4, 1)
INSERT [dbo].[transacao] ([transacao_id], [data], [preco_compra], [historico_compras], [tipo_transacao_id]) VALUES (5, CAST(N'2024-06-05T00:00:00.000' AS DateTime), CAST(18000.00 AS Decimal(10, 2)), 5, 1)
INSERT [dbo].[transacao] ([transacao_id], [data], [preco_compra], [historico_compras], [tipo_transacao_id]) VALUES (6, CAST(N'2024-07-10T00:00:00.000' AS DateTime), CAST(40000.00 AS Decimal(10, 2)), 6, 2)
INSERT [dbo].[transacao] ([transacao_id], [data], [preco_compra], [historico_compras], [tipo_transacao_id]) VALUES (7, CAST(N'2024-08-25T00:00:00.000' AS DateTime), CAST(12000.00 AS Decimal(10, 2)), 7, 2)
INSERT [dbo].[transacao] ([transacao_id], [data], [preco_compra], [historico_compras], [tipo_transacao_id]) VALUES (8, CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(35000.00 AS Decimal(10, 2)), 8, 1)
INSERT [dbo].[transacao] ([transacao_id], [data], [preco_compra], [historico_compras], [tipo_transacao_id]) VALUES (9, CAST(N'2024-10-05T00:00:00.000' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 9, 1)
INSERT [dbo].[transacao] ([transacao_id], [data], [preco_compra], [historico_compras], [tipo_transacao_id]) VALUES (10, CAST(N'2024-11-20T00:00:00.000' AS DateTime), CAST(22000.00 AS Decimal(10, 2)), 10, 2)
GO
ALTER TABLE [dbo].[avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_avaliacao_oficina] FOREIGN KEY([oficina_id])
REFERENCES [dbo].[oficina] ([oficina_id])
GO
ALTER TABLE [dbo].[avaliacao] CHECK CONSTRAINT [FK_avaliacao_oficina]
GO
ALTER TABLE [dbo].[avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_avaliacao_stock] FOREIGN KEY([matricula])
REFERENCES [dbo].[stock] ([matricula])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[avaliacao] CHECK CONSTRAINT [FK_avaliacao_stock]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_codigopostal] FOREIGN KEY([cp])
REFERENCES [dbo].[codigopostal] ([cp])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_codigopostal]
GO
ALTER TABLE [dbo].[contacto]  WITH CHECK ADD  CONSTRAINT [FK_contacto_oficina] FOREIGN KEY([oficina_id])
REFERENCES [dbo].[oficina] ([oficina_id])
GO
ALTER TABLE [dbo].[contacto] CHECK CONSTRAINT [FK_contacto_oficina]
GO
ALTER TABLE [dbo].[contacto]  WITH CHECK ADD  CONSTRAINT [FKcontacto354372] FOREIGN KEY([nif])
REFERENCES [dbo].[cliente] ([nif])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contacto] CHECK CONSTRAINT [FKcontacto354372]
GO
ALTER TABLE [dbo].[contacto]  WITH CHECK ADD  CONSTRAINT [FKcontacto891821] FOREIGN KEY([tipo_contacto_id])
REFERENCES [dbo].[tipo_contacto] ([tipo_contacto_id])
GO
ALTER TABLE [dbo].[contacto] CHECK CONSTRAINT [FKcontacto891821]
GO
ALTER TABLE [dbo].[interesse]  WITH CHECK ADD  CONSTRAINT [FK_interesse_cliente] FOREIGN KEY([nif])
REFERENCES [dbo].[cliente] ([nif])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[interesse] CHECK CONSTRAINT [FK_interesse_cliente]
GO
ALTER TABLE [dbo].[interesse]  WITH CHECK ADD  CONSTRAINT [FK_interesse_modelo] FOREIGN KEY([modelo_id])
REFERENCES [dbo].[modelo] ([modelo_id])
GO
ALTER TABLE [dbo].[interesse] CHECK CONSTRAINT [FK_interesse_modelo]
GO
ALTER TABLE [dbo].[manutencao]  WITH CHECK ADD  CONSTRAINT [FK_historico_manu_tipo_manutencao] FOREIGN KEY([tipo_manu_id])
REFERENCES [dbo].[tipo_manutencao] ([tipo_manu_id])
GO
ALTER TABLE [dbo].[manutencao] CHECK CONSTRAINT [FK_historico_manu_tipo_manutencao]
GO
ALTER TABLE [dbo].[manutencao]  WITH CHECK ADD  CONSTRAINT [FK_manutencao_oficina] FOREIGN KEY([oficina_id])
REFERENCES [dbo].[oficina] ([oficina_id])
GO
ALTER TABLE [dbo].[manutencao] CHECK CONSTRAINT [FK_manutencao_oficina]
GO
ALTER TABLE [dbo].[modelo]  WITH CHECK ADD  CONSTRAINT [FK_modelo_marca] FOREIGN KEY([marca_id])
REFERENCES [dbo].[marca] ([marca_id])
GO
ALTER TABLE [dbo].[modelo] CHECK CONSTRAINT [FK_modelo_marca]
GO
ALTER TABLE [dbo].[oficina]  WITH CHECK ADD  CONSTRAINT [FK_oficina_codigopostal] FOREIGN KEY([cp])
REFERENCES [dbo].[codigopostal] ([cp])
GO
ALTER TABLE [dbo].[oficina] CHECK CONSTRAINT [FK_oficina_codigopostal]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [FK_stock_cliente] FOREIGN KEY([nif])
REFERENCES [dbo].[cliente] ([nif])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [FK_stock_cliente]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [FK_stock_historico_manu] FOREIGN KEY([manu_id])
REFERENCES [dbo].[manutencao] ([historico_m_id])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [FK_stock_historico_manu]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [FK_stock_historico_revisao] FOREIGN KEY([historico_r_id])
REFERENCES [dbo].[historico_revisao] ([historico_r_id])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [FK_stock_historico_revisao]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [FK_stock_modelo] FOREIGN KEY([modelo_id])
REFERENCES [dbo].[modelo] ([modelo_id])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [FK_stock_modelo]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [FK_stock_transacao1] FOREIGN KEY([transacao_id])
REFERENCES [dbo].[transacao] ([transacao_id])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [FK_stock_transacao1]
GO
ALTER TABLE [dbo].[transacao]  WITH CHECK ADD  CONSTRAINT [FKtransacao369771] FOREIGN KEY([tipo_transacao_id])
REFERENCES [dbo].[tipo_transacao] ([tipo_transacao_id])
GO
ALTER TABLE [dbo].[transacao] CHECK CONSTRAINT [FKtransacao369771]
GO
/****** Object:  StoredProcedure [dbo].[PesquisarCliente]    Script Date: 09/01/2025 01:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PesquisarCliente]
    @NIF NVARCHAR(9)
AS
BEGIN
    SELECT 
        c.NIF,
        c.Nome AS NomeCliente,
        c.cp AS CodigoPostal,
        ISNULL(email.numero_c, 'Sem Email') AS Email,
        telefones.Telefones,
        matriculas.Matriculas
    FROM cliente c
    LEFT JOIN contacto email ON c.NIF = email.NIF AND email.tipo_contacto_id = 2
    LEFT JOIN (
        SELECT NIF, STRING_AGG(numero_c, ', ') AS Telefones
        FROM contacto
        WHERE tipo_contacto_id = 1
        GROUP BY NIF
    ) telefones ON c.NIF = telefones.NIF
    LEFT JOIN (
        SELECT nif, STRING_AGG(matricula, ', ') AS Matriculas
        FROM stock
        GROUP BY nif
    ) matriculas ON c.NIF = matriculas.nif
    WHERE c.NIF = @NIF;
END;

GO
USE [master]
GO
ALTER DATABASE [P01-SAD] SET  READ_WRITE 
GO

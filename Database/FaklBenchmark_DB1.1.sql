USE [master]
GO
/****** Object:  Database [Fakl_benchmarking]    Script Date: 11/06/2014 12:43:41 ******/
CREATE DATABASE [Fakl_benchmarking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fakl_benchmarking', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Fakl_benchmarking.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Fakl_benchmarking_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Fakl_benchmarking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Fakl_benchmarking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fakl_benchmarking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fakl_benchmarking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fakl_benchmarking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fakl_benchmarking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fakl_benchmarking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fakl_benchmarking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fakl_benchmarking] SET  MULTI_USER 
GO
ALTER DATABASE [Fakl_benchmarking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fakl_benchmarking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fakl_benchmarking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fakl_benchmarking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Fakl_benchmarking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Fakl_benchmarking', N'ON'
GO
USE [Fakl_benchmarking]
GO
/****** Object:  Table [dbo].[answers]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answers](
	[id] [int] NOT NULL,
	[value] [bigint] NOT NULL,
	[question_id] [int] NOT NULL,
	[yearreport_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[base_divisors]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_divisors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](25) NOT NULL,
	[tooltip] [nchar](150) NULL,
	[disabled] [tinyint] NOT NULL,
 CONSTRAINT [PK_base_divisors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[building_has_basedivisor]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[building_has_basedivisor](
	[base_divisor_id] [int] NOT NULL,
	[building_id] [int] NOT NULL,
	[value] [bigint] NOT NULL,
 CONSTRAINT [PK_building_has_basedivisor] PRIMARY KEY CLUSTERED 
(
	[base_divisor_id] ASC,
	[building_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[buildings]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buildings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_buildings_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](25) NOT NULL,
	[tooltip] [nchar](150) NULL,
	[disabled] [tinyint] NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categories_has_basedivisors]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories_has_basedivisors](
	[base_divisor_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_categories_has_basedivisors] PRIMARY KEY CLUSTERED 
(
	[base_divisor_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[costs]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[costs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](150) NOT NULL,
	[tooltip] [nchar](150) NULL,
	[mainrubrick_id] [int] NOT NULL,
	[subrubrick_id] [int] NOT NULL,
 CONSTRAINT [PK_costs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mainrubrics]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mainrubrics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_mainrubrics] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[municipalities]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipalities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](100) NOT NULL,
	[address] [nchar](100) NULL,
	[zip] [int] NULL,
	[phone] [nchar](15) NULL,
	[email] [nchar](50) NULL,
 CONSTRAINT [PK_municipalities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[municipality_has_users]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipality_has_users](
	[user_id] [int] NOT NULL,
	[mun_id] [int] NOT NULL,
 CONSTRAINT [PK_municipality_has_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[mun_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[newsletters]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newsletters](
	[user_id] [int] NOT NULL,
	[email] [nchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[questions]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [nchar](100) NOT NULL,
	[tooltip] [nchar](150) NULL,
	[values_type] [nchar](20) NOT NULL,
	[disabled] [tinyint] NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[statuscodes]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statuscodes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_statuscodes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[subrubrics]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subrubrics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_subrubrics] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_acceptances]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_acceptances](
	[user_id] [int] NOT NULL,
	[token] [nchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usergroups]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usergroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](25) NOT NULL,
 CONSTRAINT [PK_usergroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
	[email] [nchar](50) NOT NULL,
	[password] [nchar](50) NOT NULL,
	[reg_date] [datetime] NOT NULL,
	[accept_date] [datetime] NULL,
	[usergroup_id] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yearreport_costs]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yearreport_costs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cost_id] [int] NOT NULL,
	[value] [bigint] NULL,
	[yearreport_id] [int] NOT NULL,
 CONSTRAINT [PK_yearreport_costs] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[cost_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yearreports]    Script Date: 11/06/2014 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yearreports](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [nchar](4) NOT NULL,
	[municipality_id] [int] NOT NULL,
	[building_id] [int] NOT NULL,
	[statuscode_id] [int] NOT NULL,
 CONSTRAINT [PK_yearreports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[answers]  WITH CHECK ADD  CONSTRAINT [FK_answers_questions1] FOREIGN KEY([question_id])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[answers] CHECK CONSTRAINT [FK_answers_questions1]
GO
ALTER TABLE [dbo].[answers]  WITH CHECK ADD  CONSTRAINT [FK_answers_yearreports1] FOREIGN KEY([yearreport_id])
REFERENCES [dbo].[yearreports] ([id])
GO
ALTER TABLE [dbo].[answers] CHECK CONSTRAINT [FK_answers_yearreports1]
GO
ALTER TABLE [dbo].[building_has_basedivisor]  WITH CHECK ADD  CONSTRAINT [FK_building_has_basedivisor_base_divisors] FOREIGN KEY([base_divisor_id])
REFERENCES [dbo].[base_divisors] ([id])
GO
ALTER TABLE [dbo].[building_has_basedivisor] CHECK CONSTRAINT [FK_building_has_basedivisor_base_divisors]
GO
ALTER TABLE [dbo].[building_has_basedivisor]  WITH CHECK ADD  CONSTRAINT [FK_building_has_basedivisor_buildings] FOREIGN KEY([building_id])
REFERENCES [dbo].[buildings] ([id])
GO
ALTER TABLE [dbo].[building_has_basedivisor] CHECK CONSTRAINT [FK_building_has_basedivisor_buildings]
GO
ALTER TABLE [dbo].[buildings]  WITH CHECK ADD  CONSTRAINT [FK_buildings_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[buildings] CHECK CONSTRAINT [FK_buildings_categories]
GO
ALTER TABLE [dbo].[categories_has_basedivisors]  WITH CHECK ADD  CONSTRAINT [FK_categories_has_basedivisors_base_divisors] FOREIGN KEY([base_divisor_id])
REFERENCES [dbo].[base_divisors] ([id])
GO
ALTER TABLE [dbo].[categories_has_basedivisors] CHECK CONSTRAINT [FK_categories_has_basedivisors_base_divisors]
GO
ALTER TABLE [dbo].[categories_has_basedivisors]  WITH CHECK ADD  CONSTRAINT [FK_categories_has_basedivisors_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[categories_has_basedivisors] CHECK CONSTRAINT [FK_categories_has_basedivisors_categories]
GO
ALTER TABLE [dbo].[costs]  WITH CHECK ADD  CONSTRAINT [FK_costs_mainrubrics] FOREIGN KEY([mainrubrick_id])
REFERENCES [dbo].[mainrubrics] ([id])
GO
ALTER TABLE [dbo].[costs] CHECK CONSTRAINT [FK_costs_mainrubrics]
GO
ALTER TABLE [dbo].[costs]  WITH CHECK ADD  CONSTRAINT [FK_costs_subrubrics] FOREIGN KEY([subrubrick_id])
REFERENCES [dbo].[subrubrics] ([id])
GO
ALTER TABLE [dbo].[costs] CHECK CONSTRAINT [FK_costs_subrubrics]
GO
ALTER TABLE [dbo].[municipality_has_users]  WITH CHECK ADD  CONSTRAINT [FK_municipality_has_users_municipalities] FOREIGN KEY([mun_id])
REFERENCES [dbo].[municipalities] ([id])
GO
ALTER TABLE [dbo].[municipality_has_users] CHECK CONSTRAINT [FK_municipality_has_users_municipalities]
GO
ALTER TABLE [dbo].[municipality_has_users]  WITH CHECK ADD  CONSTRAINT [FK_municipality_has_users_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[municipality_has_users] CHECK CONSTRAINT [FK_municipality_has_users_users]
GO
ALTER TABLE [dbo].[questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[questions] CHECK CONSTRAINT [FK_questions_categories]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_usergroups] FOREIGN KEY([usergroup_id])
REFERENCES [dbo].[usergroups] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_usergroups]
GO
ALTER TABLE [dbo].[yearreport_costs]  WITH CHECK ADD  CONSTRAINT [FK_yearreport_costs_costs] FOREIGN KEY([cost_id])
REFERENCES [dbo].[costs] ([id])
GO
ALTER TABLE [dbo].[yearreport_costs] CHECK CONSTRAINT [FK_yearreport_costs_costs]
GO
ALTER TABLE [dbo].[yearreport_costs]  WITH CHECK ADD  CONSTRAINT [FK_yearreport_costs_yearreports] FOREIGN KEY([yearreport_id])
REFERENCES [dbo].[yearreports] ([id])
GO
ALTER TABLE [dbo].[yearreport_costs] CHECK CONSTRAINT [FK_yearreport_costs_yearreports]
GO
ALTER TABLE [dbo].[yearreports]  WITH CHECK ADD  CONSTRAINT [FK_yearreports_municipalities] FOREIGN KEY([municipality_id])
REFERENCES [dbo].[municipalities] ([id])
GO
ALTER TABLE [dbo].[yearreports] CHECK CONSTRAINT [FK_yearreports_municipalities]
GO
ALTER TABLE [dbo].[yearreports]  WITH CHECK ADD  CONSTRAINT [FK_yearreports_statuscodes] FOREIGN KEY([statuscode_id])
REFERENCES [dbo].[statuscodes] ([id])
GO
ALTER TABLE [dbo].[yearreports] CHECK CONSTRAINT [FK_yearreports_statuscodes]
GO
USE [master]
GO
ALTER DATABASE [Fakl_benchmarking] SET  READ_WRITE 
GO

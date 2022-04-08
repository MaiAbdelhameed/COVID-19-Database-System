USE [master]
GO
/****** Object:  Database [Project1]    Script Date: 1/10/2022 12:53:41 AM ******/
CREATE DATABASE [Project1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project1] SET RECOVERY FULL 
GO
ALTER DATABASE [Project1] SET  MULTI_USER 
GO
ALTER DATABASE [Project1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project1', N'ON'
GO
ALTER DATABASE [Project1] SET QUERY_STORE = OFF
GO
USE [Project1]
GO
/****** Object:  Table [dbo].[Citizens]    Script Date: 1/10/2022 12:53:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citizens](
	[National_ID] [char](14) NOT NULL,
	[FName] [varchar](10) NOT NULL,
	[LName] [varchar](10) NOT NULL,
	[Age] [int] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Insurance_ID] [char](10) NULL,
	[Vaccinated] [bit] NOT NULL,
	[No#ofPast_Infections] [int] NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Citizens] PRIMARY KEY CLUSTERED 
(
	[National_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 1/10/2022 12:53:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[Hospital_ID] [char](10) NOT NULL,
	[H_Name] [varchar](20) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Availabilty] [bit] NOT NULL,
	[Passcode] [varchar](14) NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[Hospital_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance_Company]    Script Date: 1/10/2022 12:53:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance_Company](
	[Company_ID] [char](5) NOT NULL,
	[C_Name] [varchar](20) NOT NULL,
	[Discount] [float] NOT NULL,
	[Limitation] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Insurance Company] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medical_Staff]    Script Date: 1/10/2022 12:53:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medical_Staff](
	[National_ID] [char](14) NULL,
	[FName] [varchar](20) NULL,
	[LName] [varchar](20) NULL,
	[Field] [varchar](20) NULL,
	[Graduated_From] [varchar](20) NULL,
	[Certificate] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offered_By]    Script Date: 1/10/2022 12:53:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offered_By](
	[Service_ID] [char](5) NOT NULL,
	[Hospital_ID] [char](10) NOT NULL,
 CONSTRAINT [PK_Offered_By] PRIMARY KEY CLUSTERED 
(
	[Hospital_ID] ASC,
	[Service_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 1/10/2022 12:53:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Nat_ID] [char](14) NOT NULL,
	[Health_Condition] [char](10) NULL,
	[Current_Status] [char](10) NULL,
	[Critical] [bit] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Nat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 1/10/2022 12:53:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Nat_ID] [char](14) NOT NULL,
	[Ser_ID] [char](5) NOT NULL,
	[Hospital_ID] [char](10) NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Nat_ID] ASC,
	[Ser_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 1/10/2022 12:53:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Service_ID] [char](5) NOT NULL,
	[S_Name] [varchar](20) NOT NULL,
	[S_Type] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Service_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaccine]    Script Date: 1/10/2022 12:53:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccine](
	[Vaccine_ID] [char](3) NULL,
	[V_Name] [varchar](20) NULL,
	[Supplier] [varchar](20) NULL,
	[Amount] [int] NULL,
	[Doses] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Work_In]    Script Date: 1/10/2022 12:53:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work_In](
	[National_ID] [char](14) NOT NULL,
	[Hospital_ID] [char](10) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Offered_By]  WITH CHECK ADD  CONSTRAINT [FK_Offered_By_Hospital] FOREIGN KEY([Hospital_ID])
REFERENCES [dbo].[Hospital] ([Hospital_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Offered_By] CHECK CONSTRAINT [FK_Offered_By_Hospital]
GO
ALTER TABLE [dbo].[Offered_By]  WITH CHECK ADD  CONSTRAINT [FK_Offered_By_Service] FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Service] ([Service_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Offered_By] CHECK CONSTRAINT [FK_Offered_By_Service]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Citizens] FOREIGN KEY([Nat_ID])
REFERENCES [dbo].[Citizens] ([National_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Citizens]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Citizens] FOREIGN KEY([Nat_ID])
REFERENCES [dbo].[Citizens] ([National_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Citizens]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Hospital] FOREIGN KEY([Hospital_ID])
REFERENCES [dbo].[Hospital] ([Hospital_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Hospital]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Service] FOREIGN KEY([Ser_ID])
REFERENCES [dbo].[Service] ([Service_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Service]
GO
USE [master]
GO
ALTER DATABASE [Project1] SET  READ_WRITE 
GO

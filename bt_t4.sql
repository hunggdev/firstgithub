USE [master]
GO
/****** Object:  Database [de_test_1]    Script Date: 4/10/2024 4:15:18 PM ******/
CREATE DATABASE [de_test_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'de_test_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\de_test_1.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'de_test_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\de_test_1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [de_test_1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [de_test_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [de_test_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [de_test_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [de_test_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [de_test_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [de_test_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [de_test_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [de_test_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [de_test_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [de_test_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [de_test_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [de_test_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [de_test_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [de_test_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [de_test_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [de_test_1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [de_test_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [de_test_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [de_test_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [de_test_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [de_test_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [de_test_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [de_test_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [de_test_1] SET RECOVERY FULL 
GO
ALTER DATABASE [de_test_1] SET  MULTI_USER 
GO
ALTER DATABASE [de_test_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [de_test_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [de_test_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [de_test_1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [de_test_1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'de_test_1', N'ON'
GO
USE [de_test_1]
GO
/****** Object:  Table [dbo].[CAUHOI]    Script Date: 4/10/2024 4:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAUHOI](
	[MaCauHoi] [nchar](10) NOT NULL,
	[MaKhoi] [nchar](10) NOT NULL,
	[NoiDung] [nchar](10) NOT NULL,
	[DapAnA] [nchar](10) NOT NULL,
	[DapAnB] [nchar](10) NOT NULL,
	[DapAnC] [nchar](10) NOT NULL,
	[DapAnD] [nchar](10) NOT NULL,
	[DapAnDung] [nchar](10) NOT NULL,
 CONSTRAINT [PK_CAUHOI] PRIMARY KEY CLUSTERED 
(
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DETHI]    Script Date: 4/10/2024 4:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETHI](
	[MaDeThi] [nchar](10) NOT NULL,
	[TenDeThi] [nchar](10) NOT NULL,
	[ThoiGianThi] [date] NOT NULL,
	[SoCauHoi] [int] NOT NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DETHI] PRIMARY KEY CLUSTERED 
(
	[MaDeThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DETHI_CAUHOI]    Script Date: 4/10/2024 4:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETHI_CAUHOI](
	[MaHocSinh] [nchar](10) NOT NULL,
	[MaDeThi] [nchar](10) NOT NULL,
	[MaCauHoi] [nchar](10) NOT NULL,
	[DapAn] [nchar](10) NOT NULL,
 CONSTRAINT [PK_DETHI_CAUHOI] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaDeThi] ASC,
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOCSINH]    Script Date: 4/10/2024 4:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCSINH](
	[MaHocSinh] [nchar](10) NOT NULL,
	[TenHocSinh] [nvarchar](50) NOT NULL,
	[NamSinh] [int] NOT NULL,
	[GioiTinh] [nchar](10) NOT NULL,
	[TenLop] [nchar](10) NOT NULL,
 CONSTRAINT [PK_HOCSINH] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KETQUA]    Script Date: 4/10/2024 4:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KETQUA](
	[MaDeThi] [nchar](10) NOT NULL,
	[MaCauHoi] [nchar](10) NOT NULL,
 CONSTRAINT [PK_KETQUA] PRIMARY KEY CLUSTERED 
(
	[MaDeThi] ASC,
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHOI]    Script Date: 4/10/2024 4:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOI](
	[MaKhoi] [nchar](10) NOT NULL,
	[TenKhoi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KHOI] PRIMARY KEY CLUSTERED 
(
	[MaKhoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CAUHOI] ([MaCauHoi], [MaKhoi], [NoiDung], [DapAnA], [DapAnB], [DapAnC], [DapAnD], [DapAnDung]) VALUES (N'CH001     ', N'K2        ', N'ABC       ', N'DA A      ', N'DA B      ', N'DA C      ', N'DA D      ', N'A         ')
INSERT [dbo].[CAUHOI] ([MaCauHoi], [MaKhoi], [NoiDung], [DapAnA], [DapAnB], [DapAnC], [DapAnD], [DapAnDung]) VALUES (N'CH002     ', N'K2        ', N'ABC       ', N'DA A      ', N'DA B      ', N'DA C      ', N'DA D      ', N'B         ')
INSERT [dbo].[CAUHOI] ([MaCauHoi], [MaKhoi], [NoiDung], [DapAnA], [DapAnB], [DapAnC], [DapAnD], [DapAnDung]) VALUES (N'CH003     ', N'K1        ', N'ABC       ', N'DA A      ', N'DA B      ', N'DA C      ', N'DA D      ', N'C         ')
INSERT [dbo].[CAUHOI] ([MaCauHoi], [MaKhoi], [NoiDung], [DapAnA], [DapAnB], [DapAnC], [DapAnD], [DapAnDung]) VALUES (N'CH004     ', N'K3        ', N'ABC       ', N'DA A      ', N'DA B      ', N'DA C      ', N'DA D      ', N'C         ')
INSERT [dbo].[DETHI] ([MaDeThi], [TenDeThi], [ThoiGianThi], [SoCauHoi], [TrangThai]) VALUES (N'DTA001    ', N'De thi 1  ', CAST(N'2017-11-20' AS Date), 30, N'Da phat hanh')
INSERT [dbo].[DETHI] ([MaDeThi], [TenDeThi], [ThoiGianThi], [SoCauHoi], [TrangThai]) VALUES (N'DTA002    ', N'De thi 2  ', CAST(N'2017-12-21' AS Date), 20, N'Chua phat hanh')
INSERT [dbo].[DETHI] ([MaDeThi], [TenDeThi], [ThoiGianThi], [SoCauHoi], [TrangThai]) VALUES (N'DTB001    ', N'De thi 3  ', CAST(N'2017-12-22' AS Date), 30, N'Da phat hanh')
INSERT [dbo].[DETHI] ([MaDeThi], [TenDeThi], [ThoiGianThi], [SoCauHoi], [TrangThai]) VALUES (N'DTB002    ', N'De thi 4  ', CAST(N'2016-09-10' AS Date), 20, N'Da phat hanh')
INSERT [dbo].[DETHI] ([MaDeThi], [TenDeThi], [ThoiGianThi], [SoCauHoi], [TrangThai]) VALUES (N'DTC001    ', N'De thi 5  ', CAST(N'2010-05-01' AS Date), 25, N'Da phat hanh')
INSERT [dbo].[DETHI] ([MaDeThi], [TenDeThi], [ThoiGianThi], [SoCauHoi], [TrangThai]) VALUES (N'DTD001    ', N'De thi 7  ', CAST(N'2017-12-21' AS Date), 3, N'Da phat hanh')
INSERT [dbo].[DETHI_CAUHOI] ([MaHocSinh], [MaDeThi], [MaCauHoi], [DapAn]) VALUES (N'HS00001   ', N'DTA001    ', N'CH0001    ', N'A         ')
INSERT [dbo].[DETHI_CAUHOI] ([MaHocSinh], [MaDeThi], [MaCauHoi], [DapAn]) VALUES (N'HS00001   ', N'DTA001    ', N'CH0002    ', N'B         ')
INSERT [dbo].[DETHI_CAUHOI] ([MaHocSinh], [MaDeThi], [MaCauHoi], [DapAn]) VALUES (N'HS00001   ', N'DTA002    ', N'CH0003    ', N'C         ')
INSERT [dbo].[DETHI_CAUHOI] ([MaHocSinh], [MaDeThi], [MaCauHoi], [DapAn]) VALUES (N'HS00002   ', N'DTA001    ', N'CH0001    ', N'D         ')
INSERT [dbo].[DETHI_CAUHOI] ([MaHocSinh], [MaDeThi], [MaCauHoi], [DapAn]) VALUES (N'HS00002   ', N'DTA001    ', N'CH0002    ', N'C         ')
INSERT [dbo].[DETHI_CAUHOI] ([MaHocSinh], [MaDeThi], [MaCauHoi], [DapAn]) VALUES (N'HS00002   ', N'DTA002    ', N'CH0003    ', N'B         ')
INSERT [dbo].[DETHI_CAUHOI] ([MaHocSinh], [MaDeThi], [MaCauHoi], [DapAn]) VALUES (N'HS00003   ', N'DTB001    ', N'CH0004    ', N'A         ')
INSERT [dbo].[DETHI_CAUHOI] ([MaHocSinh], [MaDeThi], [MaCauHoi], [DapAn]) VALUES (N'HS00004   ', N'DTC001    ', N'CH0002    ', N'B         ')
INSERT [dbo].[DETHI_CAUHOI] ([MaHocSinh], [MaDeThi], [MaCauHoi], [DapAn]) VALUES (N'HS00004   ', N'DTD001    ', N'CH0001    ', N'A         ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [NamSinh], [GioiTinh], [TenLop]) VALUES (N'HS0001    ', N'Hoc Sinh A', 2013, N'Nam       ', N'1/1       ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [NamSinh], [GioiTinh], [TenLop]) VALUES (N'HS0002    ', N'Hoc Sinh B', 2012, N'Nu        ', N'2/2       ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [NamSinh], [GioiTinh], [TenLop]) VALUES (N'HS0003    ', N'Hoc Sinh A', 2012, N'Nu        ', N'1/4       ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [NamSinh], [GioiTinh], [TenLop]) VALUES (N'HS0004    ', N'Hoc Sinh C', 2010, N'Nam       ', N'5/3       ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [NamSinh], [GioiTinh], [TenLop]) VALUES (N'HS0005    ', N'Hoc Sinh B', 2013, N'Nu        ', N'3/2       ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [NamSinh], [GioiTinh], [TenLop]) VALUES (N'HS0006    ', N'Hoc Sinh D', 2010, N'Nu        ', N'1/4       ')
INSERT [dbo].[KETQUA] ([MaDeThi], [MaCauHoi]) VALUES (N'DTA001    ', N'CH0001    ')
INSERT [dbo].[KETQUA] ([MaDeThi], [MaCauHoi]) VALUES (N'DTA001    ', N'CH0002    ')
INSERT [dbo].[KETQUA] ([MaDeThi], [MaCauHoi]) VALUES (N'DTA002    ', N'CH0004    ')
INSERT [dbo].[KETQUA] ([MaDeThi], [MaCauHoi]) VALUES (N'DTB002    ', N'CH0004    ')
INSERT [dbo].[KETQUA] ([MaDeThi], [MaCauHoi]) VALUES (N'DTD001    ', N'CH0001    ')
INSERT [dbo].[KETQUA] ([MaDeThi], [MaCauHoi]) VALUES (N'DTD001    ', N'CH0002    ')
INSERT [dbo].[KHOI] ([MaKhoi], [TenKhoi]) VALUES (N'K1        ', N'Khoi lop 1')
INSERT [dbo].[KHOI] ([MaKhoi], [TenKhoi]) VALUES (N'K2        ', N'Khoi lop 2')
INSERT [dbo].[KHOI] ([MaKhoi], [TenKhoi]) VALUES (N'K3        ', N'Khoi lop 3')
INSERT [dbo].[KHOI] ([MaKhoi], [TenKhoi]) VALUES (N'K4        ', N'Khoi lop 4')
INSERT [dbo].[KHOI] ([MaKhoi], [TenKhoi]) VALUES (N'K5        ', N'Khoi lop 5')
ALTER TABLE [dbo].[CAUHOI]  WITH CHECK ADD  CONSTRAINT [FK_CAUHOI_KHOI1] FOREIGN KEY([MaKhoi])
REFERENCES [dbo].[KHOI] ([MaKhoi])
GO
ALTER TABLE [dbo].[CAUHOI] CHECK CONSTRAINT [FK_CAUHOI_KHOI1]
GO
USE [master]
GO
ALTER DATABASE [de_test_1] SET  READ_WRITE 
GO

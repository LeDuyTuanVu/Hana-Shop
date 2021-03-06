USE [master]
GO
/****** Object:  Database [Assignment1_LeDuyTuanVu]    Script Date: 1/20/2021 5:14:11 PM ******/
CREATE DATABASE [Assignment1_LeDuyTuanVu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment1_LeDuyTuanVu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Assignment1_LeDuyTuanVu.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Assignment1_LeDuyTuanVu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Assignment1_LeDuyTuanVu_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1_LeDuyTuanVu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Assignment1_LeDuyTuanVu]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 1/20/2021 5:14:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [varchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 1/20/2021 5:14:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[productID] [varchar](10) NOT NULL,
	[orderID] [varchar](10) NOT NULL,
	[quantity] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 1/20/2021 5:14:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [varchar](10) NOT NULL,
	[fullName] [nvarchar](30) NULL,
	[total] [float] NULL,
	[date] [date] NULL,
	[phone] [varchar](10) NULL,
	[email] [varchar](30) NULL,
	[address] [nvarchar](100) NULL,
	[userID] [varchar](10) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 1/20/2021 5:14:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [varchar](10) NOT NULL,
	[productName] [nvarchar](100) NULL,
	[image] [varchar](500) NULL,
	[description] [nvarchar](500) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[createDate] [date] NULL,
	[expiryDate] [date] NULL,
	[categoryID] [varchar](10) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRecords]    Script Date: 1/20/2021 5:14:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRecords](
	[recordID] [varchar](10) NOT NULL,
	[date] [smalldatetime] NULL,
	[note] [nvarchar](500) NULL,
	[productID] [varchar](10) NULL,
	[userID] [varchar](10) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[recordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 1/20/2021 5:14:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](2) NOT NULL,
	[roleName] [varchar](5) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 1/20/2021 5:14:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](10) NOT NULL,
	[password] [varchar](20) NULL,
	[fullName] [nvarchar](30) NULL,
	[phone] [varchar](10) NULL,
	[email] [varchar](30) NULL,
	[address] [nvarchar](100) NULL,
	[roleID] [varchar](2) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategories] ([categoryID], [categoryName], [status]) VALUES (N'category1', N'Carbonated Drinks', 1)
INSERT [dbo].[tblCategories] ([categoryID], [categoryName], [status]) VALUES (N'category2', N'Snack and Candy', 1)
INSERT [dbo].[tblCategories] ([categoryID], [categoryName], [status]) VALUES (N'category3', N'Fast Food', 1)
INSERT [dbo].[tblCategories] ([categoryID], [categoryName], [status]) VALUES (N'category4', N'Starch Food', 1)
INSERT [dbo].[tblCategories] ([categoryID], [categoryName], [status]) VALUES (N'category5', N'Pure Water', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product1', N'Fuze Tea', N'https://cdn.tgdd.vn/Products/Images/2443/84392/bhx/6-chai-nuoc-ngot-mirinda-huong-sa-xi-390ml-201909101238006598_300x300.jpg', N'Made in VietName', 5, 8, CAST(N'2021-01-19' AS Date), CAST(N'2021-02-05' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product10', N'C2 Apple', N'https://cdn.tgdd.vn/Products/Images/8938/231593/bhx/loc-6-chai-tra-xanh-c2-huong-tao-230ml-202011280842112463_300x300.jpg', N'Made in VietName', 5, 40, CAST(N'2021-01-19' AS Date), CAST(N'2021-02-28' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product100', N'Aquarius', N'https://cdn.tgdd.vn/Products/Images/8965/201287/bhx/24-chai-nuoc-uong-van-dong-aquarius-390ml-202005081300397894_300x300.jpg', N'Made in VietName', 7, 31, CAST(N'2020-01-01' AS Date), CAST(N'2022-01-13' AS Date), N'category5', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product101', N'Socola Monte', N'https://cdn.tgdd.vn/Products/Images/7558/207819/bhx/vang-sua-socola-monte-hop-55g-201907232050331784_300x300.jpg', N'Made in VietName', 9, 32, CAST(N'2020-07-03' AS Date), CAST(N'2021-02-28' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product102', N'Mananit', N'https://cdn.tgdd.vn/Products/Images/7599/201195/bhx/pho-mai-con-bo-cuoi-goi-60g-4-mieng-202012081652023930_300x300.jpg', N'Made in VietName', 11, 33, CAST(N'2020-12-24' AS Date), CAST(N'2021-05-12' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product11', N'Samurai', N'https://cdn.tgdd.vn/Products/Images/3226/200524/bhx/thung-24-chai-nuoc-tang-luc-samurai-vi-dau-390ml-201907261044052884_300x300.jpg', N'Made in VietName', 10, 50, CAST(N'2020-12-24' AS Date), CAST(N'2022-01-13' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product12', N'Vfresh Beauty', N'https://cdn.tgdd.vn/Products/Images/8938/215593/bhx/6-chai-tra-nha-dam-it-duong-vfresh-beauty-plus-350ml-201911281610451437_300x300.jpg', N'Made in VietName', 15, 55, CAST(N'2020-11-27' AS Date), CAST(N'2021-12-01' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product13', N'Pepsi', N'https://cdn.tgdd.vn/Products/Images/2443/88121/bhx/thung-24-lon-nuoc-ngot-pepsi-cola-330ml-202004091034350927_300x300.jpg', N'Made in VietName', 20, 60, CAST(N'2020-10-23' AS Date), CAST(N'2021-05-12' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product14', N'Compact', N'https://cdn.tgdd.vn/Products/Images/3226/209445/bhx/thung-24-chai-nuoc-tang-luc-compact-vi-cherry-330ml-201908151039370048_300x300.jpg', N'Made in VietName', 25, 64, CAST(N'2021-01-19' AS Date), CAST(N'2021-10-28' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product15', N'Lipovitan', N'https://cdn.tgdd.vn/Products/Images/3226/232335/bhx/6-lon-nuoc-tang-luc-lipovitan-mat-ong-250ml-202012141007281991_300x300.jpg', N'Made in VietName', 30, 70, CAST(N'2021-01-02' AS Date), CAST(N'2021-09-30' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product16', N'Muaythai', N'https://cdn.tgdd.vn/Products/Images/3226/231918/bhx/nuoc-tang-luc-muaythai-250ml-202012141044199930_300x300.jpg', N'Made in VietName', 35, 75, CAST(N'2020-07-03' AS Date), CAST(N'2021-12-01' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product17', N'Wake Up 247', N'https://cdn.tgdd.vn/Products/Images/3226/195239/bhx/6-chai-nuoc-tang-luc-wake-up-247-vi-ca-phe-330ml-201909251514562876_300x300.jpg', N'Made in VietName', 7, 80, CAST(N'2020-10-23' AS Date), CAST(N'2022-01-13' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product18', N'Sting Strawbery', N'https://cdn.tgdd.vn/Products/Images/3226/83897/bhx/thung-24-lon-nuoc-tang-luc-sting-huong-dau-330ml-202001030956455664_300x300.jpg', N'Made in VietName', 9, 0, CAST(N'2021-01-19' AS Date), CAST(N'2021-12-01' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product19', N'Monster Enrgy', N'https://cdn.tgdd.vn/Products/Images/3226/194423/bhx/thung-24-lon-nuoc-tang-luc-monster-energy-355ml-202005011225593657_300x300.jpg', N'Made in VietName', 11, 2, CAST(N'2020-12-24' AS Date), CAST(N'2021-05-12' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product2', N'Mirinda Orange', N'https://cdn.tgdd.vn/Products/Images/2443/84394/bhx/6-chai-nuoc-ngot-mirinda-vi-cam-390ml-201909101402112150_300x300.jpg', N'Made in VietName', 10, 5, CAST(N'2020-12-24' AS Date), CAST(N'2021-10-28' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product20', N'Mugicha', N'https://cdn.tgdd.vn/Products/Images/8938/209478/bhx/thung-24-chai-nuoc-uong-tra-lua-mach-itoen-mugicha-500ml-202002261008305694_300x300.JPG', N'Made in VietName', 13, 3, CAST(N'2020-11-27' AS Date), CAST(N'2021-10-28' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product21', N'Redbull', N'https://cdn.tgdd.vn/Products/Images/3226/182388/bhx/thung-50-chai-nuoc-tang-luc-redbull-150ml-202005061430215339_300x300.jpg', N'Made in VietName', 15, 4, CAST(N'2020-01-01' AS Date), CAST(N'2021-09-30' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product22', N'Met Mun', N'https://cdn.tgdd.vn/Products/Images/3364/230985/bhx/snack-bap-greens-a-vi-bo-toi-goi-36g-202011191525174306_300x300.jpg', N'Made in VietName', 17, 5, CAST(N'2021-01-19' AS Date), CAST(N'2022-01-13' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product23', N'Sun Deu', N'https://cdn.tgdd.vn/Products/Images/3364/226335/bhx/snack-khoai-tay-vi-ca-ri-dac-biet-karamucho-goi-44g-202008041613016735_300x300.jpg', N'Made in VietName', 19, 6, CAST(N'2020-12-24' AS Date), CAST(N'2021-12-01' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product24', N'Potago', N'https://cdn.tgdd.vn/Products/Images/3364/230579/bhx/snack-khoai-tay-greens-a-vi-rong-bien-cay-goi-44g-202011191521465404_300x300.jpg', N'Made in VietName', 21, 7, CAST(N'2020-10-23' AS Date), CAST(N'2021-05-12' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product25', N'Melio', N'https://cdn.tgdd.vn/Products/Images/3364/222001/bhx/snack-khoai-tay-vi-cay-dac-biet-lat-day-karamucho-goi-44g-202005141502204170_300x300.jpg', N'Made in VietName', 23, 8, CAST(N'2020-07-03' AS Date), CAST(N'2021-02-28' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product26', N'Go Han', N'https://cdn.tgdd.vn/Products/Images/8298/194875/bhx/rong-bien-an-lien-green-world-vi-truyen-thong-3-goi-2g-202001141915264026_300x300.jpg', N'Made in VietName', 25, 9, CAST(N'2020-11-27' AS Date), CAST(N'2022-01-13' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product27', N'Min Sung', N'https://cdn.tgdd.vn/Products/Images/3364/231522/bhx/snack-khoai-tay-vi-ca-chua-peke-potato-chips-lon-80g-202012240848364569_300x300.jpg', N'Made in VietName', 27, 10, CAST(N'2021-01-19' AS Date), CAST(N'2021-09-30' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product28', N'Chiu Go', N'https://cdn.tgdd.vn/Products/Images/3364/212677/bhx/snack-khoai-tay-vi-truyen-thong-peke-potato-chips-lon-80g-201910111354462566_300x300.jpg', N'Made in VietName', 29, 11, CAST(N'2020-12-24' AS Date), CAST(N'2021-05-12' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product29', N'Sim Sam', N'https://cdn.tgdd.vn/Products/Images/3364/212676/bhx/snack-khoai-tay-vi-rong-bien-peke-potato-chips-lon-80g-201910111400189417_300x300.jpg', N'Made in VietName', 31, 12, CAST(N'2020-01-01' AS Date), CAST(N'2021-10-28' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product3', N'7Up Lemon', N'https://cdn.tgdd.vn/Products/Images/2443/91401/bhx/6-chai-nuoc-ngot-7-up-vi-chanh-390ml-201909101234166789_300x300.jpg', N'Made in VietName', 15, 10, CAST(N'2020-07-03' AS Date), CAST(N'2022-01-13' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product30', N'Rumbong', N'https://cdn.tgdd.vn/Products/Images/8298/212862/bhx/loc-3-goi-rong-bien-an-lien-vi-tra-xanh-ock-dong-ja-45g-202002031614210742_300x300.jpg', N'Made in VietName', 1, 13, CAST(N'2020-07-03' AS Date), CAST(N'2021-12-01' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product31', N'Taimun', N'https://cdn.tgdd.vn/Products/Images/3364/119727/bhx/snack-tom-thai-jojo-goi-35g-201907151051068385_300x300.jpg', N'Made in VietName', 2, 14, CAST(N'2021-01-02' AS Date), CAST(N'2021-02-28' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product32', N'Snack Tai', N'https://cdn.tgdd.vn/Products/Images/3364/232587/bhx/snack-banh-mi-vi-pizza-samlip-goi-120g-202012191613570128_300x300.jpg', N'Made in VietName', 4, 15, CAST(N'2021-01-19' AS Date), CAST(N'2021-12-01' AS Date), N'category2', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product33', N'Ottogi', N'https://cdn.tgdd.vn/Products/Images/2565/226530/bhx/loc-8-goi-mi-kim-chi-ottogi-120g-202011121048209863_300x300.jpg', N'Made in VietName', 6, 16, CAST(N'2020-12-24' AS Date), CAST(N'2021-05-12' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product34', N'Nongsim', N'https://cdn.tgdd.vn/Products/Images/2565/87669/bhx/mi-nongshim-ramyun-vi-kim-chi-goi-120g-202002201033508816_300x300.jpg', N'Made in VietName', 8, 17, CAST(N'2020-10-23' AS Date), CAST(N'2021-10-28' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product35', N'Shin Cup', N'https://cdn.tgdd.vn/Products/Images/2565/82659/bhx/mi-nongshim-shincup-vi-cay-ly-68g-202002202249361058_300x300.jpg', N'Made in VietName', 10, 18, CAST(N'2021-01-02' AS Date), CAST(N'2021-09-30' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product36', N'Kimchi Ramyun', N'https://cdn.tgdd.vn/Products/Images/2565/87668/bhx/mi-nongshim-ramyun-vi-kim-chi-ly-75g-202002202249207468_300x300.jpg', N'Made in VietName', 12, 19, CAST(N'2020-07-03' AS Date), CAST(N'2021-12-01' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product37', N'3 Mien', N'https://cdn.tgdd.vn/Products/Images/2565/77669/bhx/mi-3-mien-tom-chua-cay-goi-65g-202003101140431172_300x300.jpg', N'Made in VietName', 14, 20, CAST(N'2021-01-02' AS Date), CAST(N'2022-01-13' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product38', N'Omachi Potamo', N'https://cdn.tgdd.vn/Products/Images/2565/158940/bhx/mi-khoai-tay-omachi-special-bo-ham-xot-vang-goi-92g-co-goi-thit-that-202003101103549933_300x300.jpg', N'Made in VietName', 16, 21, CAST(N'2021-01-19' AS Date), CAST(N'2021-02-28' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product39', N'Samyang', N'https://cdn.tgdd.vn/Products/Images/2565/175936/bhx/thung-40-goi-mi-xao-kho-samyang-vi-ga-cay-pho-mai-140g-202002181422530332_300x300.jpg', N'Made in VietName', 18, 22, CAST(N'2020-12-24' AS Date), CAST(N'2021-05-12' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product4', N'Tea Plus', N'https://cdn.tgdd.vn/Products/Images/8938/193431/bhx/6-chai-tra-o-long-tea-plus-350ml-201908140849155618_300x300.JPG', N'Made in VietName', 20, 15, CAST(N'2021-01-19' AS Date), CAST(N'2022-01-13' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product40', N'Hot Samyang', N'https://cdn.tgdd.vn/Products/Images/2565/174714/bhx/thung-40-goi-mi-xao-kho-samyang-vi-ga-cay-140g-202002181423391092_300x300.jpg', N'Made in VietName', 20, 23, CAST(N'2020-11-27' AS Date), CAST(N'2021-10-28' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product41', N'Koreno', N'https://cdn.tgdd.vn/Products/Images/2565/194025/bhx/thung-10-tui-mi-koreno-jumbo-vi-kim-chi-1kg-202002210750388080_300x300.jpg', N'Made in VietName', 22, 24, CAST(N'2020-07-03' AS Date), CAST(N'2021-12-01' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product42', N'Mama', N'https://cdn.tgdd.vn/Products/Images/2565/231344/bhx/thung-36-ly-mi-mama-vit-tiem-60g-202011271004187396_300x300.jpg', N'Made in VietName', 24, 25, CAST(N'2020-10-23' AS Date), CAST(N'2021-12-01' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product43', N'Koca', N'https://cdn.tgdd.vn/Products/Images/2565/206284/bhx/thung-30-goi-mi-xao-kho-koka-vi-dac-biet-60g-202002191310198457_300x300.jpg', N'Made in VietName', 26, 26, CAST(N'2021-01-19' AS Date), CAST(N'2022-01-13' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product44', N'Jongga', N'https://cdn.tgdd.vn/Products/Images/2565/206613/bhx/thung-24-goi-mi-jongga-ramen-vi-kim-chi-122g-202002212102486983_300x300.jpg', N'Made in VietName', 28, 27, CAST(N'2020-12-24' AS Date), CAST(N'2021-09-30' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product45', N'New Way', N'https://cdn.tgdd.vn/Products/Images/2565/194028/bhx/thung-12-goi-mi-khong-chien-new-way-720g-202002211438406392_300x300.jpg', N'Made in VietName', 30, 28, CAST(N'2020-11-27' AS Date), CAST(N'2021-12-01' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product46', N'Paldo', N'https://cdn.tgdd.vn/Products/Images/2565/194016/bhx/thung-16-goi-mi-tron-paldo-jjajangmen-vi-tuong-den-200g-202002211528226628_300x300.jpg', N'Made in VietName', 32, 29, CAST(N'2020-07-03' AS Date), CAST(N'2021-05-12' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product47', N'Koreno', N'https://cdn.tgdd.vn/Products/Images/2565/175912/bhx/thung-24-goi-mi-koreno-vi-bo-cay-100g-202002212104123379_300x300.jpg', N'Made in VietName', 34, 30, CAST(N'2020-10-23' AS Date), CAST(N'2021-10-28' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product48', N'Miket', N'https://cdn.tgdd.vn/Products/Images/2565/86045/bhx/thung-100-goi-mi-miliket-hai-tom-giay-trang-vi-tom-75g-202002211437342590_300x300.jpg', N'Made in VietName', 36, 31, CAST(N'2020-01-01' AS Date), CAST(N'2021-02-28' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product49', N'Nisin', N'https://cdn.tgdd.vn/Products/Images/2565/86920/bhx/thung-24-ly-mi-nissin-vi-thai-tomyum-70g-202002201515079488_300x300.jpg', N'Made in VietName', 38, 32, CAST(N'2020-12-24' AS Date), CAST(N'2021-12-01' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product5', N'Coca Cola', N'https://cdn.tgdd.vn/Products/Images/2443/88651/bhx/6-chai-nuoc-ngot-coca-cola-390ml-202012101545439553_300x300.jpg', N'Made in VietName', 25, 20, CAST(N'2020-12-24' AS Date), CAST(N'2021-02-28' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product50', N'Vifon', N'https://cdn.tgdd.vn/Products/Images/2565/86973/bhx/thung-18-goi-mi-vifon-hoang-gia-vi-thit-bo-120g-202002211539485529_300x300.jpg', N'Made in VietName', 40, 33, CAST(N'2021-01-19' AS Date), CAST(N'2022-01-13' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product51', N'Hoang Gia', N'https://cdn.tgdd.vn/Products/Images/2566/87052/bhx/thung-18-goi-pho-ga-vifon-hoang-gia-120g-202002231230028663_300x300.jpg', N'Made in VietName', 1, 34, CAST(N'2020-11-27' AS Date), CAST(N'2021-09-30' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product52', N'Chinh Su', N'https://cdn.tgdd.vn/Products/Images/2566/215696/bhx/thung-12-hop-pho-bo-chinsu-co-thit-bo-nguyen-mieng-132g-202002230837516805_300x300.jpg', N'Made in VietName', 3, 35, CAST(N'2020-07-03' AS Date), CAST(N'2021-05-12' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product53', N'Nam Vang', N'https://cdn.tgdd.vn/Products/Images/2965/86935/bhx/thung-18-goi-hu-tieu-nam-vang-an-lien-vifon-hoang-gia-goi-120g-202002270932508485_300x300.jpg', N'Made in VietName', 5, 36, CAST(N'2020-01-01' AS Date), CAST(N'2021-10-28' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product54', N'Gau Do', N'https://cdn.tgdd.vn/Products/Images/2965/175883/bhx/thung-30-goi-hu-tieu-nam-vang-gau-do-65g-202002280723441154_300x300.jpg', N'Made in VietName', 7, 37, CAST(N'2020-10-23' AS Date), CAST(N'2021-02-28' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product55', N'Bun Mam', N'https://cdn.tgdd.vn/Products/Images/2963/194801/bhx/thung-30-goi-bun-mam-bich-chi-goi-60g-202002231423069799_300x300.jpg', N'Made in VietName', 9, 38, CAST(N'2021-01-19' AS Date), CAST(N'2021-12-01' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product56', N'Bun Bo Hue', N'https://cdn.tgdd.vn/Products/Images/2963/174711/bhx/thung-30-goi-bun-bo-hue-hang-nga-73g-202002231426074634_300x300.jpg', N'Made in VietName', 11, 39, CAST(N'2020-12-24' AS Date), CAST(N'2021-12-01' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product57', N'Bun Tom', N'https://cdn.tgdd.vn/Products/Images/2963/175908/bhx/thung-30-goi-bun-tom-vifon-65g-202002231425531259_300x300.jpg', N'Made in VietName', 13, 40, CAST(N'2020-11-27' AS Date), CAST(N'2021-05-12' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product58', N'Bun Gao', N'https://cdn.tgdd.vn/Products/Images/2963/194010/bhx/thung-30-goi-bun-gao-kho-an-lien-bihun-goreng-mama-55g-202002231425108042_300x300.jpg', N'Made in VietName', 15, 41, CAST(N'2020-07-03' AS Date), CAST(N'2021-10-28' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product59', N'Banh Canh', N'https://cdn.tgdd.vn/Products/Images/4085/195189/bhx/thung-30-goi-banh-canh-ga-vina-bich-chi-60g-202002191017462547_300x300.jpg', N'Made in VietName', 17, 42, CAST(N'2020-01-01' AS Date), CAST(N'2021-12-01' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product6', N'Fanta Orange', N'https://cdn.tgdd.vn/Products/Images/2443/84391/bhx/6-chai-nuoc-ngot-fanta-huong-cam-390ml-202005041408537431_300x300.jpg', N'Made in VietName', 30, 25, CAST(N'2020-11-27' AS Date), CAST(N'2021-09-30' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product60', N'Yobokii', N'https://cdn.tgdd.vn/Products/Images/7162/230178/bhx/banh-gao-rapokki-yopokki-vi-pho-mai-goi-260g-202010311343322058_300x300.jpg', N'Made in VietName', 19, 43, CAST(N'2021-01-19' AS Date), CAST(N'2022-01-13' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product61', N'Pin Rocket', N'https://cdn.tgdd.vn/Products/Images/7162/221100/bhx/banh-gao-pink-rocket-topokki-vi-pho-mai-goi-240g-202004221418493273_300x300.jpg', N'Made in VietName', 21, 44, CAST(N'2020-12-24' AS Date), CAST(N'2021-02-28' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product62', N'Matamun', N'https://cdn.tgdd.vn/Products/Images/7162/230177/bhx/banh-gao-cat-lat-tokpokki-matamun-goi-600g-202010311338383029_300x300.jpg', N'Made in VietName', 23, 45, CAST(N'2021-01-02' AS Date), CAST(N'2021-12-01' AS Date), N'category3', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product63', N'Teama Buget', N'https://cdn.tgdd.vn/Products/Images/7599/229710/bhx/pho-mai-lat-teama-burger-goi-200g-12-lat-202010280846557243_300x300.jpg', N'Made in VietName', 25, 46, CAST(N'2020-07-03' AS Date), CAST(N'2021-05-12' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product64', N'Teama Cheese', N'https://cdn.tgdd.vn/Products/Images/7599/229662/bhx/pho-mai-teama-hop-240g-16-mieng-202010280841079488_300x300.jpg', N'Made in VietName', 27, 47, CAST(N'2020-10-23' AS Date), CAST(N'2021-10-28' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product65', N'Vinamilk Yourmot', N'https://cdn.tgdd.vn/Products/Images/7558/232450/bhx/sua-chua-it-duong-vinamilk-hoa-anh-dao-va-luu-do-hop-100g-202012242245276033_300x300.jpg', N'Made in VietName', 29, 48, CAST(N'2020-12-24' AS Date), CAST(N'2021-09-30' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product66', N'Kid Mit', N'https://cdn.tgdd.vn/Products/Images/7558/228342/bhx/loc-6-hu-pho-mai-sua-chua-hoa-qua-kids-mix-premium-50g-202010281042599158_300x300.jpg', N'Made in VietName', 31, 49, CAST(N'2020-11-27' AS Date), CAST(N'2021-12-01' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product67', N'Mix Premium', N'https://cdn.tgdd.vn/Products/Images/7558/228342/bhx/loc-6-hu-pho-mai-sua-chua-hoa-qua-kids-mix-premium-50g-202010281042599158_300x300.jpg', N'Made in VietName', 33, 50, CAST(N'2021-01-02' AS Date), CAST(N'2022-01-13' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product68', N'Le Petit', N'https://cdn.tgdd.vn/Products/Images/7599/222531/bhx/loc-6-hop-pho-mai-vi-trai-cay-dau-chuoi-mo-kids-mix-le-petit-plaisir-50g-202101161805238716_300x300.jpg', N'Made in VietName', 35, 1, CAST(N'2020-07-03' AS Date), CAST(N'2021-12-01' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product69', N'Mixxo Go', N'https://cdn.tgdd.vn/Products/Images/7558/222532/bhx/loc-4-hop-vang-sua-tuoi-mixxo-gold-75g-202012242304323096_300x300.jpg', N'Made in VietName', 37, 2, CAST(N'2021-01-02' AS Date), CAST(N'2021-09-30' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product7', N'Warrior', N'https://cdn.tgdd.vn/Products/Images/3226/209214/bhx/nuoc-tang-luc-warrior-dau-325ml-201908082317452632_300x300.jpg', N'Made in VietName', 35, 30, CAST(N'2021-01-19' AS Date), CAST(N'2021-05-12' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product70', N'Vani Hot', N'https://cdn.tgdd.vn/Products/Images/7558/158736/bhx/loc-4-hop-pho-mai-tuoi-huong-dau-vani-hoff-200g-202009110841470428_300x300.jpg', N'Made in VietName', 39, 3, CAST(N'2020-10-23' AS Date), CAST(N'2021-05-12' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product71', N'Milk Tiger', N'https://cdn.tgdd.vn/Products/Images/7558/158737/bhx/loc-4-hu-pho-mai-tuoi-huong-dau-chuoi-hoff-200g-202009110836583093_300x300.jpg', N'Made in VietName', 41, 4, CAST(N'2020-12-24' AS Date), CAST(N'2021-10-28' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product72', N'Cheddar', N'https://cdn.tgdd.vn/Products/Images/7599/217836/bhx/pho-mai-lat-lactima-cheddar-goi-200g-12-lat-202002251011148794_300x300.jpg', N'Made in VietName', 2, 5, CAST(N'2021-01-19' AS Date), CAST(N'2021-12-01' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product73', N'Sanwitvh', N'https://cdn.tgdd.vn/Products/Images/7599/210065/bhx/pho-mai-lat-zott-sandwich-goi-200g-12-lat-202002251305588134_300x300.jpg', N'Made in VietName', 4, 6, CAST(N'2020-07-03' AS Date), CAST(N'2022-01-13' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product74', N'Burger', N'https://cdn.tgdd.vn/Products/Images/7599/207236/bhx/pho-mai-lat-zott-burger-goi-200g-12-lat-202002251324116234_300x300.jpg', N'Made in VietName', 6, 7, CAST(N'2020-11-27' AS Date), CAST(N'2021-09-30' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product75', N'Belcube', N'https://cdn.tgdd.vn/Products/Images/7599/208834/bhx/pho-mai-vi-sua-con-bo-cuoi-belcube-goi-78g-15-vien-202010261140253348_300x300.jpg', N'Made in VietName', 8, 8, CAST(N'2020-01-01' AS Date), CAST(N'2021-02-28' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product76', N'Mina Takun', N'https://cdn.tgdd.vn/Products/Images/7558/230820/bhx/sua-chua-an-vinamilk-co-duong-love-yogurt-hop-100g-202012311050116052_300x300.jpg', N'Made in VietName', 48, 30, CAST(N'2020-07-03' AS Date), CAST(N'2021-05-12' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product77', N'Lotha Milk', N'https://cdn.tgdd.vn/Products/Images/7598/223243/bhx/sua-chua-uong-thanh-trung-co-duong-lothamilk-chai-880ml-202012221107011722_300x300.jpg', N'Made in VietName', 10, 9, CAST(N'2021-01-19' AS Date), CAST(N'2021-05-12' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product78', N'Betagen', N'https://cdn.tgdd.vn/Products/Images/7598/220563/bhx/sua-uong-len-men-huong-cam-betagen-chai-700ml-202004131918321853_300x300.jpg', N'Made in VietName', 12, 10, CAST(N'2020-12-24' AS Date), CAST(N'2021-10-28' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product79', N'Hoff', N'https://cdn.tgdd.vn/Products/Images/7558/222449/bhx/loc-4-hop-sua-chua-vi-chuoi-hoff-55g-202009110922280108_300x300.jpg', N'Made in VietName', 14, 11, CAST(N'2020-07-03' AS Date), CAST(N'2021-09-30' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product8', N'Boganic', N'https://cdn.tgdd.vn/Products/Images/8938/227305/bhx/tra-thao-moc-boganic-290ml-202008212113576557_300x300.jpg', N'Made in VietName', 40, 35, CAST(N'2020-07-03' AS Date), CAST(N'2021-10-28' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product80', N'Lotha Milk', N'https://cdn.tgdd.vn/Products/Images/7598/158744/bhx/sua-tuoi-thanh-trung-co-duong-lothamilk-chai-880ml-202012221121590006_300x300.jpg', N'Made in VietName', 16, 12, CAST(N'2020-11-27' AS Date), CAST(N'2022-01-13' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product81', N'Mozzarella', N'https://cdn.tgdd.vn/Products/Images/7599/228101/bhx/pho-mai-baker-cheese-mozzarella-snack-goi-84g-202009080946555959_300x300.jpg', N'Made in VietName', 18, 13, CAST(N'2020-10-23' AS Date), CAST(N'2021-02-28' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product82', N'Vinamilk Love', N'https://cdn.tgdd.vn/Products/Images/7558/223990/bhx/loc-4-hop-sua-chua-com-vinamilk-love-yogurt-100g-202009110902164172_300x300.jpg', N'Made in VietName', 20, 14, CAST(N'2021-01-19' AS Date), CAST(N'2021-05-12' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product83', N'Probi', N'https://cdn.tgdd.vn/Products/Images/7598/197989/bhx/loc-4-chai-sua-chua-uong-men-song-co-duong-vinamilk-probi-130ml-201906131429548504_300x300.jpg', N'Made in VietName', 22, 15, CAST(N'2020-12-24' AS Date), CAST(N'2021-10-28' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product84', N'Gotz', N'https://cdn.tgdd.vn/Products/Images/7558/222517/bhx/loc-4-hop-vang-sua-dinh-duong-gotz-55g-202009110916550602_300x300.jpg', N'Made in VietName', 24, 16, CAST(N'2020-01-01' AS Date), CAST(N'2021-12-01' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product85', N'Lactima Active', N'https://cdn.tgdd.vn/Products/Images/7599/216009/bhx/pho-mai-vi-sua-lactima-active-cow-hop-120g-8-mieng-202002251052322994_300x300.jpg', N'Made in VietName', 26, 16, CAST(N'2020-07-03' AS Date), CAST(N'2021-12-01' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product86', N'Su Su', N'https://cdn.tgdd.vn/Products/Images/7558/198084/bhx/loc-4-hop-sua-chua-cho-tre-em-co-duong-susu-80g-201910291554392454_300x300.jpg', N'Made in VietName', 28, 8, CAST(N'2021-01-19' AS Date), CAST(N'2021-12-01' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product87', N'Vina Probiti', N'https://cdn.tgdd.vn/Products/Images/7598/198044/bhx/loc-5-chai-sua-chua-uong-vinamilk-dua-gang-65ml-201905142339506442_300x300.JPG', N'Made in VietName', 30, 18, CAST(N'2021-01-02' AS Date), CAST(N'2021-02-28' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product88', N'Nutifoot', N'https://cdn.tgdd.vn/Products/Images/7558/222523/bhx/loc-4-hop-sua-chua-nha-dam-nutifood-100g-202010280918559359_300x300.jpg', N'Made in VietName', 32, 19, CAST(N'2020-11-27' AS Date), CAST(N'2021-12-01' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product89', N'Lothaten', N'https://cdn.tgdd.vn/Products/Images/7598/158743/bhx/sua-tuoi-thanh-trung-co-duong-lothamilk-chai-490ml-202007300920112082_300x300.jpg', N'Made in VietName', 34, 20, CAST(N'2020-01-01' AS Date), CAST(N'2021-05-12' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product9', N'C2 Lemon', N'https://cdn.tgdd.vn/Products/Images/8938/231591/bhx/loc-6-chai-tra-xanh-c2-huong-chanh-230ml-202011280826567991_300x300.jpg', N'Made in VietName', 45, 40, CAST(N'2020-01-01' AS Date), CAST(N'2021-12-01' AS Date), N'category1', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product90', N'Muta Love', N'https://cdn.tgdd.vn/Products/Images/7558/220421/bhx/sua-chua-co-duong-lothamilk-hop-100g-202004151359188103_300x300.jpg', N'Made in VietName', 36, 21, CAST(N'2020-10-23' AS Date), CAST(N'2021-10-28' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product91', N'Mina Soi', N'https://cdn.tgdd.vn/Products/Images/7558/230820/bhx/sua-chua-an-vinamilk-co-duong-love-yogurt-hop-100g-202012311050116052_300x300.jpg', N'Made in VietName', 38, 22, CAST(N'2020-07-03' AS Date), CAST(N'2021-09-30' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product92', N'Mita Kun', N'https://cdn.tgdd.vn/Products/Images/7558/220419/bhx/sua-chua-mut-dau-lothamilk-hop-100g-202004151400469432_300x300.jpg', N'Made in VietName', 40, 23, CAST(N'2020-12-24' AS Date), CAST(N'2021-12-01' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product93', N'Diipper', N'https://cdn.tgdd.vn/Products/Images/7599/207459/bhx/pho-mai-cham-banh-vi-pizza-con-bo-cuoi-cheez-dippers-goi-35g-202004200915160198_300x300.jpg', N'Made in VietName', 42, 24, CAST(N'2021-01-19' AS Date), CAST(N'2022-01-13' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product94', N'Xathuaon', N'https://cdn.tgdd.vn/Products/Images/7598/158754/bhx/sua-chua-uong-thanh-trung-co-duong-lothamilk-chai-180ml-202012220945481470_300x300.jpg', N'Made in VietName', 46, 25, CAST(N'2020-11-27' AS Date), CAST(N'2021-02-28' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product95', N'Stanbon', N'https://cdn.tgdd.vn/Products/Images/7598/212673/bhx/sua-chua-uong-tuoi-vinamilk-vi-tu-nhien-chai-200ml-201910111105046597_300x300.jpg', N'Made in VietName', 44, 26, CAST(N'2020-01-01' AS Date), CAST(N'2021-12-01' AS Date), N'category4', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product96', N'Sparling Strawbery', N'https://cdn.tgdd.vn/Products/Images/2443/232593/bhx/nuoc-ngot-co-ga-sparkling-okf-vi-dau-lon-350ml-202101101502162262_300x300.jpg', N'Made in VietName', 48, 27, CAST(N'2020-07-03' AS Date), CAST(N'2021-05-12' AS Date), N'category5', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product97', N'Sparling Lemon', N'https://cdn.tgdd.vn/Products/Images/2443/232594/bhx/nuoc-ngot-co-ga-sparkling-okf-vi-chanh-vang-lon-350ml-202101101502293504_300x300.jpg', N'Made in VietName', 1, 28, CAST(N'2021-01-19' AS Date), CAST(N'2021-10-28' AS Date), N'category5', 1)
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product98', N'Pocari', N'https://cdn.tgdd.vn/Products/Images/8965/95466/bhx/thung-24-chai-nuoc-khoang-i-on-pocari-sweat-500ml-201907151446471961_300x300.jpg', N'Made in VietName', 3, 29, CAST(N'2020-12-24' AS Date), CAST(N'2021-09-30' AS Date), N'category5', 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [description], [price], [quantity], [createDate], [expiryDate], [categoryID], [status]) VALUES (N'product99', N'Aquarius Zero', N'https://cdn.tgdd.vn/Products/Images/8965/211682/bhx/thung-24-chai-nuoc-uong-van-dong-aquarius-zero-390ml-202005081259514210_300x300.jpg', N'Made in VietName', 5, 30, CAST(N'2020-11-27' AS Date), CAST(N'2021-12-01' AS Date), N'category5', 1)
INSERT [dbo].[tblRoles] ([roleID], [roleName], [status]) VALUES (N'AD', N'Admin', 1)
INSERT [dbo].[tblRoles] ([roleID], [roleName], [status]) VALUES (N'US', N'User', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [phone], [email], [address], [roleID], [status]) VALUES (N'admin', N'1', N'Admin', N'0961191730', N'admin@gmail.com', N'Bao Loc - Lam Dong', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [phone], [email], [address], [roleID], [status]) VALUES (N'test', N'123456', N'Test', N'0961191733', N'test@gmail.com', N'Bao Loc - Lam Dong', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [phone], [email], [address], [roleID], [status]) VALUES (N'tuanvu', N'1', N'Tuan Vu', N'0961191732', N'tuanvu@gmail.com', N'Bao Loc - Lam Dong', N'US', 1)
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblRecords]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblRecords]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [Assignment1_LeDuyTuanVu] SET  READ_WRITE 
GO

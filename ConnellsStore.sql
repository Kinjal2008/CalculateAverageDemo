USE [master]
GO

CREATE DATABASE [ConnellsStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConnellsStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ConnellsStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConnellsStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ConnellsStore_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ConnellsStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConnellsStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConnellsStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConnellsStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConnellsStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConnellsStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConnellsStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConnellsStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConnellsStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConnellsStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConnellsStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConnellsStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConnellsStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConnellsStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConnellsStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConnellsStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConnellsStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConnellsStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConnellsStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConnellsStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConnellsStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConnellsStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConnellsStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConnellsStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConnellsStore] SET RECOVERY FULL 
GO
ALTER DATABASE [ConnellsStore] SET  MULTI_USER 
GO
ALTER DATABASE [ConnellsStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConnellsStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConnellsStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConnellsStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConnellsStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ConnellsStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConnellsStore', N'ON'
GO
ALTER DATABASE [ConnellsStore] SET QUERY_STORE = OFF
GO
USE [ConnellsStore]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](40) NULL,
	[LastName] [nvarchar](40) NULL,
	[Telephone] [nvarchar](30) NULL,
	[Email] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[OrderRef] [nvarchar](50) NULL,
	[SKU] [nvarchar](50) NULL,
	[OrderTotal] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Telephone], [Email], [CreatedDate]) VALUES (1, N'Jhon', N'Smith', N'01234567890', N'jsmith@test.com', CAST(N'2023-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Telephone], [Email], [CreatedDate]) VALUES (2, N'Mark', N'Tylor', N'02255446644', N'mtylor@test.com', CAST(N'2023-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Telephone], [Email], [CreatedDate]) VALUES (3, N'Adam', N'Gracia', N'04545565601', N'mgracia@test.com', CAST(N'2023-03-02T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([Id], [CustomerId], [OrderRef], [SKU], [OrderTotal]) VALUES (1, 1, N'O1122334455', N'Cycl', CAST(500 AS Decimal(18, 0)))
GO
INSERT [dbo].[Order] ([Id], [CustomerId], [OrderRef], [SKU], [OrderTotal]) VALUES (2, 2, N'O1122334402', N'Cloth', CAST(45 AS Decimal(18, 0)))
GO
INSERT [dbo].[Order] ([Id], [CustomerId], [OrderRef], [SKU], [OrderTotal]) VALUES (3, 3, N'O1212232302', N'Groc', CAST(74 AS Decimal(18, 0)))
GO
INSERT [dbo].[Order] ([Id], [CustomerId], [OrderRef], [SKU], [OrderTotal]) VALUES (4, 1, N'O1112526454', N'Cloth', CAST(70 AS Decimal(18, 0)))
GO
INSERT [dbo].[Order] ([Id], [CustomerId], [OrderRef], [SKU], [OrderTotal]) VALUES (5, 2, N'O4454648404', N'Elec', CAST(100 AS Decimal(18, 0)))
GO
INSERT [dbo].[Order] ([Id], [CustomerId], [OrderRef], [SKU], [OrderTotal]) VALUES (6, 2, N'O4448545685', N'Food', CAST(10 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Customer_Order]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomerOrderDetail]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  
	TRIM(c.FirstName) + ' ' + TRIM(c.LastName) AS CustomerName,
	COUNT(c.Id) AS TotalOrderPlaced
	FROM Customer c
	LEFT JOIN [Order] o ON c.Id = o.CustomerId
	GROUP BY c.FirstName, c.LastName, c.Id
END
GO
USE [master]
GO
ALTER DATABASE [ConnellsStore] SET  READ_WRITE 
GO

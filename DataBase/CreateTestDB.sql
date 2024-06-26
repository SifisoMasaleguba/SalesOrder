USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 2022-11-27 11:18:27 AM ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDB', N'ON'
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = OFF
GO
USE [TestDB]
GO
/****** Object:  User [testAssementUser]    Script Date: 2022-11-27 11:18:27 AM ******/
CREATE USER [testAssementUser] FOR LOGIN [testAssementUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [testAssementUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [testAssementUser]
GO
/****** Object:  Table [dbo].[COMMENT]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMMENT](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Comment] [varchar](500) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[DateOfComment] [datetime] NULL,
 CONSTRAINT [PK_PON_ID] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERHEADER]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERHEADER](
	[OrderHeaderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](100) NOT NULL,
	[OrderType] [varchar](100) NOT NULL,
	[CustomerName] [varchar](250) NOT NULL,
	[CreateDate] [datetime] NULL,
	[isOrderHeaderDeleted] [bit] NULL,
	[OrderTypeId] [int] NOT NULL,
	[OrderStatus] [varchar](100) NOT NULL,
	[OrderStatusId] [int] NOT NULL,
 CONSTRAINT [PK_OrderHeaderId] PRIMARY KEY CLUSTERED 
(
	[OrderHeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERLINE]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERLINE](
	[OrderLineId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [varchar](100) NOT NULL,
	[ProductType] [varchar](100) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[CostPrice] [money] NOT NULL,
	[SalesPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[isOrderLineDeleted] [bit] NULL,
	[OrderHeaderId] [int] NOT NULL,
	[LineNumber] [int] NULL,
 CONSTRAINT [PK_OrderLineId] PRIMARY KEY CLUSTERED 
(
	[OrderLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[ReleaseDate] [datetime] NULL,
	[isProductDeleted] [bit] NULL,
 CONSTRAINT [PK_PO_ID] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[COMMENT] ON 

INSERT [dbo].[COMMENT] ([CommentId], [ProductId], [Comment], [Email], [DateOfComment]) VALUES (1, 7, N'test comment', N'test@email', CAST(N'2022-11-24T00:30:46.637' AS DateTime))
INSERT [dbo].[COMMENT] ([CommentId], [ProductId], [Comment], [Email], [DateOfComment]) VALUES (2, 7, N'test message', N'test@test.com', CAST(N'2022-11-24T01:46:07.100' AS DateTime))
INSERT [dbo].[COMMENT] ([CommentId], [ProductId], [Comment], [Email], [DateOfComment]) VALUES (3, 1, N'test', N'test', CAST(N'2022-11-24T11:28:52.480' AS DateTime))
SET IDENTITY_INSERT [dbo].[COMMENT] OFF
GO
SET IDENTITY_INSERT [dbo].[ORDERHEADER] ON 

INSERT [dbo].[ORDERHEADER] ([OrderHeaderId], [OrderNumber], [OrderType], [CustomerName], [CreateDate], [isOrderHeaderDeleted], [OrderTypeId], [OrderStatus], [OrderStatusId]) VALUES (1, N'1', N'Normal', N'testco', CAST(N'2022-11-14T10:01:00.000' AS DateTime), 1, 1, N'New', 1)
INSERT [dbo].[ORDERHEADER] ([OrderHeaderId], [OrderNumber], [OrderType], [CustomerName], [CreateDate], [isOrderHeaderDeleted], [OrderTypeId], [OrderStatus], [OrderStatusId]) VALUES (2, N'2', N'Normal', N'spar', CAST(N'2022-11-26T08:27:00.000' AS DateTime), 0, 1, N'New', 1)
INSERT [dbo].[ORDERHEADER] ([OrderHeaderId], [OrderNumber], [OrderType], [CustomerName], [CreateDate], [isOrderHeaderDeleted], [OrderTypeId], [OrderStatus], [OrderStatusId]) VALUES (3, N'1', N'Normal', N'testco', CAST(N'2022-11-24T10:00:00.000' AS DateTime), 0, 1, N'New', 1)
INSERT [dbo].[ORDERHEADER] ([OrderHeaderId], [OrderNumber], [OrderType], [CustomerName], [CreateDate], [isOrderHeaderDeleted], [OrderTypeId], [OrderStatus], [OrderStatusId]) VALUES (4, N'1', N'Normal', N'testco', CAST(N'2022-11-24T10:00:00.000' AS DateTime), 1, 1, N'New', 1)
INSERT [dbo].[ORDERHEADER] ([OrderHeaderId], [OrderNumber], [OrderType], [CustomerName], [CreateDate], [isOrderHeaderDeleted], [OrderTypeId], [OrderStatus], [OrderStatusId]) VALUES (5, N'1', N'Normal', N'testco', CAST(N'2022-11-14T10:01:00.000' AS DateTime), 0, 1, N'New', 1)
INSERT [dbo].[ORDERHEADER] ([OrderHeaderId], [OrderNumber], [OrderType], [CustomerName], [CreateDate], [isOrderHeaderDeleted], [OrderTypeId], [OrderStatus], [OrderStatusId]) VALUES (6, N'1', N'Normal', N'testco', CAST(N'2022-11-14T10:01:00.000' AS DateTime), 0, 1, N'New', 1)
SET IDENTITY_INSERT [dbo].[ORDERHEADER] OFF
GO
SET IDENTITY_INSERT [dbo].[ORDERLINE] ON 

INSERT [dbo].[ORDERLINE] ([OrderLineId], [ProductCode], [ProductType], [ProductTypeId], [CostPrice], [SalesPrice], [Quantity], [isOrderLineDeleted], [OrderHeaderId], [LineNumber]) VALUES (1, N'test', N'Equipment', 3, 12.0000, 30.0000, 3, 0, 0, 1)
INSERT [dbo].[ORDERLINE] ([OrderLineId], [ProductCode], [ProductType], [ProductTypeId], [CostPrice], [SalesPrice], [Quantity], [isOrderLineDeleted], [OrderHeaderId], [LineNumber]) VALUES (2, N'PORK', N'Motor', 3, 10.0000, 21.0000, 2, 0, 2, 1)
INSERT [dbo].[ORDERLINE] ([OrderLineId], [ProductCode], [ProductType], [ProductTypeId], [CostPrice], [SalesPrice], [Quantity], [isOrderLineDeleted], [OrderHeaderId], [LineNumber]) VALUES (3, N'CHC-20', N'Equipment', 3, 10.0000, 30.0000, 2, 1, 2, 2)
SET IDENTITY_INSERT [dbo].[ORDERLINE] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (1, N'Test', 501.0000, CAST(N'2022-11-23T11:37:43.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (2, N'Test1', 50.0000, CAST(N'2022-11-23T13:13:02.100' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (5, N'test', 15.3500, CAST(N'2022-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (6, N'Margarine', 210.0000, CAST(N'2022-12-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (7, N'Margarine', 100.0000, CAST(N'2022-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (8, N'Margarine', 120.0000, CAST(N'2022-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (9, N'test', 12.0000, CAST(N'2020-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (10, N'test', 0.0000, CAST(N'2012-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (11, N'test', 0.0000, CAST(N'2012-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (16, N'test', 21.0000, CAST(N'2021-02-02T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (17, N'Beef Heels', 48.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (18, N'Beef Hind Quarter', 49.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (19, N'Beef Skirts', 50.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (20, N'Beef Mince', 51.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (21, N'Beef Boerewors', 52.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (22, N'Beef MDM', 53.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (23, N'Beef Trim 90/10', 54.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (24, N'Beef Fat - Mixed', 55.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (25, N'Beef Shank Trim', 56.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (26, N'Beef Trim 70/30', 57.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (27, N'Beef Heels', 48.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (28, N'Beef Hind Quarter', 49.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (29, N'Beef Skirts', 50.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (30, N'Beef Mince', 51.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (31, N'Beef Boerewors', 52.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (32, N'Beef MDM', 53.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (33, N'Beef Trim 90/10', 54.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (34, N'Beef Fat - Mixed', 55.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (35, N'Beef Shank Trim', 56.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([ProductId], [Name], [Price], [ReleaseDate], [isProductDeleted]) VALUES (36, N'Beef Trim 70/30', 57.0000, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
ALTER TABLE [dbo].[COMMENT] ADD  CONSTRAINT [DF_DateOfComment]  DEFAULT (getdate()) FOR [DateOfComment]
GO
ALTER TABLE [dbo].[ORDERHEADER] ADD  CONSTRAINT [DF_ORDERHEADER_IS_DELETED]  DEFAULT ((0)) FOR [isOrderHeaderDeleted]
GO
ALTER TABLE [dbo].[ORDERLINE] ADD  CONSTRAINT [DF_ORDERLINE_IS_DELETED]  DEFAULT ((0)) FOR [isOrderLineDeleted]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  CONSTRAINT [DF_PRODUCT_IS_DELETED]  DEFAULT ((0)) FOR [isProductDeleted]
GO
/****** Object:  StoredProcedure [dbo].[STP_COMMENT]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-22
-- Description:		Return Comment
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_COMMENT]
(
  @ProductId INT = NULL
) AS

 BEGIN
	SET NOCOUNT ON

	SELECT
	   C.ProductId,
	   C.Comment,
	   C.Email,
	   DateOfComment
	FROM
		 [dbo].[COMMENT] C WITH (ROWLOCK)
	WHERE 1 = 1	
		AND C.ProductId  = @ProductId

END

GO
/****** Object:  StoredProcedure [dbo].[STP_COMMENT_ADD]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-22
-- Description:		Insert Comment
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_COMMENT_ADD]
(
  @ProductId INT,
  @Comment  varchar (500) ,
  @Email  nvarchar(256)
) AS

 BEGIN
	SET NOCOUNT ON

	INSERT INTO [dbo].[COMMENT]([ProductId],[Comment],[Email],[DateOfComment])
	VALUES (@ProductId,@Comment,@Email,GETDATE())

END

GO
/****** Object:  StoredProcedure [dbo].[STP_COUNT_PRODUCTS]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-24
-- Description:		Return Total number of Products
-- EXAMPLE : EXEC [dbo].[STP_COUNT_PRODUCTS]
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_COUNT_PRODUCTS]

 
 AS

 BEGIN
	SET NOCOUNT ON

	SELECT	   
		COUNT(P.ProductId) AS TotalNumberOfProduct 
	FROM
		[dbo].[PRODUCT] P WITH (NOLOCK)
	WHERE 1 = 1		
		AND P.isProductDeleted = 0

END

GO
/****** Object:  StoredProcedure [dbo].[STP_ORDERHEADER]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-23
-- Description:		Return ORDERHEADER
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_ORDERHEADER]
(
  @OrderNumber VARCHAR(100) = NULL,
  @OrderHeaderId INT = NULL

) AS

 BEGIN   
	SET NOCOUNT ON

	SELECT 
		OH.OrderHeaderId,
		OH.OrderNumber,
		OH.OrderType,
		OH.OrderTypeId,
		OH.CustomerName,
		OH.CreateDate,
		OrderStatus,
	    OrderStatusId,
		OH.isOrderHeaderDeleted
	FROM    
		ORDERHEADER OH WITH (NOLOCK)
	WHERE 1 = 1
		AND (OH.OrderNumber = @OrderNumber OR ISNULL(@OrderNumber,-1) = -1)
		AND (OH.OrderHeaderId = @OrderHeaderId OR ISNULL(@OrderHeaderId,-1) = -1)
		AND OH.isOrderHeaderDeleted =0		 

END

GO
/****** Object:  StoredProcedure [dbo].[STP_ORDERHEADER_ADD]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-25
-- Description:		Insert ORDERHEADER
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_ORDERHEADER_ADD]
(
  @OrderNumber VARCHAR(100),
  @OrderType VARCHAR(100),
  @OrderTypeId INT,
  @CustomerName VARCHAR(250),
  @CreateDate DATETIME,
  @OrderStatusId INT,
  @OrderStatus VARCHAR(100)
) AS

 BEGIN
	SET NOCOUNT ON
        
		INSERT INTO  [dbo].[ORDERHEADER] (OrderNumber, OrderType,OrderTypeId, CustomerName, CreateDate,OrderStatusId,OrderStatus)
		VALUES (@OrderNumber,@OrderType,@OrderTypeId,@CustomerName,@CreateDate,@OrderStatusId,@OrderStatus)

END

GO
/****** Object:  StoredProcedure [dbo].[STP_ORDERHEADER_BY_DATE]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-23
-- Description:		Return ORDERHEADER
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_ORDERHEADER_BY_DATE]
(
  @StartCreateDate DATETIME    = NULL,
  @EndCreateDate DATETIME    = NULL
) AS

 BEGIN   
	SET NOCOUNT ON
	SET  @StartCreateDate = NULLIF(@StartCreateDate, '')
    SET @EndCreateDate = NULLIF(@EndCreateDate, '')
	SELECT 
		OH.OrderHeaderId,
		OH.OrderNumber,
		OH.OrderType,
		OH.OrderTypeId,
		OH.CustomerName,
		OH.CreateDate,
		OrderStatus,
	    OrderStatusId,
		OH.isOrderHeaderDeleted
	FROM    
		ORDERHEADER OH WITH (NOLOCK)
	WHERE 1 = 1
		AND OH.isOrderHeaderDeleted =0
		AND (
			  (@EndCreateDate IS NOT NULL AND @StartCreateDate IS NOT NULL) 
			     AND 
			    (OH.CreateDate BETWEEN @StartCreateDate AND @EndCreateDate)
		     ) 

END

GO
/****** Object:  StoredProcedure [dbo].[STP_ORDERHEADER_DELETE]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-22
-- Description:		Delete ORDERHEADER
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_ORDERHEADER_DELETE]
(
  @OrderHeaderId INT 
) AS

 BEGIN
	SET NOCOUNT ON

	UPDATE OL
	SET
	  OL.isOrderLineDeleted = 1
	FROM
		[dbo].[ORDERLINE] OL WITH (ROWLOCK)		
	WHERE 1 = 1	
		AND OL.OrderHeaderId = @OrderHeaderId

	UPDATE OH
	SET
	  OH.isOrderHeaderDeleted = 1
	FROM
		[dbo].ORDERHEADER OH WITH (ROWLOCK)
	WHERE 1 = 1	
		AND OH.OrderHeaderId  = @OrderHeaderId


   /*
    DELETE OH    	
    FROM    
    		[dbo].ORDERHEADER OH WITH (ROWLOCK)
	WHERE 1 = 1	
			AND OH.OrderHeaderId  =@OrderHeaderId
	*/
END

GO
/****** Object:  StoredProcedure [dbo].[STP_ORDERHEADER_UPDATE]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-25
-- Description:		Update ORDERHEADER
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_ORDERHEADER_UPDATE]
(
  @OrderHeaderId INT,
  @OrderNumber VARCHAR(100),
  @OrderType VARCHAR(100),
  @OrderTypeId INT,
  @CustomerName VARCHAR(250),
  @CreateDate DATETIME,
  @OrderStatusId INT,
  @OrderStatus VARCHAR(100)
) AS

 BEGIN
	SET NOCOUNT ON

		UPDATE OH
		SET
			OH.OrderNumber  = @OrderNumber,
			OH.OrderType    = @OrderType,
			OH.OrderTypeId  = @OrderTypeId,
			OH.CustomerName = @CustomerName,
			OH.CreateDate   = @CreateDate,
			OH.OrderStatusId = @OrderStatusId,
			OH.OrderStatus   = @OrderStatus
		FROM
			[dbo].[ORDERHEADER] OH WITH (ROWLOCK)
		WHERE 1 = 1
			AND OH.OrderHeaderId = @OrderHeaderId

END

GO
/****** Object:  StoredProcedure [dbo].[STP_ORDERLINE]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-25
-- Description:		Return ORDERLINE
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_ORDERLINE]
(
  @OrderLineId INT
) AS

 BEGIN
	SET NOCOUNT ON

	SELECT		
		OL.LineNumber, 
		OL.ProductCode, 
		OL.ProductType, 
		OL.ProductTypeId, 
		OL.CostPrice, 
		OL.SalesPrice, 
		OL.Quantity,
		OL.OrderHeaderId,
		OL.isOrderLineDeleted,
		OL.OrderLineId
	FROM    
		ORDERLINE OL WITH (NOLOCK)
	WHERE 1 = 1
		AND (OL.OrderLineId = @OrderLineId)	
		AND OL.isOrderLineDeleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[STP_ORDERLINE_ADD]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-25
-- Description:		Insert ORDERLINE
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_ORDERLINE_ADD]
(
    @ProductCode VARCHAR(100),
    @ProductType VARCHAR(100),
    @ProductTypeId INT ,
    @CostPrice  MONEY ,
    @SalesPrice  MONEY ,
    @Quantity  INT ,
    @OrderHeaderId INT,
	@LineNumber INT

) AS

 BEGIN
	SET NOCOUNT ON
	
	INSERT INTO [dbo].[ORDERLINE](LineNumber,ProductCode, ProductType, ProductTypeId, CostPrice, SalesPrice, Quantity,OrderHeaderId)
	VALUES (@LineNumber,@ProductCode,@ProductType,@ProductTypeId,@CostPrice,@SalesPrice,@Quantity,@OrderHeaderId)

END

GO
/****** Object:  StoredProcedure [dbo].[STP_ORDERLINE_DELETE]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-26
-- Description:		Update ORDERLINE
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_ORDERLINE_DELETE]
(
  @OrderLineId INT 
) AS

 BEGIN
	SET NOCOUNT ON

	UPDATE OL
	SET
	  OL.isOrderLineDeleted = 1
	FROM
		[dbo].[ORDERLINE] OL WITH (ROWLOCK)
	WHERE 1 = 1	
		AND OL.OrderLineId  =@OrderLineId
   /*
    DELETE OL    	
    FROM    
    	[dbo].[ORDERLINE] OL WITH (ROWLOCK)
	WHERE 1 = 1	
			AND OL.OrderLineId  =@OrderLineId
	*/
END

GO
/****** Object:  StoredProcedure [dbo].[STP_ORDERLINE_LIST]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-25
-- Description:		Return ORDERLINES
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_ORDERLINE_LIST]
(
  @OrderHeaderId INT  
) AS

 BEGIN
	SET NOCOUNT ON

	SELECT		
		OL.LineNumber, 
		OL.ProductCode, 
		OL.ProductType, 
		OL.ProductTypeId, 
		OL.CostPrice, 
		OL.SalesPrice, 
		OL.Quantity,
		OL.OrderHeaderId,
		OL.isOrderLineDeleted,
		OL.OrderLineId
	FROM    
		ORDERLINE OL WITH (NOLOCK)
	WHERE 1 = 1		
		AND (OL.OrderHeaderId = @OrderHeaderId)
		AND OL.isOrderLineDeleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[STP_ORDERLINE_UPDATE]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-25
-- Description:		Update ORDERHEADER
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_ORDERLINE_UPDATE]
(  	@OrderLineId INT, 
    @OrderHeaderId INT,
    @ProductCode VARCHAR(100),
    @ProductType VARCHAR(100),
    @ProductTypeId INT ,
    @CostPrice  MONEY ,
    @SalesPrice  MONEY ,
    @Quantity  INT 
) AS

 BEGIN
	SET NOCOUNT ON

		UPDATE OL
		SET		 
			OL.ProductCode = @ProductCode, 
			OL.ProductType = @ProductType, 
			OL.ProductTypeId = @ProductTypeId, 
			OL.CostPrice = @CostPrice, 
			OL.SalesPrice = @SalesPrice, 
			OL.Quantity = @Quantity,
			OL.OrderHeaderId = @OrderHeaderId		
		FROM
			[dbo].ORDERLINE OL WITH (ROWLOCK)
		WHERE 1 = 1
			AND OL.OrderLineId = @OrderLineId

END

GO
/****** Object:  StoredProcedure [dbo].[STP_PRODUCT_ADD]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-22
-- Description:		Insert Product
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_PRODUCT_ADD]
(
  @Name VARCHAR(100),
  @Price MONEY,
  @ReleaseDate [DATETIME]
) AS

 BEGIN
	SET NOCOUNT ON

		INSERT INTO  [dbo].[PRODUCT]([Name],[Price],[ReleaseDate])
		VALUES (@Name,@Price,@ReleaseDate)
		

END

GO
/****** Object:  StoredProcedure [dbo].[STP_PRODUCT_DELETE]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-22
-- Description:		Update Product
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_PRODUCT_DELETE]
(
  @ProductId INT 
) AS

 BEGIN
	SET NOCOUNT ON

	UPDATE P
	SET
	   P.isProductDeleted = 1
	FROM
		[dbo].[PRODUCT] P WITH (ROWLOCK)
	WHERE 1 = 1	
		AND P.ProductId  = @ProductId
   /*
    DELETE P    	
    FROM    
    	[dbo].[PRODUCT] P WITH (ROWLOCK)
	WHERE 1 = 1	
		AND P.ProductId  = @ProductId
	*/
END

GO
/****** Object:  StoredProcedure [dbo].[STP_PRODUCT_UPDATE]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-22
-- Description:		Update Product
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_PRODUCT_UPDATE]
(
  @ProductId INT,
  @Name  VARCHAR(100),
  @Price MONEY,
  @ReleaseDate DATETIME
) AS

 BEGIN
	SET NOCOUNT ON

	UPDATE P
	SET
		P.[Name]        = @Name,
		P.Price         = @Price,
		P.ReleaseDate   = @ReleaseDate
	FROM
		[dbo].[PRODUCT] P WITH (ROWLOCK)
	WHERE 1 = 1	
		AND P.ProductId  = @ProductId

END

GO
/****** Object:  StoredProcedure [dbo].[STP_PRODUCTS]    Script Date: 2022-11-27 11:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-22
-- Description:		Return Product
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[STP_PRODUCTS]
(
  @ProductId INT = NULL
) AS

 BEGIN
	SET NOCOUNT ON

	SELECT
	    P.ProductId,
		P.[Name],
		P.Price ,
		P.ReleaseDate,
		COUNT(C.ProductId) AS NumerOfComments 
	FROM
		[dbo].[PRODUCT] P WITH (NOLOCK)
		LEFT OUTER JOIN COMMENT C WITH(NOLOCK) ON C.ProductId = P.ProductId
	WHERE 1 = 1	
		AND (P.ProductId  = @ProductId OR ISNULL(@ProductId,-1) = -1)
		AND P.isProductDeleted = 0
		GROUP BY 
				P.ProductId,
				P.[Name],
				P.Price ,
				P.ReleaseDate,
				C.ProductId
END

GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO

USE [TestDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-25
-- Description:		Insert ORDERHEADER
************************************************************************************************************************************************************************************************************************************/
ALTER PROCEDURE [dbo].STP_ORDERHEADER_ADD
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
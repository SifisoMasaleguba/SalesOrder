USE [TestDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-25
-- Description:		Update ORDERHEADER
************************************************************************************************************************************************************************************************************************************/
ALTER PROCEDURE [dbo].STP_ORDERHEADER_UPDATE
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
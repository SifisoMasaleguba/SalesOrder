USE [TestDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-23
-- Description:		Return ORDERHEADER
************************************************************************************************************************************************************************************************************************************/
ALTER PROCEDURE [dbo].[STP_ORDERHEADER]
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



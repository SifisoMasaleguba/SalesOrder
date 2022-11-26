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
ALTER PROCEDURE [dbo].STP_ORDERLINE_UPDATE
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
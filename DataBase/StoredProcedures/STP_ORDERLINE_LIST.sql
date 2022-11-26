USE [TestDB]
GO

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



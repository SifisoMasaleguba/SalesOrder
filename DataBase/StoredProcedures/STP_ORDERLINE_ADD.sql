USE [TestDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-25
-- Description:		Insert ORDERLINE
************************************************************************************************************************************************************************************************************************************/
ALTER PROCEDURE [dbo].STP_ORDERLINE_ADD
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
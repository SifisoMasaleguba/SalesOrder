USE [TestDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-26
-- Description:		Update ORDERLINE
************************************************************************************************************************************************************************************************************************************/
ALTER PROCEDURE [dbo].STP_ORDERLINE_DELETE
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
USE [TestDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************************************************************************************************************************
-- Author:			Sifiso
-- Create date:		2022-11-22
-- Description:		Delete ORDERHEADER
************************************************************************************************************************************************************************************************************************************/
CREATE PROCEDURE [dbo].STP_ORDERHEADER_DELETE
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
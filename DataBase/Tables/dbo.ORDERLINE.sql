USE [TestDB]
GO


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

ALTER TABLE [dbo].[ORDERLINE] ADD  CONSTRAINT [DF_ORDERLINE_IS_DELETED]  DEFAULT ((0)) FOR [isOrderLineDeleted]
GO



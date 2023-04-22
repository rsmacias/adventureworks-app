CREATE TABLE [dbo].[SalesOrderDetail]
(
	[SalesOrderID]       [int] NOT NULL,
	[SalesOrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderQty]           [smallint] NOT NULL,
	[ProductID]          [int] NOT NULL,
	[UnitPrice]          [money] NOT NULL,
	[UnitPriceDiscount]  [money] NOT NULL,
	[LineTotal]  AS (isnull(([UnitPrice]*((1.0)-[UnitPriceDiscount]))*[OrderQty],(0.0))),
	[ModifiedDate]       [datetime2] NOT NULL,

 CONSTRAINT [PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID] PRIMARY KEY CLUSTERED 
  (
    [SalesOrderID] ASC,
    [SalesOrderDetailID] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)
GO

ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_Product_ProductID] 
  FOREIGN KEY([ProductID])
  REFERENCES [dbo].[Product] ([ProductID])
GO

ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID] 
  FOREIGN KEY([SalesOrderID])
  REFERENCES [dbo].[SalesOrderHeader] ([SalesOrderID])
  ON DELETE CASCADE
GO

ALTER TABLE [dbo].[SalesOrderDetail] ADD CONSTRAINT [DF_SalesOrderDetail_ModifiedDate]  
  DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE TABLE [dbo].[SalesOrderHeader]
(
	[SalesOrderID]           [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RevisionNumber]         [tinyint] NOT NULL,
	[OrderDate]              [datetime2] NOT NULL,
	[DueDate]                [datetime2] NOT NULL,
	[ShipDate]               [datetime2] NULL,
	[Status]                 [tinyint] NOT NULL,
	[OnlineOrderFlag]        [bit] NOT NULL,
	[SalesOrderNumber]  AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***')),
	[PurchaseOrderNumber]    [nvarchar](25) NULL,
	[AccountNumber]          [nvarchar](15) NULL,
	[CustomerID]             [int] NOT NULL,
	[ShipToAddressID]        [int] NULL,
	[BillToAddressID]        [int] NULL,
	[ShipMethod]             [nvarchar](50) NOT NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[SubTotal]               [money] NOT NULL,
	[TaxAmt]                 [money] NOT NULL,
	[Freight]                [money] NOT NULL,
	[TotalDue]  AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
	[Comment]                [nvarchar](max) NULL,
	[ModifiedDate]           [datetime2] NOT NULL,

 CONSTRAINT [PK_SalesOrderHeader_SalesOrderID] PRIMARY KEY CLUSTERED 
  (
    [SalesOrderID] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],

 CONSTRAINT [AK_SalesOrderHeader_SalesOrderNumber] UNIQUE NONCLUSTERED 
  (
    [SalesOrderNumber] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]  

)
GO

ALTER TABLE [dbo].[SalesOrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID] 
  FOREIGN KEY([CustomerID])
  REFERENCES [dbo].[Customer] ([CustomerID])
GO

ALTER TABLE [dbo].[SalesOrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID] 
  FOREIGN KEY([ShipToAddressID])
  REFERENCES [dbo].[Address] ([AddressID])
GO

ALTER TABLE [dbo].[SalesOrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID] 
  FOREIGN KEY([BillToAddressID])
  REFERENCES [dbo].[Address] ([AddressID])
GO
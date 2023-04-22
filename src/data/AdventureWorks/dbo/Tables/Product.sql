CREATE TABLE [dbo].[Product]
(
	[ProductID]              [int] IDENTITY(1,1) NOT NULL,
	[Name]                   [nvarchar](50) NOT NULL,
	[ProductNumber]          [nvarchar](25) NOT NULL,
	[Color]                  [nvarchar](15) NULL,
	[StandardCost]           [money] NOT NULL,
	[ListPrice]              [money] NOT NULL,
	[Size]                   [nvarchar](5) NULL,
	[Weight]                 [decimal](8, 2) NULL,
	[ProductCategoryID]      [int] NULL,
	[ProductModelID]         [int] NULL,
	[SellStartDate]          [datetime2] NOT NULL,
	[SellEndDate]            [datetime2] NULL,
	[DiscontinuedDate]       [datetime2] NULL,
	[ThumbNailPhoto]         [varbinary](max) NULL,
	[ThumbnailPhotoFileName] [nvarchar](50) NULL,
	[ModifiedDate]           [datetime2] NOT NULL,

 CONSTRAINT [PK_Product_ProductID] PRIMARY KEY CLUSTERED 
  (
    [ProductID] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],

 CONSTRAINT [AK_Product_Name] UNIQUE NONCLUSTERED 
  (
    [Name] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],

 CONSTRAINT [AK_Product_ProductNumber] UNIQUE NONCLUSTERED 
  (
    [ProductNumber] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

)
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID] 
  FOREIGN KEY([ProductCategoryID])
  REFERENCES [dbo].[ProductCategory] ([ProductCategoryID])
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductModel_ProductModelID] 
  FOREIGN KEY([ProductModelID])
  REFERENCES [dbo].[ProductModel] ([ProductModelID])
GO


CREATE TABLE [dbo].[ProductModel]
(
  [ProductModelID]     [int] IDENTITY(1,1) NOT NULL,
	[Name]               [nvarchar](50) NOT NULL,
	[CatalogDescription] [nvarchar](max) NULL,
	[ModifiedDate]       [datetime2] NOT NULL,

 CONSTRAINT [PK_ProductModel_ProductModelID] PRIMARY KEY CLUSTERED 
  (
    [ProductModelID] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],

 CONSTRAINT [AK_ProductModel_Name] UNIQUE NONCLUSTERED 
  (
    [Name] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],

)
GO

ALTER TABLE [dbo].[ProductModel] ADD CONSTRAINT [DF_ProductModel_ModifiedDate]  
  DEFAULT (getdate()) FOR [ModifiedDate]
GO
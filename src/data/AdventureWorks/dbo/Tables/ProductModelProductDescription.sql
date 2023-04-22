CREATE TABLE [dbo].[ProductModelProductDescription]
(
	[ProductModelID]       [int] NOT NULL,
	[ProductDescriptionID] [int] NOT NULL,
	[Culture]              [nchar](6) NOT NULL,
	[ModifiedDate]         [datetime2] NOT NULL,

 CONSTRAINT [PK_ProductModelProductDescription_ProductModelID_ProductDescriptionID_Culture] PRIMARY KEY CLUSTERED 
  (
    [ProductModelID] ASC,
    [ProductDescriptionID] ASC,
    [Culture] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

)
GO

ALTER TABLE [dbo].[ProductModelProductDescription]  WITH CHECK ADD  CONSTRAINT [FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID] 
  FOREIGN KEY([ProductDescriptionID])
  REFERENCES [dbo].[ProductDescription] ([ProductDescriptionID])
GO

ALTER TABLE [dbo].[ProductModelProductDescription]  WITH CHECK ADD  CONSTRAINT [FK_ProductModelProductDescription_ProductModel_ProductModelID] 
  FOREIGN KEY([ProductModelID])
  REFERENCES [dbo].[ProductModel] ([ProductModelID])
GO

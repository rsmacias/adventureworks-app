CREATE TABLE [dbo].[ProductDescription]
(
  [ProductDescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[Description]          [nvarchar](400) NOT NULL,
	[ModifiedDate]         [datetime2] NOT NULL,

 CONSTRAINT [PK_ProductDescription_ProductDescriptionID] PRIMARY KEY CLUSTERED 
 (
    [ProductDescriptionID] ASC
 ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
)

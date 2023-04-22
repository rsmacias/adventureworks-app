CREATE TABLE [dbo].[Address]
(
	[AddressID]     [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1]  [nvarchar](60) NOT NULL,
	[AddressLine2]  [nvarchar](60) NULL,
	[City]          [nvarchar](30) NOT NULL,
	[StateProvince] [nvarchar](50) NOT NULL,
	[CountryRegion] [nvarchar](50) NOT NULL,
	[PostalCode]    [nvarchar](15) NOT NULL,
	[ModifiedDate]  [datetime2] NOT NULL,

 CONSTRAINT [PK_Address_AddressID] PRIMARY KEY CLUSTERED 
  (
    [AddressID] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)
GO
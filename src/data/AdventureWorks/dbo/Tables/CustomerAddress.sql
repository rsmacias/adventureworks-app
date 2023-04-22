CREATE TABLE [dbo].[CustomerAddress]
(
  [CustomerID]   [int] NOT NULL,
	[AddressID]    [int] NOT NULL,
	[AddressType]  [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,  

  CONSTRAINT [PK_CustomerAddress_CustomerID_AddressID] PRIMARY KEY CLUSTERED 
  (
    [CustomerID] ASC,
    [AddressID] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)

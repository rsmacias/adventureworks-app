CREATE TABLE [dbo].[CustomerAddress]
(
  [CustomerID]   [int] NOT NULL,
	[AddressID]    [int] NOT NULL,
	[AddressType]  [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime2] NOT NULL,  

  CONSTRAINT [PK_CustomerAddress_CustomerID_AddressID] PRIMARY KEY CLUSTERED 
  (
    [CustomerID] ASC,
    [AddressID] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
GO

ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddress_Customer_CustomerID] 
  FOREIGN KEY([CustomerID])
  REFERENCES [dbo].[Customer] ([CustomerID])
GO

ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddress_Address_AddressID] 
  FOREIGN KEY([AddressID])
  REFERENCES [dbo].[Address] ([AddressID])
GO
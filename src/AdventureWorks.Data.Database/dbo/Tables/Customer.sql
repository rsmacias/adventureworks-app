CREATE TABLE [dbo].[Customer]
(
	[CustomerID]    [int] IDENTITY(1,1) NOT NULL,
	[NameStyle]     [bit] NOT NULL,
	[Title]         [nvarchar](8) NULL,
	[FirstName]     [nvarchar](50) NOT NULL,
	[MiddleName]    [nvarchar](50) NULL,
	[LastName]      [nvarchar](50) NOT NULL,
	[Suffix]        [nvarchar](10) NULL,
	[CompanyName]   [nvarchar](128) NULL,
	[SalesPerson]   [nvarchar](256) NULL,
	[EmailAddress]  [nvarchar](50) NULL,
	[Phone]         [nvarchar](25) NULL,
	[PasswordHash]  [varchar](128) NOT NULL,
	[PasswordSalt]  [varchar](10) NOT NULL,
	[ModifiedDate]  [datetime2] NOT NULL,
  
 CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED 
  (
	  [CustomerID] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
)
GO

ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [DF_Customer_NameStyle]  
	DEFAULT ((0)) FOR [NameStyle]
GO

ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [DF_Customer_ModifiedDate]  
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
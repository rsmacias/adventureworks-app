-- This file contains SQL statements that will be executed after the build script.

/*
 * HOW TO RUN THIS SCRIPT:
 *
 * 1. Enable full-text search on your SQL Server instance. 
 *
 * 2. Open the script inside SQL Server Management Studio and enable SQLCMD mode. 
 *    This option is in the Query menu.
 *
 * 3. Copy this script and the install files to C:\Samples\AdventureWorks, or
 *    set the following environment variable to your own data path.
 */

 :setvar SqlDatabaseProjectPath "C:\prjs\prs\GitHub\rsmacias\"
 :setvar SqlSamplesSourceDataPath "adventureworks-app\src\data\AdventureWorks\sources\"

:setvar DatabaseName "AdventureWorks"

/* Execute the script
 */

IF '$(SqlDatabaseProjectPath)' IS NULL OR '$(SqlDatabaseProjectPath)' = ''
BEGIN
	RAISERROR(N'The variable SqlDatabaseProjectPath must be defined.', 16, 127) WITH NOWAIT
	RETURN
END;


IF '$(SqlSamplesSourceDataPath)' IS NULL OR '$(SqlSamplesSourceDataPath)' = ''
BEGIN
	RAISERROR(N'The variable SqlSamplesSourceDataPath must be defined.', 16, 127) WITH NOWAIT
	RETURN
END;


-- IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'$(DatabaseName)')
--     DROP DATABASE $(DatabaseName);

-- -- If the database has any other open connections close the network connection.
-- IF @@ERROR = 3702 
--     RAISERROR('$(DatabaseName) database cannot be dropped because there are still other open connections', 127, 127) WITH NOWAIT, LOG;
-- GO


-- ****************************************
-- Delete data from Tables
-- ****************************************

PRINT '';
PRINT '*** Deleting data from [dbo].[SalesOrderDetail]';
GO

DELETE FROM [dbo].[SalesOrderDetail]
DBCC CHECKIDENT ('$(DatabaseName).[dbo].[SalesOrderDetail]', RESEED, 0)
GO


PRINT '';
PRINT '*** Deleting data from [dbo].[SalesOrderHeader]';
GO

DELETE FROM [dbo].[SalesOrderHeader]
DBCC CHECKIDENT ('$(DatabaseName).[dbo].[SalesOrderHeader]', RESEED, 0)
GO


PRINT '';
PRINT '*** Deleting data from [dbo].[CustomerAddress]';
GO

DELETE FROM [dbo].[CustomerAddress]
GO


PRINT '';
PRINT '*** Deleting data from [dbo].[Address]';
GO

DELETE FROM [dbo].[Address]
DBCC CHECKIDENT ('$(DatabaseName).[dbo].[Address]', RESEED, 0)
GO


PRINT '';
PRINT '*** Deleting data from [dbo].[Customer]';
GO

DELETE FROM [dbo].[Customer]
DBCC CHECKIDENT ('$(DatabaseName).[dbo].[Customer]', RESEED, 0)
GO


PRINT '';
PRINT '*** Deleting data from [dbo].[ProductModelProductDescription]';
GO

DELETE FROM [dbo].[ProductModelProductDescription]
GO


PRINT '';
PRINT '*** Deleting data from [dbo].[Product]';
GO

DELETE FROM [dbo].[Product]
DBCC CHECKIDENT ('$(DatabaseName).[dbo].[Product]', RESEED, 0) 
GO


PRINT '';
PRINT '*** Deleting data from [dbo].[ProductCategory]';
GO

DELETE FROM [dbo].[ProductCategory]
DBCC CHECKIDENT ('$(DatabaseName).[dbo].[ProductCategory]', RESEED, 0) 
GO


PRINT '';
PRINT '*** Deleting data from [dbo].[ProductDescription]';
GO

DELETE FROM [dbo].[ProductDescription]
DBCC CHECKIDENT ('$(DatabaseName).[dbo].[ProductDescription]', RESEED, 0) 
GO


PRINT '';
PRINT '*** Deleting data from [dbo].[ProductModel]';
GO

DELETE FROM [dbo].[ProductModel]
DBCC CHECKIDENT ('$(DatabaseName).[dbo].[ProductModel]', RESEED, 0) 
GO



-- ******************************************************
-- Load data
-- ******************************************************
PRINT '';
PRINT '*** Loading Data';
GO

PRINT 'Loading [dbo].[Address]';

BULK INSERT [dbo].[Address] FROM '$(SqlDatabaseProjectPath)$(SqlSamplesSourceDataPath)Address.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR= '\t',
    ROWTERMINATOR = '\n',
    KEEPIDENTITY,
    KEEPNULLS,
    TABLOCK
);

PRINT 'Loading [dbo].[Customer]';

BULK INSERT [dbo].[Customer] FROM '$(SqlDatabaseProjectPath)$(SqlSamplesSourceDataPath)Customer.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR='\t',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

PRINT 'Loading [dbo].[CustomerAddress]';

BULK INSERT [dbo].[CustomerAddress] FROM '$(SqlDatabaseProjectPath)$(SqlSamplesSourceDataPath)CustomerAddress.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

PRINT 'Loading [dbo].[ProductCategory]';

BULK INSERT [dbo].[ProductCategory] FROM '$(SqlDatabaseProjectPath)$(SqlSamplesSourceDataPath)ProductCategory.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

PRINT 'Loading [dbo].[ProductDescription]';

BULK INSERT [dbo].[ProductDescription] FROM '$(SqlDatabaseProjectPath)$(SqlSamplesSourceDataPath)ProductDescription.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR='\t',
    ROWTERMINATOR='\n',
    FIELDQUOTE= '"',
    KEEPIDENTITY,
    TABLOCK
);

PRINT 'Loading [dbo].[ProductModel]';

BULK INSERT [dbo].[ProductModel] FROM '$(SqlDatabaseProjectPath)$(SqlSamplesSourceDataPath)ProductModel.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    FIELDQUOTE= '"',
    KEEPIDENTITY,
    TABLOCK
);

PRINT 'Loading [dbo].[ProductModelProductDescription]';

BULK INSERT [dbo].[ProductModel] FROM '$(SqlDatabaseProjectPath)$(SqlSamplesSourceDataPath)ProductModelProductDescription.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    TABLOCK
);


PRINT 'Loading [dbo].[Product]';

BULK INSERT [dbo].[Product] FROM '$(SqlDatabaseProjectPath)$(SqlSamplesSourceDataPath)Product.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR='\t',
    ROWTERMINATOR='\n',
    FIELDQUOTE= '"',
    KEEPIDENTITY,
    TABLOCK
);

-- ******************************************************
-- Completing data seed
-- ******************************************************
PRINT '';
PRINT '*** Completing data seed';
GO

PRINT 'Loading [CatalogDescription] into [dbo].[ProductModelProductDescription]';

DECLARE @ProductModel TABLE (ProductModelID INT, CatalogDescription NVARCHAR(MAX))

INSERT INTO @ProductModel
SELECT T1.*
FROM (VALUES
(19, '[{"ProductModelID":19,"ProductModelName":"Mountain 100","Summary":"Our top-of-the-line competition mountain bike. \n \t\t\t\tPerformance-enhancing options include the innovative HL Frame, \n\t\t\t\tsuper-smooth front suspension, and traction for all terrain.\n                        ","Manufacturer":{"Name":"AdventureWorks","CopyrightURL":null,"CopyRight":"2002","ProductURL":"HTTP:\/\/www.Adventure-works.com"},"Picture":{"Name":null,"Angle":"front","Size":"small","ProductPhotoID":118},"Specifications":{"Material":"Almuminum Alloy","Color":"Available in most colors","ProductLine":"Mountain bike","Style":"Unisex","RiderExperience":"Advanced to Professional riders"},"Features":{"Warranty":{"WarrantyPeriod":"3 years","Description":"parts and labor"},"Maintenance":{"NoOfYears":"10 years","Description":"maintenance contract available through your dealer or any AdventureWorks retail store."},"handlebar":null,"wheel":"High performance wheels.","saddle":"Anatomic design and made from durable leather for a full-day of riding in comfort.","pedal":"Top-of-the-line clipless pedals with adjustable tension.","BikeFrame":"Each frame is hand-crafted in our Bothell facility to the optimum diameter \n\t\t\t\tand wall-thickness required of a premium mountain frame. \n\t\t\t\tThe heat"}}]'),
(23, '[{"ProductModelID":23,"ProductModelName":"Mountain-500","Summary":"Suitable for any type of riding, on or off-road. \n\t\t\tFits any budget. Smooth-shifting with a comfortable ride.\n                        ","Manufacturer":{"Name":"AdventureWorks","CopyrightURL":null,"CopyRight":"2002","ProductURL":"HTTP:\/\/www.Adventure-works.com"},"Picture":{"Name":null,"Angle":"front","Size":"small","ProductPhotoID":1},"Specifications":{"Material":"Aluminum Alloy","Color":"Available in all colors.","ProductLine":"Mountain bike","Style":"Unisex","RiderExperience":"Novice to Intermediate riders"},"Features":{"Warranty":{"WarrantyPeriod":"1 year","Description":"parts and labor"},"Maintenance":{"NoOfYears":"3 years","Description":"maintenance contact available through dealer"},"handlebar":null,"wheel":"Stable, durable wheels suitable for novice riders.","saddle":"Made from synthetic leather and features gel padding for increased comfort.","pedal":"Expanded platform so you can ride in any shoes; great for all-around riding.","BikeFrame":"Our best value frame utilizing the same, ground-breaking technology as the ML aluminum frame."}}]'),
(25, '[{"ProductModelID":25,"ProductModelName":"Road-150","Summary":"This bike is ridden by race winners. Developed with the \n\t\t\tAdventure Works Cycles professional race team, it has a extremely light \n\t\t\theat-treated aluminum frame, and steering that allows precision control.\n                        ","Manufacturer":{"Name":"AdventureWorks","CopyrightURL":null,"CopyRight":"2002","ProductURL":"HTTP:\/\/www.Adventure-works.com"},"Picture":{"Name":null,"Angle":"front","Size":"small","ProductPhotoID":126},"Specifications":{"Material":"Aluminum","Color":"Available in all colors.","ProductLine":"Road bike","Style":"Unisex","RiderExperience":"Intermediate to Professional riders"},"Features":{"Warranty":{"WarrantyPeriod":"4 years","Description":"parts and labor"},"Maintenance":{"NoOfYears":"7 years","Description":"maintenance contact available through dealer or any Adventure Works Cycles retail store."},"handlebar":"Designed for racers; high-end anatomically shaped ","wheel":"Strong wheels with double-walled rims.","saddle":"Lightweight  kevlar racing saddle.","pedal":"Top-of-the-line clipless pedals with adjustable tension.","BikeFrame":"Our lightest and best quality  aluminum frame made from the newest alloy;\n\t\t\tit is welded and heat-treated for strength. \n\t\t\tOur innovative design res"}}]'),
(28, '[{"ProductModelID":28,"ProductModelName":"Road-450","Summary":"A true multi-sport bike that offers streamlined riding and a revolutionary design. \n\t\t\t       Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.\n                        ","Manufacturer":{"Name":"AdventureWorks","CopyrightURL":null,"CopyRight":"2002","ProductURL":"HTTP:\/\/www.Adventure-works.com"},"Picture":{"Name":null,"Angle":"front","Size":"small","ProductPhotoID":111},"Specifications":{"Material":"Aluminum Alloy","Color":"Available in all colors.","ProductLine":"Road bike","Style":"Unisex","RiderExperience":"Novice to Advanced riders"},"Features":{"Warranty":{"WarrantyPeriod":"1 year","Description":"parts and labor"},"Maintenance":{"NoOfYears":"5 years","Description":"maintenance contact available through dealer"},"handlebar":"Incredibly strong professional grade handlebar.","wheel":"Aluminum alloy rim with stainless steel spokes; bu","saddle":"Comfortable saddle with bump absorping rubber bumpers.","pedal":"Top-of-the-line clipless pedals with adjustable tension.","BikeFrame":"aluminum alloy  frame\n                     and features a lightweight down-tube milled to the perfect diameter for optimal strength."}}]'),
(34, '[{"ProductModelID":34,"ProductModelName":"Touring-1000","Summary":"Travel in style and comfort. Designed for maximum comfort and safety. \n\t\t\tWide gear range takes on all hills. High-tech aluminum alloy construction provides durability without added weight.\n                        ","Manufacturer":{"Name":"AdventureWorks","CopyrightURL":null,"CopyRight":"2002","ProductURL":"HTTP:\/\/www.Adventure-works.com"},"Picture":{"Name":null,"Angle":"front","Size":"small","ProductPhotoID":87},"Specifications":{"Material":"Aluminum alloy ","Color":"Available in most colors.","ProductLine":"Touring bike","Style":"Unisex","RiderExperience":"Novice to Advanced riders"},"Features":{"Warranty":{"WarrantyPeriod":"1 year","Description":"parts and labor"},"Maintenance":{"NoOfYears":"5 years","Description":"maintenance contact available through dealer"},"handlebar":"A light yet stiff aluminum bar for long distance r","wheel":"Excellent aerodynamic rims guarantee a smooth ride","saddle":"Cut-out shell  for a more comfortable ride.","pedal":"A stable pedal for all-day riding.","BikeFrame":"aluminum alloy  frame\n                     and features a lightweight down-tube milled to the perfect diameter for optimal strength."}}]'),
(35, '[{"ProductModelID":35,"ProductModelName":"Touring-2000","Summary":"The plush custom saddle keeps you riding all day, and there''s plenty of space\n\t\t\t to add panniers and bike bags to the newly-redesigned carrier. \n\t\t\t\tThis bike has great stability when fully-loaded.\n                        ","Manufacturer":{"Name":"AdventureWorks","CopyrightURL":null,"CopyRight":"2002","ProductURL":"HTTP:\/\/www.Adventure-works.com"},"Picture":{"Name":null,"Angle":"front","Size":"small","ProductPhotoID":87},"Specifications":{"Material":"Aluminum","Color":"Available in all colors except metallic.","ProductLine":"Touring bike","Style":"Men''s","RiderExperience":"Intermediate to Advanced riders"},"Features":{"Warranty":{"WarrantyPeriod":"1 year","Description":"parts and labor"},"Maintenance":{"NoOfYears":"5 years","Description":"maintenance contact available through dealer"},"handlebar":"A light yet stiff aluminum bar for long distance r","wheel":null,"saddle":"New design  relieves pressure for long rides.","pedal":"Top-of-the-line clipless pedals with adjustable tension.","BikeFrame":"The aluminum frame is custom-shaped for both good looks and strength; \n\t\t\t\tit will withstand the most rigorous challenges of daily riding."}}]')
) AS T1 (ProductModelID, CatalogDescription)


UPDATE PM
SET PM.[CatalogDescription] = JSON_QUERY(TMP.CatalogDescription)
FROM [dbo].[ProductModel] PM INNER JOIN @ProductModel TMP ON PM.[ProductModelID] = TMP.[ProductModelID]
GO


PRINT 'Loading [ThumbNailPhoto] into [dbo].[Product]';

--DECLARE @Product TABLE (ProductID INT, ThumbnailPhotoFileName NVARCHAR(MAX), ThumbNailPhoto NVARCHAR(MAX))
CREATE TABLE ##TmpProduct (
    ProductID INT, 
    ThumbnailPhotoFileName NVARCHAR(MAX), 
    ThumbNailPhoto NVARCHAR(MAX)
)

BULK INSERT ##TmpProduct FROM '$(SqlDatabaseProjectPath)$(SqlSamplesSourceDataPath)ProductPhotos.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    FIELDQUOTE= '"',
    TABLOCK
);

UPDATE P
SET P.[ThumbnailPhotoFileName] = TMP.ThumbnailPhotoFileName,
    P.[ThumbNailPhoto] = CONVERT( VARBINARY(MAX), 
                                  CAST('' AS XML).value('xs:base64Binary(sql:column("TMP.ThumbNailPhoto"))', 'VARBINARY(MAX)') ) -- From Base64 to VARBINARY(MAX)
FROM [dbo].[Product] P INNER JOIN ##TmpProduct TMP ON P.[ProductID] = TMP.[ProductID]
GO

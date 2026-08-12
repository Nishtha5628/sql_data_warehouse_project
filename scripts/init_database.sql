/* 
CREATE DB and Schemas

SCRIPT Purpose:
	this script creates a new db named 'datawarehouse' after checking if it already exists.
	if the db exists, it is dropped and recreated. Additionally, the script sets up three schemas
	within the db: bronze, silver and gold.

WARNING:
	Running this script will drop the entire 'DataWarehouse' db if it exists.
	All data in the db will be permanently deleted. Proceed with caution and ensure 
	you have proper backups before running this script.

*/

-- Create DB 'DataWarehouse'

USE master;
GO

-- Drop and recreate the 'DataWarehouse' db
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' db
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

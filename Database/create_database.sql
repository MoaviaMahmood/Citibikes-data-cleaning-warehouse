USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'citibikes')
BEGIN
    ALTER DATABASE citibikes SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE citibikes;
END;
GO

-- Create the 'citibikes' database
CREATE DATABASE citibikes;
GO

USE citibikes;
GO


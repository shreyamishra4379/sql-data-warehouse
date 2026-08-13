/* =============================================================
   DATA WAREHOUSE - DATABASE INITIALIZATION
   =============================================================
   Creates the DataWarehouse database and the three layers:
   Bronze  -> Raw data
   Silver  -> Cleaned and transformed data
   Gold    -> Business-ready data

   NOTE:
   The database is recreated only when a fresh setup is required.
   Existing data will be removed during a reset.
   ============================================================= */

USE master;
GO

-- Check whether the warehouse already exists
IF DB_ID('DataWarehouse') IS NOT NULL
BEGIN
    ALTER DATABASE DataWarehouse
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE DataWarehouse;
END;
GO

-- Create the warehouse database
CREATE DATABASE DataWarehouse;
GO

-- Start working inside the warehouse
USE DataWarehouse;
GO

-- Set up the data warehouse layers
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

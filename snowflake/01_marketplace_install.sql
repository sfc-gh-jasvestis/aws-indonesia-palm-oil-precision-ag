-- ============================================================================
-- 01_MARKETPLACE_INSTALL.SQL — Install marketplace data for Precision Agriculture Analytics
-- ============================================================================
USE DATABASE PALM_OIL_PRECISION_AG;
USE SCHEMA RAW;

-- Free listings to install from Snowflake Marketplace:
-- Install: Snowflake Public Data (Free)
--   https://app.snowflake.com/marketplace/listing/GZTSZ290BV255

-- Paid listing (mock): Tomorrow.io Weather Data
--   Real data: https://app.snowflake.com/marketplace/listing/GZT0Z27KFSQ
--   Using mock table: IOT_SENSORS
CREATE TABLE IF NOT EXISTS RAW.IOT_SENSORS (
  ID INT AUTOINCREMENT, DATA VARIANT, LOADED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);


-- ============================================================================
-- 04_DYNAMIC_TABLES.SQL — Curated layer for Precision Agriculture Analytics
-- ============================================================================
USE DATABASE PALM_OIL_PRECISION_AG;
USE SCHEMA CURATED;

-- BLOCK_YIELD_PERFORMANCE: Per-block yield vs potential with gap analysis
-- Source: BLOCKS, HARVEST_RECORDS
CREATE OR REPLACE DYNAMIC TABLE CURATED.BLOCK_YIELD_PERFORMANCE
  TARGET_LAG = '5 minutes'
  WAREHOUSE = PRECISION_AG_WH
AS
SELECT * FROM RAW.BLOCKS;
-- TODO: Replace with actual join/aggregation logic per demo

-- SOIL_NUTRIENT_STATUS: Current soil nutrient levels and deficiency flags per block
-- Source: IOT_SENSORS, BLOCKS
CREATE OR REPLACE DYNAMIC TABLE CURATED.SOIL_NUTRIENT_STATUS
  TARGET_LAG = '5 minutes'
  WAREHOUSE = PRECISION_AG_WH
AS
SELECT * FROM RAW.IOT_SENSORS;
-- TODO: Replace with actual join/aggregation logic per demo

-- HARVEST_FORECAST_INPUT: Time series preparation for ML.FORECAST yield prediction
-- Source: HARVEST_RECORDS, IOT_SENSORS
CREATE OR REPLACE DYNAMIC TABLE CURATED.HARVEST_FORECAST_INPUT
  TARGET_LAG = '5 minutes'
  WAREHOUSE = PRECISION_AG_WH
AS
SELECT * FROM RAW.HARVEST_RECORDS;
-- TODO: Replace with actual join/aggregation logic per demo

-- FERTILIZER_ROI: Fertilizer application effectiveness and yield response
-- Source: FERTILIZER_APPLICATIONS, HARVEST_RECORDS, BLOCKS
CREATE OR REPLACE DYNAMIC TABLE CURATED.FERTILIZER_ROI
  TARGET_LAG = '5 minutes'
  WAREHOUSE = PRECISION_AG_WH
AS
SELECT * FROM RAW.FERTILIZER_APPLICATIONS;
-- TODO: Replace with actual join/aggregation logic per demo


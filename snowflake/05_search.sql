-- ============================================================================
-- 05_SEARCH.SQL — Cortex Search for Precision Agriculture Analytics
-- ============================================================================
USE DATABASE PALM_OIL_PRECISION_AG;
USE SCHEMA SEARCH;

CREATE OR REPLACE CORTEX SEARCH SERVICE SEARCH.AGRONOMIST_DOCS_SEARCH
  ON CONTENT
  ATTRIBUTES DOC_TYPE, BLOCK_ID, REGION
  WAREHOUSE = PRECISION_AG_WH
  TARGET_LAG = '1 hour'
AS (
  SELECT * FROM RAW.AGRONOMIST_DOCS
);

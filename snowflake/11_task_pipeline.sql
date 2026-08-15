-- ============================================================================
-- 11_TASK_PIPELINE.SQL — Task DAG for Precision Agriculture Analytics
-- ============================================================================
USE DATABASE PALM_OIL_PRECISION_AG;
USE SCHEMA APP;

CREATE OR REPLACE TASK APP.TASK_INGEST_IOT
  WAREHOUSE = PRECISION_AG_WH
  SCHEDULE = 'USING CRON 0 */4 * * * UTC'
  COMMENT = 'Ingest latest IoT sensor readings from plantation blocks'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_FORECAST_YIELD
  WAREHOUSE = PRECISION_AG_WH
  AFTER APP.TASK_INGEST_IOT
  COMMENT = 'Run ML.FORECAST on FFB yield per block'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_GENERATE_RECOMMENDATIONS
  WAREHOUSE = PRECISION_AG_WH
  AFTER APP.TASK_FORECAST_YIELD
  COMMENT = 'Generate AI agronomist recommendations for underperforming blocks'
AS
  SELECT 1; -- Replace with actual refresh logic

ALTER TASK APP.TASK_GENERATE_RECOMMENDATIONS RESUME;
ALTER TASK APP.TASK_FORECAST_YIELD RESUME;
ALTER TASK APP.TASK_INGEST_IOT RESUME;

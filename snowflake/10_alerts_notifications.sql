-- ============================================================================
-- 10_ALERTS_NOTIFICATIONS.SQL — Alerts for Precision Agriculture Analytics
-- ============================================================================
USE DATABASE PALM_OIL_PRECISION_AG;
USE SCHEMA APP;

-- Notification integration (email)
CREATE OR REPLACE NOTIFICATION INTEGRATION aws_indonesia_palm_oil_precision_ag_EMAIL_INT
  TYPE = EMAIL
  ENABLED = TRUE
  ALLOWED_RECIPIENTS = ('jonathan.asvestis@snowflake.com');

-- Alert: YIELD_GAP_ALERT
CREATE OR REPLACE ALERT APP.YIELD_GAP_ALERT
  WAREHOUSE = PRECISION_AG_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Block yield significantly below potential — intervention needed'
IF (EXISTS (
  SELECT 1 FROM CURATED.BLOCK_YIELD_PERFORMANCE
  WHERE 1=1 -- Condition: Block yield below 70% of potential for 3 consecutive months
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_indonesia_palm_oil_precision_ag_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Precision Agriculture Analytics: Block yield significantly below potential — intervention needed',
    'Block yield significantly below potential — intervention needed'
  );

ALTER ALERT APP.YIELD_GAP_ALERT RESUME;

-- Alert: NUTRIENT_DEFICIENCY_ALERT
CREATE OR REPLACE ALERT APP.NUTRIENT_DEFICIENCY_ALERT
  WAREHOUSE = PRECISION_AG_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Nutrient deficiency detected — fertilizer application recommended'
IF (EXISTS (
  SELECT 1 FROM CURATED.BLOCK_YIELD_PERFORMANCE
  WHERE 1=1 -- Condition: Soil potassium or magnesium below critical threshold
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_indonesia_palm_oil_precision_ag_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Precision Agriculture Analytics: Nutrient deficiency detected — fertilizer application recommended',
    'Nutrient deficiency detected — fertilizer application recommended'
  );

ALTER ALERT APP.NUTRIENT_DEFICIENCY_ALERT RESUME;


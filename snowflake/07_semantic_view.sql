-- ============================================================================
-- 07_SEMANTIC_VIEW.SQL — Semantic View for Precision Agriculture Analytics
-- ============================================================================
USE DATABASE PALM_OIL_PRECISION_AG;
USE SCHEMA APP;

CREATE OR REPLACE SEMANTIC VIEW APP.PRECISION_AG_ANALYTICS
  COMMENT = 'Plantation yield, soil health, fertilizer, and harvest analytics'
AS
  TABLES (
    CURATED.BLOCK_YIELD_PERFORMANCE AS block_yield_performance,CURATED.SOIL_NUTRIENT_STATUS AS soil_nutrient_status,CURATED.HARVEST_FORECAST_INPUT AS harvest_forecast_input,CURATED.FERTILIZER_ROI AS fertilizer_roi
  );

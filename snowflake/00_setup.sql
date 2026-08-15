-- ============================================================================
-- Precision Agriculture Analytics
-- IoT-driven precision agriculture for Indonesian palm oil estates — ML.FORECAST predicts FFB yield per block, Dynamic Tables build real-time harvest dashboards, and Cortex AI generates agronomist recommendations.
-- ============================================================================
USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS PALM_OIL_PRECISION_AG;
CREATE WAREHOUSE IF NOT EXISTS PRECISION_AG_WH WAREHOUSE_SIZE = 'MEDIUM' AUTO_SUSPEND = 120 AUTO_RESUME = TRUE;
USE DATABASE PALM_OIL_PRECISION_AG;
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS CURATED;
CREATE SCHEMA IF NOT EXISTS ML;
CREATE SCHEMA IF NOT EXISTS AI;
CREATE SCHEMA IF NOT EXISTS SEARCH;
CREATE SCHEMA IF NOT EXISTS APP;

USE WAREHOUSE PRECISION_AG_WH;

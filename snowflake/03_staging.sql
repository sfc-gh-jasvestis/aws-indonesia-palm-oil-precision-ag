-- ============================================================================
-- 03_STAGING.SQL — Generate synthetic data for Precision Agriculture Analytics
-- Country: INDONESIA | Currency: IDR
-- ============================================================================
USE DATABASE PALM_OIL_PRECISION_AG;
USE SCHEMA RAW;

-- Data generation scripts are demo-specific.
-- See the handcrafted SQL in the aws-malaysia-semiconductor-yield demo for
-- the full pattern: GENERATOR + UNIFORM + LATERAL for distribution,
-- Cortex Complete for text generation, engineered key demo numbers.

-- Target row counts:
-- BLOCKS: 800 rows — Plantation blocks with area, palm age, soil type, and GPS boundaries
-- IOT_SENSORS: 500,000 rows — Soil moisture, nutrient, and weather sensor readings from 800 blocks
-- HARVEST_RECORDS: 200,000 rows — Daily FFB harvest weights by block and harvester team
-- FERTILIZER_APPLICATIONS: 50,000 rows — Fertilizer type, quantity, and timing per block per round
-- PEST_DISEASE_REPORTS: 5,000 rows — Field scouting reports on pest and disease incidence
-- AGRONOMIST_DOCS: 100 rows — Agronomist field notes, soil analysis reports, and replanting studies

# Demo Script: Precision Agriculture Analytics
## ~4-Minute Recorded Walkthrough
**Format**: Screen recording with voiceover
**Target**: Customer meeting / booth loop / social share
**Narrative**: "Snowflake delivers precision agriculture at plantation scale — IoT soil/weather data feeds Dynamic Tables, ML.FORECAST projects FFB yield by block, and Cortex AI generates targeted fertilizer and harvest recommendations"
**Demo Mode**: Open app with `?demo=true` for presenter notes

---

## Two Personas

| Persona | Role | Tool | What they care about |
|---|---|---|---|
| **Ir. Agus Purnomo** | VP Plantation Operations | React App (SPCS) | Yield optimization, fertilizer ROI, harvest scheduling, replanting decisions |
| **Dewi Kartika** | Estate Agronomist | Amazon QuickSight | Soil nutrient levels, pest disease incidence, weather impact on harvest, fertilizer timing |

---

## What's Built

| Layer | Component | Detail |
|---|---|---|
| **RAW** | 6 tables | BLOCKS (800), IOT_SENSORS (500000), HARVEST_RECORDS (200000), FERTILIZER_APPLICATIONS (50000), PEST_DISEASE_REPORTS (5000), AGRONOMIST_DOCS (100) |
| **CURATED** | 4 Dynamic Tables | BLOCK_YIELD_PERFORMANCE, SOIL_NUTRIENT_STATUS, HARVEST_FORECAST_INPUT, FERTILIZER_ROI |
| **ML** | ML.FORECAST + ML.ANOMALY_DETECTION | Forecasting + anomaly detection |
| **AI** | COMPLETE, SUMMARIZE, AI_CLASSIFY | Classification + extraction |
| **Search** | Cortex Search | 100 documents indexed |
| **Agent** | PRECISION_AG_AGENT | Semantic View + Search tools |


---

## The Story

An Indonesian palm oil group manages 800 blocks across 45,000 hectares, but yields average 15% below genetic potential. IoT sensors detect nutrient deficiencies and weather impacts in real time, but translating sensor data into agronomist decisions requires ML prediction and AI-generated recommendations at block level. The Rp 89 billion yield gap is the target.

---

## Script

### [0:00–0:45] ESTATE OVERVIEW

**Show**: Estate Overview tab

> "Eight hundred blocks across 45,000 hectares in North Sumatra and Central Kalimantan."

**Action**: Point at 22.4t/ha yield KPI vs 26.3t potential

### [0:45–1:30] BLOCK ANALYTICS

**Show**: Block Analytics tab

> "Block K-12 in Central Kalimantan: 16.8t/ha vs 24.1t potential — potassium deficiency detected."

**Action**: Click Block K-12 for detail

### [1:30–2:15] YIELD FORECAST

**Show**: Yield Forecast tab

> "ML.FORECAST projects FFB yield for each of 800 blocks — 90-day forward view."

**Action**: Show estate-wide forecast chart

### [2:15–3:00] ASK AI

**Show**: Ask AI tab

> "Agus asks: 'Which blocks are underperforming their yield potential?'"

**Action**: Type yield question

### [3:00–3:45] ARCHITECTURE & DATA

**Show**: Architecture & Data tab

> "Six Snowflake capabilities, six AWS services in the dual-build architecture."

**Action**: Walk through architecture diagram


---

## Key Demo Differentiators

1. **ML.FORECAST on FFB yield per block** — Only demo using ML.FORECAST for palm oil fresh fruit bunch yield prediction
2. **IoT sensor ingestion via Snowpipe Streaming** — Only demo ingesting real-time soil and weather IoT data for plantation analytics
3. **AI-generated agronomist recommendations** — Cortex AI produces block-level fertilizer and intervention recommendations
4. **Indonesian palm oil estate context** — 45,000 hectares with realistic Indonesian estate operations and Rupiah economics
5. **Fertilizer ROI analysis** — Dynamic Tables correlate fertilizer applications with yield response for ROI calculation


---

## Demo Prep Checklist

### Data Verification
- [ ] `SELECT COUNT(*) FROM PALM_OIL_PRECISION_AG.RAW.BLOCKS` → 800
- [ ] `SELECT COUNT(*) FROM PALM_OIL_PRECISION_AG.RAW.IOT_SENSORS` → 500000
- [ ] `SELECT COUNT(*) FROM PALM_OIL_PRECISION_AG.RAW.HARVEST_RECORDS` → 200000

### ML Model Verification
- [ ] `SELECT COUNT(*) FROM PALM_OIL_PRECISION_AG.ML.FFB_YIELD_FORECAST_RESULTS` → >0
- [ ] `SELECT COUNT(*) FROM PALM_OIL_PRECISION_AG.ML.YIELD_ANOMALY_RESULTS WHERE IS_ANOMALY = TRUE` → >=23

### AI/Agent Verification
- [ ] `SELECT COUNT(*) FROM PALM_OIL_PRECISION_AG.AI.BLOCK_CLASSIFICATION` → 800


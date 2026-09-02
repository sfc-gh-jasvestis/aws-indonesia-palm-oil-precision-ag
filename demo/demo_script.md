# Precision Agriculture Analytics

**Indonesia - Palm Oil & Agriculture**
Use case: Precision Agriculture

> IoT-driven precision agriculture for Indonesian palm oil estates — ML.FORECAST predicts FFB yield per block, Dynamic Tables build real-time harvest dashboards, and Cortex AI generates agronomist recommendations.

## Why Snowflake

Snowflake delivers precision agriculture at plantation scale — IoT soil/weather data feeds Dynamic Tables, ML.FORECAST projects FFB yield by block, and Cortex AI generates targeted fertilizer and harvest recommendations

- **ML.FORECAST on FFB yield per block** - Only demo using ML.FORECAST for palm oil fresh fruit bunch yield prediction
- **IoT sensor ingestion via Snowpipe Streaming** - Only demo ingesting real-time soil and weather IoT data for plantation analytics
- **AI-generated agronomist recommendations** - Cortex AI produces block-level fertilizer and intervention recommendations
- **Indonesian palm oil estate context** - 45,000 hectares with realistic Indonesian estate operations and Rupiah economics
- **Fertilizer ROI analysis** - Dynamic Tables correlate fertilizer applications with yield response for ROI calculation

## What is deployed

| | |
|---|---|
| Database | `ID_PALM_OIL_PRECISION_AG` |
| Service | `ID_PALM_OIL_PRECISION_AG_APP` |
| Compute pool | `SEA_DEMOS_INDONESIA_POOL` |
| Dimension table | `RAW.AGRONOMIST_DOCS` (20 rows) |
| Fact table | `RAW.IOT_SENSORS` (250,000 rows, 90 days) |
| Curated layer | `CURATED.PERFORMANCE_SUMMARY`, `CURATED.TREND_ANALYSIS`, `CURATED.KPI_SUMMARY` |
| Currency | IDR (Rp) |

Regions in play: Jakarta, North Sumatra, Riau, East Kalimantan, Sulawesi
Segments: Immature Palm, Prime Mature, Late Mature, Replanting Due

Dynamic tables are created suspended and refreshed on demand:

```bash
./refresh_demo_data.sh ID_PALM_OIL_PRECISION_AG
```

## KPI cards

Every card below is served live from `CURATED.KPI_SUMMARY`. The app keeps the
original literal as a fallback, so it still renders if Snowflake is unreachable.

| Card | Value | Backed by |
|---|---|---|
| FFB Yield (Avg) | `24.2 T/ha` | average per event |
| Fertilizer Efficiency | `84%` | average per event |
| Replanting Target | `12K ha` | total across Agronomist Docs |
| Estates Monitored | `847` | total across Agronomist Docs |
| OER Rate | `22.4%` | average per event |
| Harvest Interval | `12 days` | average per event |
| Palm Age (Avg) | `14 yrs` | average per event |


## Demo flow

1. Estate Overview
2. Block Analytics
3. Yield Forecast
4. Ask AI
5. Architecture & Data

## Talking points

- **800 blocks** - across 45,000 hectares in North Sumatra and Central Kalimantan
- **22.4 t/ha** - average FFB yield (15% below 26.3t potential)
- **500,000 readings** - IoT sensor data points from soil and weather sensors
- **Rp 89B** - revenue opportunity from closing yield gap
- **23 blocks** - predicted to decline without intervention

## Business impact

- Indonesia has 16.4 million hectares of oil palm plantation — largest in the world (BPS Indonesia)
- Precision agriculture can increase palm oil yields by 15-25% through targeted interventions (World Resources Institute)
- IoT-enabled plantation monitoring reduces fertilizer waste by 20-30% (McKinsey Agriculture)
- Indonesian palm oil industry contributes 4.5% of GDP and employs 16 million people (GAPKI)

---
Generated from `generator/demo_specs/aws-indonesia-palm-oil-precision-ag.json`. Do not hand-edit: run
`python3 generator/gen_repo_docs.py aws-indonesia-palm-oil-precision-ag` instead.

# Indonesia Oil Palm Precision Agriculture

**Indonesia - Oil Palm Plantations**
Use case: Block agronomy and crop-loss risk

> Precision agriculture for a fictional oil palm grower with 30 synthetic blocks on estates near 4 Indonesian cities: dynamic tables, a holdout-evaluated crop-loss risk classifier, an FFB harvest forecast and grounded AI answers. Thresholds are internal demo thresholds, not agronomic standards.

## Why Snowflake

- **Dynamic tables** reconcile ripe bunch rate, crop-loss events, fertilizer intensity and sensor uptime from RAW block data, with checks in `run_core.py`
- **Crop-loss risk classification** gives a holdout-evaluated next-7-day crop-loss probability per block
- **FFB harvest forecast** projects 14 days of grower-wide FFB tonnes with prediction intervals
- **Grounded AI**: the Cortex Agent (Analyst over a semantic view, plus Search over SOPs) shows its SQL and SOP citations
- **Live telemetry**: a native simulator (Snowflake only) or IoT Core, S3 and Snowpipe (AWS build), then an alert and email

## What is built

| | |
|---|---|
| Dimension table | `RAW.BLOCKS` (30 rows) |
| Fact table | `RAW.BLOCK_DAILY` (2,700 block-days, 90 days) |
| Curated layer | `CURATED.KPI_SUMMARY`, `PERFORMANCE_SUMMARY`, `CROP_LOSS_CAUSES`, `TREND_ANALYSIS` |
| ML | `ML.CROP_LOSS_RISK_SCORES`, `ML.CROP_LOSS_RISK_HOLDOUT_METRICS`, `ML.FFB_FORECAST`, `ML.MOISTURE_ANOMALIES` |

Regions: Pekanbaru, Medan, Jambi, Palangka Raya.
Block categories: Young Mature, Prime Mature, Old Mature, Peat Block, Lowland Block.

## KPI cards (live from `CURATED.KPI_SUMMARY`; no fallback values)

| Card | Value from the seeded data |
|---|---|
| Ripe Bunch Rate | 87.7% |
| Crop-Loss Events | 447 |
| Fertilizer Intensity | 67.0 kg/t FFB |
| FFB Harvested (t) | 5,214 |
| Sensor Network Uptime | 97.8% |
| Blocks Monitored | 30 |
| Sensor Mapping Coverage | 50.6% |
| Pest Alerts | 84 |

Values are synthetic. A rebuild reproduces them because the data is HASH-seeded; dates are relative to the build day.

## Demo flow

1. Executive Cockpit: KPIs, daily ripe bunch rate, unripe bunches by crop-loss cause, block table
2. Predictive: holdout metrics, risk bands, 14-day FFB harvest forecast, soil moisture deficit anomalies
3. Block Health: sensor network uptime, sensor mapping coverage, scouting completion against ripe bunch rate, then generate the action memo
4. Live IoT: run `CALL APP.SIMULATE_TELEMETRY(20)` (Snowflake only) or `python aws/publish_telemetry.py --count 20` (AWS build). Then run `EXECUTE ALERT APP.LIVE_ALARM_ALERT` and show the alert log and email.
5. Ask AI: the Cortex Agent answers metric questions through the semantic view and cites SOPs from Cortex Search. The SQL is shown.
6. QuickSight (AWS build): the same Snowflake tables through DIRECT_QUERY
7. Architecture: both builds side by side

## Talking points

- Per-block ripe bunch rate ranges from 80.3% to 90.9%. Palangka Raya is the lowest region, at 87.0%.
- Water table drawdown leaves the most bunches unripe of the 13 crop-loss causes.
- Young Mature blocks carry the highest fertilizer intensity (81.5 kg/t FFB in the synthetic rates); Prime Mature blocks are lowest at 55.4 kg/t.
- The risk model is evaluated on a time-based holdout: precision 0.56 and recall 0.66 at 0.5, against a 0.48 base rate. Present it as triage, not a guarantee.
- The Pekanbaru dry spell and Palangka Raya flash flood events are excluded from crop-loss labels, because they are regional events, not block-driven.
- No figure is a field recommendation; all thresholds are internal to the demo.

## Business impact

Use only the sourced references in `README.md` (Business Impact).

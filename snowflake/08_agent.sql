-- ============================================================================
-- 08_AGENT.SQL — Cortex Agent for Precision Agriculture Analytics
-- ============================================================================
USE DATABASE PALM_OIL_PRECISION_AG;
USE SCHEMA APP;

CREATE OR REPLACE CORTEX AGENT APP.PRECISION_AG_AGENT
  COMMENT = 'Precision Agriculture Analytics AI Assistant'
  MODEL = 'claude-opus-4-8'
  TOOLS = (
    SEMANTIC_VIEW_TOOL(SEMANTIC_VIEW => 'PALM_OIL_PRECISION_AG.APP.PRECISION_AG_ANALYTICS'),    CORTEX_SEARCH_TOOL(CORTEX_SEARCH_SERVICE => 'PALM_OIL_PRECISION_AG.SEARCH.AGRONOMIST_DOCS_SEARCH', TOOL_DESCRIPTION => 'Search documents for Palm Oil & Agriculture information')
  )
  SYSTEM_PROMPT = 'You are the Precision Agriculture Agent for an Indonesian palm oil estate managing 800 blocks across North Sumatra and Central Kalimantan, optimizing FFB yield through data-driven agronomic decisions.';

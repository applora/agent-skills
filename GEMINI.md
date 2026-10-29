# Applora research skills

Use the configured remote MCP server at `https://api.applora.ai/mcp`.
For a new connection, call `get_research_status` before paid data queries. If a
prepared research ID is supplied, read `get_research_brief` first and preserve its
selected scope, language, context and report-saving preference.

Choose only the workflow relevant to the user’s question:

- Research setup, reports and continuation: `skills/run-shopify-app-research/SKILL.md`
- Market opportunities: `skills/research-shopify-market-opportunities/SKILL.md`
- Merchant reviews: `skills/analyze-shopify-app-reviews/SKILL.md`
- Competitor comparison: `skills/analyze-shopify-app-competitors/SKILL.md`
- Keywords and ASO: `skills/optimize-shopify-app-aso/SKILL.md`
- Pricing and packaging: `skills/design-shopify-app-pricing/SKILL.md`
- Developer partners and agency prospects: `skills/research-shopify-developers/SKILL.md`
- Saved-target follow-up: `skills/review-shopify-watchlist/SKILL.md`
- Public merchant signals: `skills/find-shopify-store-leads/SKILL.md`

Each skill is self-contained; do not read all workflows by default. Applora provides
data and workspace storage; you perform the research. Lists are bounded to 10 items.
Indexed and live data queries cost credits; report/context/template/brief operations
do not. Follow returned pagination rather than inventing cursors or source pages.
Respect Pro-only history/contact access. Save only when requested or selected in
the brief, return the successful workspace link, and do not publish automatically.

# Applora Agent Skills

Six focused skills that turn live and historical Shopify App Store data into
specific decisions. Each skill uses [Applora](https://applora.ai)'s remote MCP
server instead of asking an agent to guess from training data.

## Skills

| Skill | Decision it supports |
|---|---|
| [`research-shopify-market-opportunities`](skills/research-shopify-market-opportunities/) | Which market gap is worth building for? |
| [`optimize-shopify-app-aso`](skills/optimize-shopify-app-aso/) | Which keywords and listing experiments can improve discovery? |
| [`analyze-shopify-app-reviews`](skills/analyze-shopify-app-reviews/) | What do merchants value, request, and repeatedly complain about? |
| [`analyze-shopify-app-competitors`](skills/analyze-shopify-app-competitors/) | Where are competitors strong, weak, or vulnerable? |
| [`design-shopify-app-pricing`](skills/design-shopify-app-pricing/) | How should an app package and price its value? |
| [`find-shopify-store-leads`](skills/find-shopify-store-leads/) | Which stores show relevant public intent signals? |

Every skill requests focused, bounded tool results to keep research fast and
token-efficient. Market facts, rankings, pricing, and review findings must be
verified through MCP before the agent uses them in a recommendation.

## Install

Install the complete collection:

```bash
npx skills add https://github.com/applora/agent-skills
```

Or install one focused workflow:

```bash
npx skills add https://github.com/applora/agent-skills --skill analyze-shopify-app-reviews
```

Replace the skill name with any entry in the table above.

### Plugin and extension clients

**Claude Code**

```bash
claude plugin marketplace add applora/agent-skills
claude plugin install applora@applora-skills
```

**OpenAI Codex**

```bash
codex plugin marketplace add applora/agent-skills
codex plugin add applora@applora-skills
```

**Antigravity CLI**

```bash
agy plugin install https://github.com/applora/agent-skills
```

**Cursor**

On Team or Enterprise plans, open Dashboard → Settings → Plugins → Team
Marketplaces → Import and enter:

```text
https://github.com/applora/agent-skills
```

**VS Code**

Enable the Agent plugins preview, run `Chat: Install Plugin From Source`, and
enter:

```text
https://github.com/applora/agent-skills
```

**Gemini CLI**

```bash
gemini extensions install https://github.com/applora/agent-skills
```

For other agents, copy the required folders from `skills/` into the client's
skills directory.

## Connect the data

The included plugin manifests configure the Applora MCP server automatically.
For a manual connection, add:

```text
https://applora.ai/mcp
```

The OAuth flow will ask you to sign in and approve access; no API key needs to
be pasted into the agent. Some live tools and deeper history require Pro.

You can inspect the underlying data first at
[Apps](https://applora.ai/apps),
[Categories](https://applora.ai/categories),
[Keywords](https://applora.ai/keywords), and
[Market overview](https://applora.ai/appstore).

## Data boundaries

- Rankings, listings, and reviews are continuously refreshed, but each result
  still has an observation time.
- Store-to-app relationships are inferred from public review activity. They are
  not private or confirmed current install records.
- Public market data cannot prove competitor revenue, conversion, or merchant
  willingness to pay. The skills label those gaps instead of inventing them.

This project is independently maintained and is not affiliated with, endorsed
by, or sponsored by Shopify Inc. "Shopify" and "Shopify App Store" are
trademarks of Shopify Inc.

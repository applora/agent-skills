# Applora Agent Skills

Research the Shopify App Store with your AI agent. These nine skills help you turn
app listings, merchant reviews, rankings and developer portfolios into useful
findings—and keep requested reports in your [Applora workspace](https://applora.ai/workspace/reports).

**Applora supplies the data and research workspace. Your connected AI agent does
the analysis.** Installing a skill does not connect your account or start research.

## Start here

1. Install the skills you need.
2. Connect your agent to **`https://api.applora.ai/mcp`** and authorize your Applora account.
3. Ask one focused question, or prepare it in [Get started](https://applora.ai/workspace/research).
4. Review the findings. Ask to save a private report if you want to revisit them.

For example:

> Compare Judge.me and Loox for a small Shopify merchant. Look at declared pricing,
> relevant features and a sample of written merchant reviews. Explain the tradeoffs
> and evidence gaps. Save a private report in Simplified Chinese.

Or prepare a question on an app, category, keyword, developer or review page, choose
a report language, and continue in your agent. The selected setup can include a
research template, one AI Context and up to three previous reports. The agent reads
that setup, gathers evidence and saves the report when requested. See the
[research walkthrough](https://applora.ai/blog/how-to-research-shopify-app-store-with-ai).

## Choose a skill

| Skill | Use it for |
| --- | --- |
| [`run-shopify-app-research`](skills/run-shopify-app-research/SKILL.md) | A prepared research question, selected context/templates, output language and report delivery. Start here if unsure. |
| [`research-shopify-market-opportunities`](skills/research-shopify-market-opportunities/SKILL.md) | Assessing an app idea or niche, competitors, unmet needs and what to validate next. |
| [`analyze-shopify-app-reviews`](skills/analyze-shopify-app-reviews/SKILL.md) | Merchant needs, complaints, positive value and product priorities across a transparent review sample. |
| [`analyze-shopify-app-competitors`](skills/analyze-shopify-app-competitors/SKILL.md) | Fair comparisons of positioning, declared features, pricing, feedback and observed visibility. |
| [`optimize-shopify-app-aso`](skills/optimize-shopify-app-aso/SKILL.md) | Keyword relevance, organic versus sponsored results and measurable listing experiments. |
| [`design-shopify-app-pricing`](skills/design-shopify-app-pricing/SKILL.md) | Pricing benchmarks, packaging, value metrics and hypotheses to test. |
| [`research-shopify-developers`](skills/research-shopify-developers/SKILL.md) | Developer portfolios, agency prospects and partnership fit; Pro adds activity/contact discovery. |
| [`review-shopify-watchlist`](skills/review-shopify-watchlist/SKILL.md) | Following up on selected saved apps, markets, keywords or developers and earlier findings. |
| [`find-shopify-store-leads`](skills/find-shopify-store-leads/SKILL.md) | A small merchant research shortlist based on public review evidence, not confirmed installs or verified buyers. |

Each skill is self-contained, so installing a single workflow works without the
others. Skills can be selected by a compatible agent or explicitly requested by name.

## Install

### Skills CLI

Use the [Skills CLI](https://github.com/vercel-labs/skills) to select your workflows
and supported coding agent:

```bash
npx skills add applora/agent-skills
```

Install a specific workflow:

```bash
npx skills add applora/agent-skills --skill analyze-shopify-app-reviews
```

Inspect the collection before installing:

```bash
npx skills add applora/agent-skills --list
```

The CLI installs skill instructions; **configure MCP separately** unless the client’s
plugin installation explicitly installs the included server configuration. Follow
the CLI’s current Node.js requirement and prompts. To check/update installed skills,
use `npx skills check` and `npx skills update`.

### Claude Code plugin

In a Claude Code session:

```text
/plugin marketplace add applora/agent-skills
/plugin install applora@applora-skills
```

The plugin includes the skills and remote MCP configuration. Complete MCP OAuth
when prompted. See [Claude Code plugin installation](https://code.claude.com/docs/en/plugins/install).

### Gemini CLI extension

```bash
gemini extensions install https://github.com/applora/agent-skills
```

The extension includes the remote server and a workflow guide in `GEMINI.md`.
Follow [Gemini CLI’s extension instructions](https://geminicli.com/docs/extensions/)
and complete MCP authentication. Client versions and workspace policies can affect
extension and OAuth availability.

### Other compatible clients

For clients with Agent Skills support, copy a complete folder from `skills/` into
that client’s documented skills directory, or use the Skills CLI. This repository
also includes portable `plugin.json`/`mcp.json` and existing client-specific plugin
manifests. Use your client’s supported local/repository plugin installer; there is
no single plugin-install command shared by all clients.

A web chat client with MCP support can use Applora without installing this repository,
but it will not necessarily load these skills. Use the [connection guide](https://applora.ai/docs/mcp/connect)
for the current setup options in your AI client.

## Connect and verify MCP

Use the remote HTTP endpoint:

```text
https://api.applora.ai/mcp
```

**The old `https://applora.ai/mcp` address is no longer the MCP endpoint.** Update old
connections and authorize again if prompted.

For clients accepting this configuration shape:

```json
{
  "mcpServers": {
    "applora": {
      "url": "https://api.applora.ai/mcp"
    }
  }
}
```

Sign in through OAuth. If the client supports custom headers but not OAuth, create
a key in [API Keys](https://applora.ai/workspace/api-keys), then add
`Authorization: Bearer <APPLORA_API_KEY>` to the server’s headers. Keep keys out of
skills, prompts, screenshots and committed config.

Ask the connected agent:

> Call get_research_status, read my report templates, and check whether
> get_research_brief and save_report are available in this conversation. Do not
> run market-data queries or create a test report.

The connection check and template reads use no research credits. If the status call
works but a named tool is missing in the client, refresh tool discovery or reconnect.
A connection check does not mean research ran or that every advertised tool is
available in that conversation.

## A workflow you can build on

- **Prepared research** holds a selected question, target, filters, template, language,
  context and reference-report snapshots. Reading it preserves the intended scope;
  preparing it does not execute or schedule research.
- **Templates** describe a repeatable research method. Starter templates are read-only;
  your own templates can be created or edited when requested.
- **AI Contexts** hold private client/product backgrounds. Only selected material is
  used; unrelated client contexts are not automatically included.
- **Reports** hold completed Markdown findings. A continuation normally creates a
  new private report rather than overwriting the original. Report edits use the
  current version to avoid overwriting another edit. Sharing requires an explicit request.
- **Watchlists** hold saved research targets. A skill can investigate them when invoked;
  it does not create a background monitor or scheduled task.

When saving is requested, the agent writes the report in the chosen language, saves
it and returns the successful response’s direct workspace link. Reports include
source links, dates, actual sample sizes and limitations—not tool signatures,
internal IDs or JSON execution logs. Saving existing chat text is not evidence that
new research has been performed.

## Credits, access and limits

| Capability | Current rule |
| --- | --- |
| Verified Free data access | 50 shared research credits per calendar month, resetting on the 1st at 00:00 UTC. Indexed and live MCP/REST requests both qualify. |
| Standard Pro data access | 5,000 shared credits per subscription month. Annual payment has the same monthly reset, not 60,000 upfront. Legacy accounts may have different allowances. |
| Completed data query | One credit, including empty or not-found results. A system failure is not charged. Every additional page is another query. |
| Research workspace tools | Connection checks, briefs, contexts, templates and report storage use no research credits. |
| Pro-only capabilities | CSV exports, developer contacts, developer activity/contact discovery filters and listing-change history, including embedded app/watchlist changes. |
| Saved reports | Up to 10 on Free, 100 on Pro. Existing reports can still be edited at capacity. |
| Custom templates / AI Contexts | Up to 20 of each per account; starter templates do not count toward the custom-template cap. |
| Result size | At most 10 records per list or related-record sample. Detail samples are not complete exports. |

Most indexed lists return `items` and `nextCursor`: reuse the cursor with the same
filters and stop at null. Data-list cursors are numeric and bounded at 999;
`list_reports` instead returns an opaque string cursor. For live review/category/
keyword batches, follow **both** `pagination.nextPage` and `pagination.nextOffset`;
the next batch can be on the same source page. Source pages stop at 50. Skills use
small samples rather than walking all available pages.

AI-provider fees are separate. A skill cannot bypass verification, plan permissions,
credit exhaustion or storage limits. See the maintained [credit rules](https://applora.ai/docs/research-credits)
and [MCP tool reference](https://applora.ai/docs/mcp/tools).

## Evidence boundaries

- Indexed and live results have different observation times; neither guarantees a
  complete historical series. Ten ranking rows may all be from one day.
- Category `topApps` are ordered by review count, not current category rank.
- Keyword competition is not search volume. Public rankings/reviews do not prove
  installs, revenue, conversion or willingness to pay.
- `research_keyword` reads live results; it does not add the term to the index or
  backfill history.
- Store/app relationships come from public reviews, not verified current installs.
  A complaint does not establish buying intent or permission to contact a merchant.
- Missing evidence is stated clearly. No data scraping around paywalls, automatic
  outreach, report publication or deletion is authorized by installing a skill.

Applora is independent of Shopify Inc. “Shopify” and “Shopify App Store” are
trademarks of Shopify Inc. Licensed under [MIT](LICENSE.txt).

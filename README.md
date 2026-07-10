# Applora Agent Skills

A collection of [agent skills](https://www.anthropic.com/news/skills) for
working with the Shopify App Store. Each skill is a self-contained folder
of instructions that an AI agent reads to gain a specific capability — no
code to run, no dependencies to install.

## Install

```
npx skills add https://github.com/applora/agent-skills --skill shopify-app-store-market-research
```

Or copy the skill's folder manually into wherever your agent loads skills
from — no build step, it's plain Markdown:

- **Claude Code**: copy into your project's `.claude/skills/` (or
  `~/.claude/skills/` for every project).
- **Claude Desktop / claude.ai**: use the skill upload option in Settings.
- **Other agents**: check your agent's docs for where it looks for skills.

## Skills

### [`shopify-app-store-market-research`](skills/shopify-app-store-market-research/)

Shopify App Store research and analysis — competitor teardowns,
keyword/category opportunity and whitespace research, and mining reviews
for what merchants actually complain about. Not an ASO (app store
optimization) skill — no listing-copy or ranking-tactics advice.

Needs an MCP connection exposing `search_apps`, `get_app`,
`list_categories`, `get_category_ranking`, `search_keywords`,
`get_keyword_ranking`, `get_app_reviews`, `search_merchants`,
`get_merchant`. Built and tested against [Applora](https://applora.ai)'s
MCP server (the reference implementation — any server exposing the same
tool names/shapes works too), which requires a Pro subscription:

1. Create an account at [applora.ai](https://applora.ai) and subscribe to
   Pro — see [applora.ai/pricing](https://applora.ai/pricing).
2. In your agent's MCP client settings, add a remote server at
   `https://applora.ai/mcp`. Most clients discover the OAuth flow
   automatically and prompt you to sign in and approve access.
3. Or use Applora's guided connect page:
   [applora.ai/dashboard/settings/mcp-server](https://applora.ai/dashboard/settings/mcp-server).

To see the underlying data before connecting anything:
[applora.ai/apps](https://applora.ai/apps),
[applora.ai/categories](https://applora.ai/categories),
[applora.ai/keywords](https://applora.ai/keywords), or the written
walkthrough at
[applora.ai/blog/mcp-market-research-guide](https://applora.ai/blog/mcp-market-research-guide).

## Why this works

These skills are useful because the data behind them is current. The market
research skill is built on Applora's MCP server, which exposes App Store
data that Applora tracks continuously — app listings, category and keyword
rankings, and reviews are recrawled on a schedule, not scraped once and
left to go stale. An agent calling these tools gets today's rankings and
this week's reviews, not a snapshot from whenever a training set was
assembled.

MCP (Model Context Protocol) is what makes this connectable: instead of an
agent guessing at Shopify App Store facts from memory, it calls a tool and
gets back structured, current data it can reason over. Each skill's job is
just to tell the agent which tools exist and how to use them well — the
data freshness comes from Applora's crawling running underneath it.

## Disclaimer

This project is independently maintained and is not affiliated with,
endorsed by, or sponsored by Shopify Inc. "Shopify" and "Shopify App Store"
are trademarks of Shopify Inc.

# Applora Agent Skills

A collection of [agent skills](https://www.anthropic.com/news/skills) for
working with the Shopify App Store. Each skill is a self-contained folder
of instructions that an AI agent reads to gain a specific capability — no
code to run, no dependencies to install.

## What's in this repo

| Skill | What it does |
|---|---|
| [`shopify-app-store-aso-assistant`](shopify-app-store-aso-assistant/) | Shopify App Store ASO (app store optimization) and market research — competitor teardowns, keyword/category opportunity research, review mining, ASO audits |

## Installing a skill

Copy the skill's folder into wherever your agent loads skills from. There's
no build step — it's plain Markdown.

- **Claude Code**: copy the folder into your project's `.claude/skills/`
  directory (or `~/.claude/skills/` to make it available in every project).
- **Claude Desktop / claude.ai**: use the skill upload option in Settings,
  pointing at the skill's folder.
- **Other agents**: check your agent's documentation for where it looks for
  skills — most support a similar "drop a folder in, it gets picked up"
  convention.

Each skill's own README has any additional setup it needs (for example, the
ASO assistant needs an MCP connection to actually query data — see its
README for that).

## Why this works

These skills are useful because the data behind them is current. The ASO
assistant skill is built on [Applora](https://applora.ai)'s MCP server,
which exposes App Store data that Applora tracks continuously — app
listings, category and keyword rankings, and reviews are recrawled on a
schedule, not scraped once and left to go stale. An agent calling these
tools gets today's rankings and this week's reviews, not a snapshot from
whenever a training set was assembled.

MCP (Model Context Protocol) is what makes this connectable: instead of an
agent guessing at Shopify App Store facts from memory, it calls a tool and
gets back structured, current data it can reason over. The skill's job is
just to tell the agent which tools exist and how to use them well for ASO
and market-research questions — the data freshness comes from Applora's
crawling running underneath it.

## License

MIT

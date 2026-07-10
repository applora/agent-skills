# Shopify App Store ASO Assistant

An agent skill that helps any MCP-capable AI agent with Shopify App Store
ASO (app store optimization) and market research — grounded in live App
Store data instead of training-data guesses. Point it at a competitor, a
keyword, or a category and it'll pull real rankings, review text, and
merchant data before it says anything.

Use it for: competitor teardowns, keyword and category opportunity
research, "should I build this" validation, review mining for feature
gaps, and full ASO audits of a specific app.

## What's inside

```
shopify-app-store-aso-assistant/
├── SKILL.md                 — the skill itself: tool table, workflow index, ground rules
└── references/
    ├── tools.md              — exact input/output schema for every tool
    └── workflows.md           — step-by-step recipes for each core workflow
```

`SKILL.md` is deliberately short — it triggers the workflow choice and
points into `references/` for the schema and step-by-step detail, so it
doesn't eat context on every turn.

## Requirements

This skill expects an MCP connection exposing these nine tools:
`search_apps`, `get_app`, `list_categories`, `get_category_ranking`,
`search_keywords`, `get_keyword_ranking`, `get_app_reviews`,
`search_merchants`, `get_merchant`. It was built and tested against
[Applora](https://applora.ai)'s MCP server, which is the reference
implementation — any MCP server exposing the same tool names/shapes works
too.

Applora's MCP access requires a Pro subscription. Everything else about
this skill (the instructions themselves) is free and open to adapt.

## Connecting Applora's MCP server

1. Create an account at [applora.ai](https://applora.ai) and subscribe to
   Pro — see [applora.ai/pricing](https://applora.ai/pricing). MCP access
   is a Pro feature; without it, every tool call returns a "please
   subscribe" message instead of data.
2. In your agent's MCP client settings, add a remote server pointing at:
   ```
   https://applora.ai/mcp
   ```
   Most MCP clients (Claude, ChatGPT connectors, etc.) discover the OAuth
   flow automatically from that URL — you'll be redirected to sign in and
   approve access on first connect, no manual client ID/secret needed.
3. Applora's own dashboard also has a guided connect page:
   [applora.ai/dashboard/settings/mcp-server](https://applora.ai/dashboard/settings/mcp-server).

If you want to see what the underlying data looks like before connecting
anything, Applora's free web directory covers the same App Store data this
skill queries: [applora.ai/apps](https://applora.ai/apps),
[applora.ai/categories](https://applora.ai/categories),
[applora.ai/keywords](https://applora.ai/keywords). There's also a written
walkthrough of the MCP tools in Applora's own market-research context:
[applora.ai/blog/mcp-market-research-guide](https://applora.ai/blog/mcp-market-research-guide).

## Installing this skill

Copy the `shopify-app-store-aso-assistant/` folder into wherever your agent
loads skills from (e.g. a project's `.claude/skills/` directory, or your
agent's global skills folder). No build step, no dependencies — it's pure
Markdown.

## Note

This skill isn't an official Applora product — it's a standalone set of
agent instructions that happens to be built for Applora's MCP server. Adapt
the tool table in `SKILL.md`/`references/tools.md` if you're pointing it at
a different Shopify App Store data source with different tool names.

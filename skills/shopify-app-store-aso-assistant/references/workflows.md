# Workflow playbooks

Concrete call sequences for the workflows named in SKILL.md. Substitute the
user's actual app/category/keyword — these are recipes, not literal scripts.

## 1. Competitor teardown

1. `get_app({ handle })` — pull rankings, keyword coverage, review trend,
   rating distribution in one call.
2. `get_app_reviews({ handle, rating: 1 })` and `rating: 2` — read the
   actual complaint text. Look for a recurring theme (billing, support
   response time, a specific missing feature, onboarding friction).
3. Cross-check `categoryRankings`/`categoryRankTrend` from step 1: is this
   app's position improving or slipping? A slipping leader with a
   recognizable complaint pattern is the clearest opportunity signal.
4. Report: current rank(s), rating trend direction, the 1–2 sentence
   complaint pattern with a quoted snippet, and what that implies (a gap to
   build against, a pricing angle, or a support-quality bar to beat).

## 2. Keyword opportunity finder

1. `search_keywords({ search: "<topic>" })` to get candidate handles — or
   skip straight to `get_keyword_ranking` if the user already named one.
2. For each candidate, `get_keyword_ranking({ handle })` and read:
   - `report.appCount` — how many apps compete at all
   - `report.avgRating` and `report.lowRatingRatio` vs `platformLowRatingRatio`
     — a keyword whose apps rate worse than the platform average is weakly
     served
   - `report.newApps90d` — rising interest if apps keep entering
   - `rankedApps[0..2].position` stability via `dailyPositions` — a keyword
     where the top 3 shuffle constantly is more winnable than one with a
     locked-in leader
3. Rank candidates by "real interest, weak incumbents" — high `appCount` or
   `newApps90d` (demand exists) combined with low `avgRating`/high
   `lowRatingRatio` (incumbents underdeliver) is the strongest signal, not
   raw `appCount` alone.

## 3. Category whitespace analysis

Same signals as keyword opportunity finding, one level up:

1. `list_categories()` to get handles if the user hasn't named one.
2. `get_category_ranking({ handle })` per candidate. Read `report` for:
   - `reviewGrowth90d.percent` — category-wide demand trajectory
   - `avgRating` / `lowRatingRatio` vs `platformLowRatingRatio` — underserved
     if noticeably below platform average
   - `pageOneChanges30d` — high churn means page 1 is genuinely contestable,
     not owned by entrenched incumbents
3. A category that's growing (`reviewGrowth90d` positive) with below-average
   ratings and real page-1 churn is the whitespace signal — call it out
   explicitly, don't just list the raw numbers.

## 4. Review mining for feature gaps

1. `get_app_reviews({ handle, rating: 1 })` then `rating: 2`, paging with
   `cursor`/`nextCursor` if `total` is large enough to be worth it (don't
   over-fetch — 20–40 low-rated reviews is usually enough to see a pattern).
2. Read `content` verbatim — this skill's whole point is quoting what
   merchants actually said, not summarizing into a generic complaint
   category. Pull 2–3 representative quotes per theme.
3. Group into themes yourself (this data isn't pre-classified) — reliability/
   bugs, setup/compatibility, support responsiveness, pricing/billing,
   missing features. Report the theme with quote evidence and a rough
   frequency ("6 of the last 20 one-star reviews mention X").

## 5. Full ASO audit for one app

Combine workflows 1 and 4, plus:

1. `get_app({ handle })` for the baseline (rankings, keyword coverage,
   review/rating trend).
2. For each category/keyword in `categoryRankings`/`keywords.items`, spot-
   check the ones the user cares about with `get_category_ranking` /
   `get_keyword_ranking` to see the app's position *relative to the field*,
   not just in isolation.
3. `get_app_reviews` low-rating pass (workflow 4) for what's dragging the
   rating down.
4. Report as: current standing → trend direction → top complaint theme(s)
   → 2–3 concrete, prioritized recommendations tied to specific findings
   (not generic ASO advice).

## 6. Merchant intelligence

1. `search_merchants({ search: "<name or fragment>" })` to find a merchant,
   or start from `get_app_reviews`'s `merchantId` field if you're working
   backward from a specific review.
2. `get_merchant({ id })` — `installedApps` shows the merchant's public
   app stack, useful for "who already uses complementary tools" targeting
   (partnership/integration outreach) or "what does a `<segment>` merchant's
   stack typically look like" when done across several merchants.
3. Note the ceiling honestly: this is *installs surfaced by public reviews*,
   not a full install graph — say so if the user might assume completeness.

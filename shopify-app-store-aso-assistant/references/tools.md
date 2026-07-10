# Tool reference

Exact input/output shapes for every tool. Field names below are what
actually comes back — use them directly instead of guessing.

## `search_apps`

Input: `{ query?, categoryHandles?, pricing?, builtForShopify?, minRating?, sort?, cursor?, limit? }`
- `pricing`: array of `"free" | "freemium" | "paid"`
- `sort`: `"reviews" | "new"` (default `"reviews"`)
- `limit`: max 100, default 24

Output: `{ items: AppSummary[], nextCursor: number | null }` — **no `total`**.

```ts
AppSummary = {
  handle, name, logo, description,
  rating: number | null, reviewCount: number,
  pricing: string | null, builtForShopify: boolean,
  developerHandle, developerName, launchedDate,
  categories: { handle, name }[],
}
```

## `get_app`

Input: `{ handle }`. Output: `AppSummary` plus:

```ts
{
  developerUrl, developerWebsite,
  categoryRankings: { categoryHandle, categoryName, page, position, isSponsored }[],
  categoryRankTrend: { month, position }[],
  keywords:
    | { source: "tracked", items: { keyword, handle, position }[] }
    | { source: "estimated", items: string[] },   // not independently tracked for this app
  reviewTrend: { month, count }[],
  ratingDistribution: { rating, count }[],
  reviewHighlights: AppReview[],                  // shape below, under get_app_reviews
  merchantRegions: { country, count }[],
}
```

## `list_categories`

No input. Output: `{ handle, name, parentHandle }[]` — every category, flat (use `parentHandle` to reconstruct the tree if needed).

## `get_category_ranking`

Input: `{ handle }`. Output: `{ report, rankedApps }`:

```ts
report: {
  handle, name, parentHandle, level,
  appCount: number, avgRating: number | null,
  lowRatingRatio: number | null,           // this category's share of 1-2★ reviews
  platformLowRatingRatio: number | null,   // same, platform-wide — compare the two
  rankTrend: { date, avgTopPosition }[],
  pageOneChanges30d: number,               // apps that moved on/off page 1 in 30d — competitive churn
  reviewGrowth90d: { delta, percent } | null,
  newApps90d: number,
}
rankedApps: {
  handle, name, logo, rating, reviewCount, pricing,
  position, isSponsored,
  dailyPositions: { date, position }[],    // last 30 days, top 20 apps only
}[]
```

## `search_keywords`

Input: `{ search?, cursor?, limit? }` (limit max 200, default 50).
Output: `{ items: KeywordSummary[], total, nextCursor }`

```ts
KeywordSummary = { handle, keyword, source, depth, hasResults, appCount }
```

## `get_keyword_ranking`

Same shape as `get_category_ranking`, for one keyword handle:

```ts
report: {
  handle, keyword, source, depth, parentKeyword, hasResults,
  appCount, avgRating, lowRatingRatio, platformLowRatingRatio,
  rankTrend, pageOneChanges30d, reviewGrowth90d, newApps90d,
}
rankedApps: /* identical shape to get_category_ranking's rankedApps */
```

## `get_app_reviews`

Input: `{ handle, rating?, cursor?, limit? }` (`rating` filters to that exact
star value 1–5; limit max 50, default 20).
Output: `{ items: AppReview[], total, nextCursor }`

```ts
AppReview = {
  reviewId, reviewer, rating: number,
  content: string | null,       // verbatim text — quote it directly, don't paraphrase as a summary
  location, usageDuration, createdAt, merchantId,
}
```

## `search_merchants`

Input: `{ search?, cursor?, limit? }` (limit max 100, default 50).
Output: `{ items: MerchantSummary[], total, nextCursor }`

```ts
MerchantSummary = { id, handle, name, country, url }
```

## `get_merchant`

Input: `{ id }` (from `search_merchants`). Output:

```ts
{
  merchant: MerchantSummary & { email, phone, address },
  installedApps: AppSummary[],   // every app this merchant's public reviews surfaced
}
```

# Ledgerlens

An AI-powered token due-diligence desk. Pick one of eight preset analysis lenses, paste a crypto asset's figures and context, and Claude returns a scored risk and reward report: a verdict, a risk-vs-reward chart, eight risk dimensions, reward drivers, red flags, bear/base/bull scenarios and a verification checklist.

The whole app is one file, `index.html`, with no build step and no server. Visitors bring their own Anthropic API key, and the browser calls the Anthropic API directly. The example report loads without a key.

## Preset lenses

| Lens | What it focuses on |
|---|---|
| Full due-diligence scorecard | All eight dimensions, weighted equally |
| Supply & unlock stress test | Dilution, emissions, vesting cliffs, likely sellers |
| Liquidity & market risk | Exit liquidity, venue concentration, drawdowns |
| Red-flag & rug screen | Admin powers, concentration, promotion, contract risks |
| Bull vs bear debate | Steelmans both sides and names the deciding evidence |
| Stablecoin & peg check | Reserves, redemption, collateral, depeg scenarios |
| Compare two assets | Side-by-side table with an edge per factor |
| Position & scenario planner | What each scenario means for the stated allocation |

Every lens shares one analyst charter (no invented live figures, evidence tags on every score, no buy/sell calls, calibrated scoring, user data treated as data rather than instructions). Each lens also returns the same JSON schema, so reports stay comparable. The **Prompt inspector** on the page shows the exact prompt.



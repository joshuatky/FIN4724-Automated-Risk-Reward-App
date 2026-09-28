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

## Deploy on GitHub Pages (free, about 10 minutes)

1. **Create a GitHub account** at <https://github.com/signup>.
2. **Create a repository.** Click **+** (top right), then **New repository**. Name it `ledgerlens`, set it to **Public**, and click **Create repository**.
3. **Upload the files.** On the new repo page, click **uploading an existing file**. Drag in `index.html` and `README.md`, then click **Commit changes**.
4. **Turn on Pages.** Go to **Settings**, then **Pages** in the left sidebar. Under **Build and deployment**, set Source to **Deploy from a branch**, set Branch to `main` and folder to `/ (root)`, and click **Save**.
5. **Open your site.** After a minute or two, the Pages settings show the address: `https://<your-username>.github.io/ledgerlens/`.

To update the site later, open `index.html` in the repo, click the pencil (edit) icon or upload a new version, and commit. Pages redeploys automatically.

## Get an Anthropic API key (for running live analyses)

1. Sign up at <https://console.anthropic.com>. This account is separate from a Claude.ai subscription.
2. Under **Billing**, add credit. A small top-up covers many runs; each analysis costs about 3–6 US cents.
3. Under **Limits**, set a low monthly spend limit.
4. Under **API keys**, click **Create key** and copy it (it starts with `sk-ant-`).
5. On your site, paste the key into step 3. Tick **Remember the key on this device** only on your own computer.

## Security notes

- The key is stored only in the visitor's own browser: in session storage by default (cleared when the tab closes), or in local storage if they tick "Remember".
- The page's Content Security Policy only allows network requests to `api.anthropic.com`, so the key cannot be sent anywhere else.
- Never commit an API key to the repository. Anyone can read a public repo.
- For a public demo, suggest that visitors use a key with a low spend limit.

## Models

Standard depth uses `claude-sonnet-5` and Deep uses `claude-opus-5-5`. If Anthropic renames its models, change the `MODELS` line in `index.html` or edit the **Advanced → Model ID** field on the page.

## Disclaimer

Ledgerlens produces educational analysis from data the user supplies. It is not investment advice and gives no price targets or buy/sell recommendations. The model cannot browse the web, so paste current figures from sources such as CoinGecko, DefiLlama or a block explorer.

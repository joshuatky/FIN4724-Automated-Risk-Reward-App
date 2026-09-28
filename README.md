# Ledgerlens: run it on your own computer

Ledgerlens is an AI token due-diligence desk. Pick a preset analysis lens, paste an asset's figures, and Claude returns a scored risk and reward report.

Nothing to install. Everything runs in your browser on your own machine. The only thing that leaves your computer is the prompt, which you paste into Claude yourself (or which goes straight to Anthropic's API if you use a key).

## Start it

**Windows**
1. Unzip the folder. Right-click the zip, choose **Extract All**, and don't run it from inside the zip.
2. Double-click **Start Ledgerlens (Windows).bat**.
3. A black window opens and Ledgerlens opens in your browser at `http://localhost:8765`. Keep the black window open while you use the app, and close it when you're done.
   - If Windows shows "Windows protected your PC", click **More info**, then **Run anyway**.

**Mac**
1. Unzip the folder by double-clicking the zip.
2. Right-click **Start Ledgerlens (Mac).command** and choose **Open**, then **Open** again. You only need to right-click the first time; macOS blocks double-clicking downloaded scripts until then.
3. A Terminal window opens and Ledgerlens opens in your browser. Keep Terminal open while you use it.

**Linux:** run `./start-linux.sh`.

**Quickest option on any computer:** double-click `index.html`. Everything works this way except installing it as an app and using it offline.

## Install it as a desktop app (optional)

Once it's open at `http://localhost:8765` in **Chrome or Edge**, click the install icon at the right end of the address bar (a monitor with a down arrow), or use the menu **⋮ → Cast, save and share → Install page as app**. Ledgerlens then gets its own window and a Start menu or Dock icon.

The app keeps working offline for viewing the example report and your recent reports. Running a new analysis needs an internet connection. The launcher needs to be running when you open the installed app.

## Running analyses

### Option A: your Claude account (default, no API key)

1. Choose a lens, fill in the asset details, and click **Run in Claude**.
2. The prompt is copied and claude.ai opens in a new tab. Paste the prompt into a new chat and send it. Any plan and any model works. If web search is on, Claude may use it to check your figures.
3. When Claude finishes, click the copy button under its reply, switch back to Ledgerlens, and paste into the box. The report builds straight away.

This uses your normal Claude usage. There's no extra cost and nothing to set up.

### Option B: API key (fully automatic)

Switch step 3 to **API key** if you'd rather the report builds by itself without switching tabs.

1. Get a key at <https://console.anthropic.com>. This is separate from a Claude.ai subscription. Add a little credit under **Billing** and set a low spend limit under **Limits**.
2. Paste the key (it starts with `sk-ant-`) and tick **Remember the key on this device** if you like.
3. Click **Run analysis**. Each run costs about 3–6 US cents.

In both modes, paste current figures from CoinGecko, DefiLlama, Tokenomist or a block explorer for the best results.

## What's in the folder

| File | Purpose |
|---|---|
| `index.html` | The whole app |
| `Start Ledgerlens (Windows).bat` | Windows launcher (uses built-in PowerShell) |
| `Start Ledgerlens (Mac).command` | Mac launcher |
| `start-linux.sh` | Linux launcher (needs Python 3) |
| `launcher/serve.ps1` | Tiny local web server used by the Windows launcher |
| `manifest.webmanifest`, `sw.js`, `icons/` | Let the app install and work offline |

## Troubleshooting

- **"Couldn't reach Anthropic"**: check your internet connection. Some ad-blockers or work networks block `api.anthropic.com`.
- **"Port 8765 is busy"**: Ledgerlens is probably already running. The launcher just opens it.
- **Mac says there's no web server**: the launcher opens `index.html` directly instead, and everything except installing works. To enable installing, get Python from <https://www.python.org/downloads/>.
- **Changing models**: Standard uses `claude-sonnet-5` and Deep uses `claude-opus-5-5`. You can change these under **Advanced** in step 3.

Educational analysis only, not financial advice.

#!/bin/bash
# Ledgerlens launcher for macOS. Serves the app at http://localhost:8765 and opens your browser.
cd "$(dirname "$0")" || exit 1
PORT=8765
URL="http://localhost:$PORT/"

if lsof -i :"$PORT" >/dev/null 2>&1; then
  echo "Ledgerlens seems to be running already. Opening $URL"; open "$URL"; exit 0
fi

serve() {
  echo ""; echo "  Ledgerlens is running at $URL"
  echo "  Keep this window open while you use it. Press Ctrl+C or close it to stop."; echo ""
  (sleep 1; open "$URL") &
  "$@"
}

if command -v python3 >/dev/null 2>&1 && { [ "$(command -v python3)" != "/usr/bin/python3" ] || xcode-select -p >/dev/null 2>&1; }; then
  serve python3 -m http.server "$PORT" --bind 127.0.0.1
elif command -v ruby >/dev/null 2>&1; then
  serve ruby -run -e httpd . -p "$PORT" -b 127.0.0.1
elif command -v php >/dev/null 2>&1; then
  serve php -S "127.0.0.1:$PORT"
else
  echo "No local web server found, so opening the app file directly."
  echo "Everything works except installing it as an app. Install Python from python.org to enable that."
  open "index.html"
fi

#!/bin/bash
cd "$(dirname "$0")" || exit 1
URL="http://localhost:8765/"
(sleep 1; xdg-open "$URL" >/dev/null 2>&1) &
echo "Ledgerlens is running at $URL (Ctrl+C to stop)"
python3 -m http.server 8765 --bind 127.0.0.1

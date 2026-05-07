#!/usr/bin/env bash
# MavBooks launcher for macOS / Linux.
# Starts a local server so the camera works, then opens the app.

set -e
cd "$(dirname "$0")"

PORT=8080
URL="http://localhost:${PORT}"

echo
echo "===================================="
echo "  Starting MavBooks on ${URL}"
echo "===================================="
echo
echo "Keep this window open while using the app."
echo "Press Ctrl+C to stop the server."
echo

# Open the browser shortly after the server starts.
( sleep 1 && (open "$URL" 2>/dev/null || xdg-open "$URL" 2>/dev/null || true) ) &

if command -v python3 >/dev/null 2>&1; then
  exec python3 -m http.server "$PORT"
elif command -v python >/dev/null 2>&1; then
  exec python -m http.server "$PORT"
elif command -v npx >/dev/null 2>&1; then
  echo "Python not found - using npx serve instead."
  exec npx --yes serve -l "$PORT" .
else
  echo
  echo "ERROR: Couldn't find Python or Node on your system."
  echo "Install Python from https://python.org and try again,"
  echo "or just run 'vercel deploy' if you have the Vercel CLI."
  exit 1
fi

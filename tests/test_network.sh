#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

source utils/bars.sh   2>/dev/null || true
source modules/network.sh

echo "=== Network Overview (KB/s | Totals MB) ==="
get_net_overview 500 | awk -F'|' '{ printf "RX: %s KB/s | TX: %s KB/s | RX total: %s MB | TX total: %s MB\n", $1,$2,$3,$4 }'

echo
echo "=== Network Bars (scaled to 10 MB/s default) ==="
get_net_bars 40 10240

echo
echo "=== Manual test (optional) ==="
echo "To observe changing RX, run: curl -sS http://speed.hetzner.de/100MB.bin -o /dev/null & then rerun get_net_overview"

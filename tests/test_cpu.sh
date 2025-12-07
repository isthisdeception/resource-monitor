#!/usr/bin/env bash
# tests/test_cpu.sh
set -euo pipefail
cd "$(dirname "$0")/.."
source utils/bars.sh
source modules/cpu.sh

echo "=== CPU Overview ==="
get_cpu_overview | awk -F'|' '{ printf "TOTAL%%: %s%% | Load: %s %s %s\n", $1, $2,$3,$4 }'

echo
echo "=== Per-core Bars ==="
get_cpu_percore_bars 30

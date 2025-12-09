#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

# Source utilities and module
source utils/bars.sh
source modules/memory.sh

echo "=== Memory Overview ==="
get_memory_overview | awk -F'|' '{ 
    printf "Used: %s%% | %s/%s MB | Swap: %s/%s MB\n", $1,$2,$3,$4,$5
}'

echo
echo "=== Memory Bars ==="
get_memory_bars 30

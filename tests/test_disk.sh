#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

source utils/bars.sh   2>/dev/null || true
source modules/disk.sh

echo "=== Disk Overview (KB/s) ==="
get_disk_overview 500 | awk -F'|' '{ printf "Read: %s KB/s | Write: %s KB/s\n", $1,$2 }'

echo
echo "=== Disk Bars & Mounts ==="
get_disk_bars 40 10240

echo
echo "=== Manual tests (optional) ==="
echo "To create disk activity run: dd if=/dev/zero of=/tmp/testfile bs=1M count=100 oflag=direct & then rerun this test"

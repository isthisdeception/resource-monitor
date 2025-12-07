#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

# source utils and module
source utils/bars.sh   2>/dev/null || true
source modules/process.sh

echo "=== Top CPU processes (by %CPU) ==="
get_top_cpu 5
echo

echo "=== Top MEM processes (by %MEM) ==="
get_top_mem 5
echo

# Demo kill: spawn a harmless background process (sleep) and kill it
echo "=== Demo: spawn sleep 60 & then kill it ==="
sleep 60 &
demo_pid=$!
echo "Spawned sleep pid=$demo_pid"

# show it appears in the process list (filter ps)
ps -p "$demo_pid" -o pid,cmd --no-headers || true

# attempt to kill using kill_process
if kill_process "$demo_pid"; then
  echo "kill_process reported success for pid $demo_pid"
else
  echo "kill_process reported failure for pid $demo_pid"
fi

# final check: process should be gone
if ps -p "$demo_pid" >/dev/null 2>&1; then
  echo "Process $demo_pid still exists (unexpected)."
else
  echo "Process $demo_pid no longer present (expected)."
fi

#!/usr/bin/env bash
# tests/demo_utils.sh
# Demo the colors and bar utilities

set -euo pipefail
source ../utils/colors.sh
source ../utils/bars.sh

echo "=== Colors demo ==="
echo "$(colorize "$GREEN" "This is green") $(colorize "$YELLOW" "This is yellow") $(colorize "$RED" "This is red")"

echo
echo "=== Bars demo ==="
for p in 5 12 30 48 65 77 89 95; do
  color=$(percent_color "$p")
  printf "%s " "$(make_bar 30 $p)"
  printf "%b%s%b\n" "$color" " <-- $p%" "$RESET"
done

echo
echo "=== Sparkline demo ==="
vals=(1 3 2 7 6 4 10 8 5)
printf "Values: %s\n" "${vals[*]}"
printf "Spark:  "
make_sparkline "${vals[@]}"
echo

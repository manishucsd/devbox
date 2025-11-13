#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <GPU_ID> [interval_sec=1] [outfile='-']" >&2
  return
fi

GPU_ID="$1"                # required, e.g. 0
INTERVAL="${2:-1}"         # optional, default 1s
OUT="${3:--}"              # optional, '-' = stdout

QUERY="timestamp,index,name,clocks.sm,power.draw,fan.speed"
HEADER="timestamp,index,name,sm_clock_mhz,power_w,fan_pct"

# header once if writing to file
if [[ "$OUT" != "-" ]]; then
  echo "$HEADER" > "$OUT"
  APPEND=">> \"$OUT\""
else
  echo "$HEADER"
  APPEND=""
fi

# Use --id/-i to select a single GPU
# Output as CSV without header/units; loop every INTERVAL seconds.
# shellcheck disable=SC2086
eval "nvidia-smi -i $GPU_ID --query-gpu=$QUERY --format=csv,noheader,nounits --loop=$INTERVAL | while IFS= read -r line; do echo \"\$line\" $APPEND; done"

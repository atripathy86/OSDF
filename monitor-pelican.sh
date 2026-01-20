#!/bin/bash
LOGFILE="/var/pelican/logs/pelican.log"  # Adjust path
STATEFILE="/var/tmp/pelican_size.state"
GROWTH_LOG="/var/log/pelican_growth.log"
THRESHOLD_GB=1  # Alert if >1GB

SIZE=$(stat -c%s "$LOGFILE" 2>/dev/null || echo 0)
PREV_SIZE=$(cat "$STATEFILE" 2>/dev/null || echo 0)

GROWTH=$((SIZE - PREV_SIZE))
GROWTH_GB=$(echo "scale=2; $GROWTH / 1024 / 1024 / 1024" | bc -l 2>/dev/null || echo 0)

echo "$(date): Size: ${SIZE}B (~$(echo "scale=1; $SIZE / 1024 / 1024 / 1024" | bc -l 2>/dev/null || echo 0)GB), Growth: ${GROWTH_GB}GB" >> "$GROWTH_LOG"

if [ "$SIZE" -gt $((THRESHOLD_GB * 1024**3)) ]; then
    echo "ALERT: pelican.log > ${THRESHOLD_GB}GB ($(date))" | mail -s "Pelican Log Alert" root
fi

echo "$SIZE" > "$STATEFILE"


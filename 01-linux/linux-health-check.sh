#!/usr/bin/env bash

# DevOps Deployment Toolkit
# Module 01 - Linux Server Health Check v2
# Read-only educational diagnostic script

set -u

# Thresholds
DISK_WARNING="${DISK_WARNING:-80}"
DISK_CRITICAL="${DISK_CRITICAL:-90}"
MEMORY_WARNING="${MEMORY_WARNING:-80}"
MEMORY_CRITICAL="${MEMORY_CRITICAL:-90}"

WARNINGS=0
CRITICALS=0

# Report configuration
REPORT_DIR="${REPORT_DIR:-.}"
mkdir -p "$REPORT_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
REPORT_FILE="$REPORT_DIR/health-check-$TIMESTAMP.log"

# Display output and save it to a report
exec > >(tee "$REPORT_FILE") 2>&1

echo "========================================"
echo "       LINUX SERVER HEALTH CHECK"
echo "========================================"
echo "Report: $REPORT_FILE"
echo

# 1. System information
echo "[1] SYSTEM INFORMATION"
echo "Hostname: $(hostname)"
echo "Date: $(date)"

if [ -r /etc/os-release ]; then
    . /etc/os-release
    echo "Operating System: ${PRETTY_NAME:-Unknown}"
fi

# 2. CPU information
echo
echo "[2] CPU INFORMATION"

if command -v nproc >/dev/null 2>&1; then
    echo "Available CPU processors: $(nproc)"
else
    echo "WARNING: CPU information unavailable"
    WARNINGS=$((WARNINGS + 1))
fi

# 3. System uptime
echo
echo "[3] SYSTEM UPTIME"

if command -v uptime >/dev/null 2>&1; then
    uptime
else
    echo "WARNING: Uptime information unavailable"
    WARNINGS=$((WARNINGS + 1))
fi

# 4. Memory utilisation
echo
echo "[4] MEMORY UTILISATION"

if command -v free >/dev/null 2>&1; then
    free -h

    MEMORY_PERCENT=$(free -b | awk '/^Mem:/ {
        if ($2 > 0) {
            printf "%.0f", (($2 - $7) / $2) * 100
        }
    }')

    if [[ "$MEMORY_PERCENT" =~ ^[0-9]+$ ]]; then
        echo "Memory usage: ${MEMORY_PERCENT}%"

        if [ "$MEMORY_PERCENT" -ge "$MEMORY_CRITICAL" ]; then
            echo "CRITICAL: Memory usage is at or above ${MEMORY_CRITICAL}%"
            CRITICALS=$((CRITICALS + 1))
        elif [ "$MEMORY_PERCENT" -ge "$MEMORY_WARNING" ]; then
            echo "WARNING: Memory usage is at or above ${MEMORY_WARNING}%"
            WARNINGS=$((WARNINGS + 1))
        else
            echo "PASS: Memory usage is within the configured threshold"
        fi
    else
        echo "WARNING: Could not calculate memory utilisation"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo "WARNING: Memory information unavailable"
    WARNINGS=$((WARNINGS + 1))
fi

# 5. Disk utilisation
echo
echo "[5] DISK UTILISATION"

if command -v df >/dev/null 2>&1; then
    df -hT

    while read -r filesystem blocks used available capacity mountpoint; do
        use_pct="${capacity%\%}"

        if [[ "$use_pct" =~ ^[0-9]+$ ]]; then
            if [ "$use_pct" -ge "$DISK_CRITICAL" ]; then
                echo "CRITICAL: $mountpoint on $filesystem is ${use_pct}% full"
                CRITICALS=$((CRITICALS + 1))
            elif [ "$use_pct" -ge "$DISK_WARNING" ]; then
                echo "WARNING: $mountpoint on $filesystem is ${use_pct}% full"
                WARNINGS=$((WARNINGS + 1))
            else
                echo "PASS: $mountpoint disk usage is ${use_pct}%"
            fi
        fi
    done < <(df -P | awk 'NR > 1')
else
    echo "WARNING: Disk information unavailable"
    WARNINGS=$((WARNINGS + 1))
fi

# 6. Top CPU-consuming processes
echo
echo "[6] TOP CPU-CONSUMING PROCESSES"

if command -v ps >/dev/null 2>&1; then
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
else
    echo "WARNING: Process information unavailable"
    WARNINGS=$((WARNINGS + 1))
fi

# 7. Final health summary
echo
echo "========================================"
echo "             HEALTH SUMMARY"
echo "========================================"
echo "Warnings: $WARNINGS"
echo "Critical alerts: $CRITICALS"

if [ "$CRITICALS" -gt 0 ]; then
    echo "FINAL STATUS: CRITICAL"
    EXIT_CODE=1
elif [ "$WARNINGS" -gt 0 ]; then
    echo "FINAL STATUS: WARNING"
    EXIT_CODE=0
else
    echo "FINAL STATUS: PASS"
    EXIT_CODE=0
fi

echo
echo "Report saved to: $REPORT_FILE"
echo "========================================"

exit "$EXIT_CODE"

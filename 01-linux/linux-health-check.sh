#!/usr/bin/env bash

# DevOps Deployment Toolkit
# Module 01 - Linux Server Health Check
# Read-only educational diagnostic script

set -u

echo "========================================"
echo "       LINUX SERVER HEALTH CHECK"
echo "========================================"

echo
echo "[1] SYSTEM INFORMATION"
echo "Hostname: $(hostname)"
echo "Date: $(date)"

if [ -r /etc/os-release ]; then
    . /etc/os-release
    echo "Operating System: ${PRETTY_NAME:-Unknown}"
fi

echo
echo "[2] CPU INFORMATION"

if command -v nproc >/dev/null 2>&1; then
    echo "Available CPU processors: $(nproc)"
else
    echo "CPU processor count unavailable"
fi

echo
echo "[3] SYSTEM UPTIME"

if command -v uptime >/dev/null 2>&1; then
    uptime
else
    echo "Uptime command unavailable"
fi

echo
echo "[4] MEMORY UTILISATION"

if command -v free >/dev/null 2>&1; then
    free -h
elif [ -r /proc/meminfo ]; then
    head -n 5 /proc/meminfo
else
    echo "Memory information unavailable"
fi

echo
echo "[5] DISK UTILISATION"

if command -v df >/dev/null 2>&1; then
    df -hT
else
    echo "Disk information unavailable"
fi

echo
echo "[6] TOP CPU-CONSUMING PROCESSES"

if command -v ps >/dev/null 2>&1; then
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
else
    echo "Process information unavailable"
fi

echo
echo "========================================"
echo "       HEALTH CHECK COMPLETED"
echo "========================================"


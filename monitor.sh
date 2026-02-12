#!/bin/bash

# Simple System Monitor

INTERVAL=5

while true;do
    clear
    echo "=== System Monitor ==="
    echo "Time: $(date)"
    echo ""
    
    # CPU
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -fi
    echo ""
    
    # Memory
    echo "Memory:"
    free -h | grep Mem | awk '{Print $3 " / " $2}'
    echo ""
    
    # Disk
    echo "Disk"
    df -h / | tail -1 | awk '{print $3 " / " $2 " (" $5 ")"}'
    
    sleep INTERVAL
done
#!/bin/bash

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

# Checking CPU usage
CPU_USAGE=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
  echo "Alert: CPU usage is above $CPU_THRESHOLD%. Current usage: $CPU_USAGE%"
  echo "$(date): CPU usage is above $CPU_THRESHOLD%. Current usage: $CPU_USAGE%" >> system_health.log
fi

# Checking memory usage
MEMORY_USAGE=$(vm_stat | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
MEMORY_TOTAL=$(sysctl -n hw.memsize)
MEMORY_PERCENTAGE=$(echo "scale=2; $MEMORY_USAGE*4096*100/$MEMORY_TOTAL" | bc)
if (( $(echo "$MEMORY_PERCENTAGE > $MEMORY_THRESHOLD" | bc -l) )); then
  echo "Alert: Memory usage is above $MEMORY_THRESHOLD%. Current usage: $MEMORY_PERCENTAGE%"
  echo "$(date): Memory usage is above $MEMORY_THRESHOLD%. Current usage: $MEMORY_PERCENTAGE%" >> system_health.log
fi

# Checking disk usage
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if (( DISK_USAGE > DISK_THRESHOLD )); then
  echo "Alert: Disk usage is above $DISK_THRESHOLD%. Current usage: $DISK_USAGE%"
  echo "$(date): Disk usage is above $DISK_THRESHOLD%. Current usage: $DISK_USAGE%" >> system_health.log
fi

# Checking running processes
RUNNING_PROCESSES=$(ps aux | wc -l)
echo "Running processes: $RUNNING_PROCESSES"
echo "$(date): Running processes: $RUNNING_PROCESSES" >> system_health.log

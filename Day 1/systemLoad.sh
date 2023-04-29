#!/bin/bash
while true; do
  # Get system load average for the past 1 minute
  load=$(uptime | awk '{print $10}')

  # Get current date and time in YYYY/MM/DD HH:MM:SS format
  datetime=$(date '+%Y/%m/%d %H:%M:%S')

  # Write the load average and datetime to the system load log file
  echo "$datetime $load" >> /var/log/system-load

  # Wait for 5 seconds before checking the system load again
  sleep 5
done

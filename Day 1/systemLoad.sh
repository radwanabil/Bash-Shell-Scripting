#!/bin/bash

# This script monitors system load and appends the output to the system-load log file

# Get the current date and time
date=$(date +"%Y-%m-%d %H:%M:%S")

# Get the system load average for the past 1 minute
load=$(uptime | awk '{print $10}')

# Append the load average and date/time to the log file
echo "$date - Load average: $load" >> /var/log/system-load

#!/bin/bash

# Define the log file
LOG_FILE="/home/vishwesh/test/process_monitor.log"

# Prompt the user to enter the process name
read -p "Enter the process name: " PROCESS_NAME

# Check if the process name was provided
if [ -z "$PROCESS_NAME" ]; then
  echo "No process name provided. Exiting."
  exit 1
fi

# Check if the process is running
if pgrep -x "$PROCESS_NAME" > /dev/null; then
  echo "$(date): $PROCESS_NAME is running." >> "$LOG_FILE"
else
  echo "$(date): $PROCESS_NAME is not running. Attempting to start." >> "$LOG_FILE"
  
  # Attempt to start the process
  systemctl start "$PROCESS_NAME"
  
  # Check if the process was successfully started
  if pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "$(date): $PROCESS_NAME successfully started." >> "$LOG_FILE"
  else
    echo "$(date): Failed to start $PROCESS_NAME." >> "$LOG_FILE"
  fi
fi

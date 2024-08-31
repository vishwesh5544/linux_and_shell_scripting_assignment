#!/bin/bash

# Set the threshold percentage for disk usage
THRESHOLD=80

# Prompt the user to enter the system administrator's email address
read -p "Enter the system administrator's email address: " ADMIN_EMAIL

# Check if the email address is not empty
if [ -z "$ADMIN_EMAIL" ]; then
  echo "No email address provided. Exiting."
  exit 1
fi

# Get the current disk usage percentage of the root filesystem
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if the disk usage is greater than or equal to the threshold
if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
  # Define the email subject and message
  SUBJECT="Disk Usage Alert: Root Filesystem Exceeds ${THRESHOLD}%"
  MESSAGE="Warning: The root filesystem '/' is ${DISK_USAGE}% full."

  # Send the email alert
  echo "$MESSAGE" | mail -s "$SUBJECT" "$ADMIN_EMAIL"

  echo "Alert sent to $ADMIN_EMAIL: $MESSAGE"
else
  echo "Disk usage is under control: ${DISK_USAGE}%"
fi

#!/bin/bash

# Prompt the user to enter the file path
read -p "Enter the file path: " FILE

# Check if the file exists
if [ ! -e "$FILE" ]; then
  echo "File does not exist."
  exit 1
fi

# Check if the file has read permission
if [ -r "$FILE" ]; then
  echo "The file has read permission."
else
  echo "The file does not have read permission."
fi

# Check if the file has write permission
if [ -w "$FILE" ]; then
  echo "The file has write permission."
else
  echo "The file does not have write permission."
fi

# Check if the file has execute permission
if [ -x "$FILE" ]; then
  echo "The file has execute permission."
else
  echo "The file does not have execute permission."
fi

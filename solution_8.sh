#!/bin/bash

# Check if the file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "File not found!"
  exit 1
fi

# Count the number of lines, words, and characters
lines=$(wc -l < "$1")
words=$(wc -w < "$1")
characters=$(wc -m < "$1")

# Display the results
echo "File: $1"
echo "Lines: $lines"
echo "Words: $words"
echo "Characters: $characters"

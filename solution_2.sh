#!/bin/bash

# Check if a directory is provided as an argument
if [ -z "$1" ]; then
  # If no directory is provided, print usage instructions and exit
  echo "Usage: $0 <directory>"
  exit 1
fi

# Get the directory path from the first argument
DIR=$1

# Check if the provided directory exists
if [ ! -d "$DIR" ]; then
  # If the directory does not exist, print an error message and exit
  echo "Directory $DIR does not exist."
  exit 1
fi

# Create a timestamp in the format YYYYMMDD_HHMMSS
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Define the backup directory path using the original directory path and the timestamp
BACKUP_DIR="${DIR}/backup_${TIMESTAMP}"

# Create the backup directory using the mkdir command with the -p flag
# The -p flag ensures that the entire directory path is created if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Use the find command to locate all .txt files in the specified directory
# -maxdepth 1 ensures that only files in the top-level directory are considered (no subdirectories)
find "$DIR" -maxdepth 1 -type f -name "*.txt" -exec cp {} "$BACKUP_DIR" \;

# Print a message indicating that the backup is complete
echo "Backup completed. All .txt files from $DIR have been copied to $BACKUP_DIR."

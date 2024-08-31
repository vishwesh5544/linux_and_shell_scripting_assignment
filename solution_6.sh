#!/bin/bash

# Define source and destination directories
SOURCE_DIR="/home/vishwesh/Documents"
BACKUP_DIR="/home/vishwesh/backup"
BACKUP_FILE="documents_backup.tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Compress the documents directory into a tarball
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$SOURCE_DIR" .

# Verify if the tarball was created successfully
if [ -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
  echo "Backup successful: $BACKUP_DIR/$BACKUP_FILE"
else
  echo "Backup failed."
fi

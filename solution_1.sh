#!/bin/bash

# Define the base directory
base_dir="/home/vishwesh"

# Function to create the directory structure
create_directories() {
    mkdir -p "$base_dir/projects/project1"
    mkdir -p "$base_dir/projects/project2"
    mkdir -p "$base_dir/projects/project3"
    mkdir -p "$base_dir/documents"
    mkdir -p "$base_dir/downloads"
    echo "Directory structure created successfully!"
}

# Check if we have write permission for the base directory
if [ -w "$base_dir" ]; then
    create_directories
else
    echo "No write permission for $base_dir, attempting to use sudo..."
    sudo bash -c "$(declare -f create_directories); create_directories"
fi

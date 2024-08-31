#!/bin/bash

# Get the current username
USERNAME=$(whoami)

# Get the User ID (UID)
USER_ID=$(id -u)

# Get the Group ID (GID)
GROUP_ID=$(id -g)

# Get the Home Directory
HOME_DIR=$(echo $HOME)

# Get the Shell being used
SHELL_USED=$(echo $SHELL)

# Display the information
echo "Username: $USERNAME"
echo "User ID: $USER_ID"
echo "Group ID: $GROUP_ID"
echo "Home Directory: $HOME_DIR"
echo "Shell being used: $SHELL_USED"

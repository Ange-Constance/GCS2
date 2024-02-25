#!/bin/bash

# Configuration variables
remote_host="64293e56bc62.3a2627c1.alu-cod.online"
remote_username="64293e56bc62"
remote_password="328d3b338a4ced526c9a"
remote_directory="/summative/1023-2024j"
local_directory="negpod_11-q1"

# Function to execute the backup
perform_backup() {
    echo "Initiating backup process..."

    # Use rsync to securely copy files to the remote server
    rsync -avz -e "sshpass -p $remote_password ssh -o StrictHostKeyChecking=no" "$local_directory" "$remote_username@$remote_host:$remote_directory"

    # Check if rsync command was successful
    if [ $? -eq 0 ]; then
        echo "Backup completed successfully."
    else
        echo "Backup process failed. Please review your settings and try again."
    fi
}

# Check if the local directory exists
if [ -d "$local_directory" ]; then
    # Execute backup
    perform_backup
else
    echo "Error: Local directory '$local_directory' not found. Please provide the correct directory path."
fi

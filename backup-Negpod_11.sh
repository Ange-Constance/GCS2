#!/bin/bash

# Configuration parameters
remote_server="64293e56bc62.3a2627c1.alu-cod.online"
remote_user="64293e56bc62"
remote_secret="328d3b338a4ced526c9a"
remote_location="/summative/1023-2024j"
local_location="negpod_11-q1"

# Function to initiate the backup process
perform_data_backup() {
    echo "Initiating backup process..."

    # Securely transfer files to the remote server using rsync
    rsync -avz -e "sshpass -p $remote_secret ssh -o StrictHostKeyChecking=no" "$local_location" "$remote_user@$remote_server:$remote_location"

    # Check if rsync command executed successfully
    if [ $? -eq 0 ]; then
        echo "Backup completed successfully."
    else
        echo "Backup process failed. Please review your settings and try again."
    fi
}

# Check if the local location exists
if [ -d "$local_location" ]; then
    # Execute backup process
    perform_data_backup
else
    echo "Error: The local location '$local_location' was not found. Please provide the correct directory path."
fi

#!/bin/bash

# Path to the script to be executed every minute
SCRIPT_PATH="/tulip-fork/run_assembler.sh"

# Crontab entry to add
CRON_JOB="* * * * * $SCRIPT_PATH"

# Temporary file to store the current crontab
CRON_TEMP_FILE=$(mktemp)

# Backup current crontab
crontab -l > "$CRON_TEMP_FILE"

# Check if the cron job already exists
if ! grep -Fxq "$CRON_JOB" "$CRON_TEMP_FILE"; then
    # Add the new cron job to the temporary crontab file
    echo "$CRON_JOB" >> "$CRON_TEMP_FILE"
    
    # Install the new crontab from the temporary file
    crontab "$CRON_TEMP_FILE"
    
    echo "Cron job added successfully."
else
    echo "Cron job already exists."
fi

# Clean up the temporary file
rm "$CRON_TEMP_FILE"

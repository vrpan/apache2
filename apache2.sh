#!/bin/bash

# Install HTTP server
sudo apt-get update
sudo apt-get install apache2 -y
sudo systemctl enable apache2

# Read the log file
LOG_FILE="/var/log/apache2/access.log"
ERROR_LOG_FILE="/var/log/apache2/error.log"

# Check for 4xx and 5xx errors in the log file
if grep -q "HTTP/1.[01]\" [45][0-9][0-9]" "$LOG_FILE"; then
    echo "4xx or 5xx errors found in the access log."
else
    echo "No 4xx or 5xx errors found in the access log."
fi

# Check for 4xx and 5xx errors in the error log file
if grep -q "[45][0-9][0-9]" "$ERROR_LOG_FILE"; then
    echo "4xx or 5xx errors found in the error log."
else
    echo "No 4xx or 5xx errors found in the error log."
fi

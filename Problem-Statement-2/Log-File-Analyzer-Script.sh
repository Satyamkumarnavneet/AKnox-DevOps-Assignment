#!/bin/bash

# Log file location
LOG_FILE="/Users/satyamkumarnavneet/Documents/Satyam-Documents/Company-Assignments/AKnox-DevOps-Assignment/App.log"

# Number of 404 errors
NUM_404=$(grep " 404 " $LOG_FILE | wc -l)

# Most requested pages
MOST_REQUESTED=$(awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 10)

# IP addresses with the most requests
MOST_REQUESTS_IP=$(awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 10)

# Output the results
echo "Number of 404 errors: $NUM_404"
echo "Most requested pages:"
echo "$MOST_REQUESTED"
echo "IP addresses with the most requests:"
echo "$MOST_REQUESTS_IP"

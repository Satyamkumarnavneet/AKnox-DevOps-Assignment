#!/bin/bash

# Application URL
APP_URL="https://satyamkumarnavneetportfolio.netlify.app/"

# Check application status
STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" $APP_URL)

if [ $STATUS_CODE -eq 200 ]; then
  echo "Application is up. Status code: $STATUS_CODE"
else
  echo "Application is down. Status code: $STATUS_CODE"
fi

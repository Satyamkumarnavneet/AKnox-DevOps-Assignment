#!/bin/bash

SOURCE_DIRECTORY="/Users/satyamkumarnavneet/Documents/"
#REMOTE_SERVER="backupuser@192.168.1.100:/backups"
BACKUP_DIRECTORY="/Users/satyamkumarnavneet/Documents/GSOC/"
LOG_FILE="backup.log"

# Backup using rsync
rsync -avz --delete $SOURCE_DIRECTORY $REMOTE_SERVER
if [ $? -eq 0 ]; then
  echo "Backup successful!"
  echo "$(date): Backup successful" >> $LOG_FILE
else
  echo "Backup failed!"
  echo "$(date): Backup failed" >> $LOG_FILE
fi



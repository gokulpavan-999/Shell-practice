#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 #in project we keep it as 75
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""

while IFS= read -r Line
do

  USAGE=$(echo $Line | awk '{print $6}' | cut -d "%" -f1)
  PARTITION=$(echo $Line | awk '{print $7}')
  MESSAGE+="High Disk usage on $PARTITION:$USAGE % /n"
  
done <<< "$DISK_USAGE"

echo -e "Message Body: $MESSAGE"

#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/Shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script Staring at: $(date)"

SOURCE_DIR="/home/ec2-user/app-logs"

if [ ! -d $SOURCE_DIR ]; then
     echo -e "ERROR:: $SOURCE_DIR does not exist"
     exit 
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS= read -r filepath 
do
  echo "Deleting the file: $filepath"
  
done <<<"$FILE_TO_DELRTE"

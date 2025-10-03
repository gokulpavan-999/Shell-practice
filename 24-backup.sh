#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/Shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
#LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
LOG_FILE="$LOGS_FOLDER/backup.log" #modified to run the script as command

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #Default to 14 days if not passed

mkdir -p $LOGS_FOLDER
echo "Script Started executed at: $(date)"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privilege"
    exit 1
fi

USAGE () {
    echo -e "$R USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional, default 14 days] $N"
    exit 1
}

### Check SOURCE_DIR and DEST_DIR passed or not ###
if [ $# -lt 2 ]; then
   USAGE 
fi

### Check SOURCE_DIR Exist ###
if [ ! -d $SOURCE_DIR ]; then 
   echo -e "$R Source $SOURCE_DIR does not exist $N"
   exit
fi

### Check DEST_DIR Exist ###
if [ ! -d $DEST_DIR ]; then
   echo -e "$R Destination $DEST_DIR does not exist $N"
fi

### Find the files ###
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ ! -z "${FILES}" ]; then
   ### Start Archiving ###
   echo "Files found: $FILES"
   TIMESTAMP=$(date +%F-%H-%-M)
   ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
   echo "Zip file Name: $ZIP_FILE_NAME"
   find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"

   ### Check Archieval Success or not ###
   if [ -f $ZIP_FILE_NAME ]; then 
     echo -e "Archieval ...$G SUCESS $N"

     ### Delete if sucess ###
     while IFS= read -r filepath
     do 
        echo "Deleting the file: $filepath"
        rm -rf $filepath
        echo "Deleted the file: $filepath"
    done <<< $FILES
   else
       echo "Archieval ... $R FAILURE $N"
       exit 
    fi
  else
     echo -e "No files to Archive ... $Y SKIPPING $N"
  fi

#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FLODER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -fl )
LOG_FILE="$LOGS_FLODER/$SCRIPT_NAME.log"

mkdir - p $LOGS_FLODER

if [ $USERID -ne 0 ]; then
   echo "ERROR:: Please run this script with root privilege"
   exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then 
       echo -e "Installing $2 ... $R FAILURE $N" | tee -a $LOG_FILE
    else
       echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi    
}

# $0

for package in $@
do
   #Check Package is already installed or not
   dnf list installed $package &>>$LOG_FILE

   #if exit status is 0, already installed. -ne 0 need to install it
   if [ $? -ne 0 ]; then
      dnf install $package -y &>>$LOG_FILE
      VALIDATE $? "$package"
   else
     echo -e "$package already installed ... $Y SKIPPING $N"
  fi
      
done

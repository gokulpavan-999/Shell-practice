#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/Shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #/var/log/Shell-script/16.logs.log

mkdir -p $LOGS_FOLDER
echo "scrip started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
   echo "ERROR:: Please run this script with root privilege"
   exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
       echo -e "ERROR:: Installing $2 ... $R FAILURE $N"
    else
       echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}

dnf list installed mysql &>>LOG_FILE | tee -a $LOG_FILE
    if [ $? -ne 0 ]; then
       dnf install mysql -y
       VALIDATE $? "MySQL"
    else
      echo -e "MySQL already exist ... $Y SKIPPING $N"
    fi

dnf list installed nginx &>>LOG_FILE | tee -a $LOG_FILE
    if [ $? -ne 0 ]; then
       dnf install nginx -y
       VALIDATE $? "Nginx"
    else
      echo -e "Nginx already exist ... $Y SKIPPING $N"
    fi

dnf list installed python3 &>>LOG_FILE | tee -a $LOG_FILE
    if [ $? -ne 0 ]; then
       dnf install python3 -y
       VALIDATE $? " Python3"
    else
      echo -e "Python3 already exists ... $Y SKIPPING $N"
    fi

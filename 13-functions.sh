#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "ERROR:: Please run this script with root privilege"
   exit 1
fi

VALIDATE(){
  if [ $1 -ne 0 ]; then
     echo "ERROR:: Installating $2 is failure"
  else 
     echo "Installation $2 is Success"
  fi
}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "Python"

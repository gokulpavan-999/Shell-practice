#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[31m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
   echo "ERROR:: Please run this script with root privilege"
   exit 1
fi

VALIDATE(){
   if [ $1 -ne 0 ]; then
      echo -e "Installating $2 ... $R FAILURE $N"
   else
      echo -e "Installating $2 ... $G SUCCESS $N"
   fi
}

dnf List install mysql
#install if it is not found
   if [ $? -ne 0 ]; then
       dnf install mysql -y
       VALIDATE $? "MySQL"
   else
      echo -e "MySQL already exist ... $Y SKIPPING $N"
   fi

dnf List install nginx
  if [ $? -ne 0 ]; then
     dnf install nginx -y
     VALIDATE $? "Nginx"
  else
    echo -e "Nginx already exist ... $Y SKIPPING $N"
  fi

dnf List install python3
  if [ $? -ne 0 ]; then
     dnf install python3 -y
     VALIDATE $? "Python3"
  else
    echo -e "Python3 already exist ... $Y SKIPPING $N"
  fi
  

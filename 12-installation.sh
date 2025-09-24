#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "ERROR:: Please run this script with root Privilege"
   exit 1 #failure is other than
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
   echo "ERROR:: Installating MySQL is failure"
   exit 1
else 
   echo "Installating MySQL is Success"
fi

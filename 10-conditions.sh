#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]; then
   echo "Give number $NUMBER is less then 10"
elif [ $NUMBER -eq 10 ]; then
   echo "Give number $NUMBER is equal to 10"
else 
   echo "Give number $NUMBER is greater then to 10"
fi

# -gt
# -lt
# -eq
# -ne

#!/bin/bash

echo "Plese enter the number"
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
   echo "Give number $NUMBER is Even."
else
   echo "Given number $NUMBER is ODD."
fi

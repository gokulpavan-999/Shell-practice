#!/bin/bash

echo "Plese enter the number"
read "NUMBER"

if [ $(($NUMBER % 2 -eq 0 )) ]; then
   echo "Give number is $NUMBER Even."
else
   echo "Given number is $NUMBER ODD."
fi

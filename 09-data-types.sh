#!/bin/bash

#everything is shell is considered as string 
NUMBER1=100
NUMBER2=200
NAME=Pavan

sum=$(($NUMBER1+$NUMBER2+$NAME))
echo "sum is :${sum}"

LEADERS=("Modi" "Putin" "Trudo" "Trump")
echo "All Leaders :${LEADERS[@]}"
echo "First Leader :${LEADERS[0]}"

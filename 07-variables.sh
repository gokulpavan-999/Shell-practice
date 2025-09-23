#!/bin/bash

#DATE=$(date)
#echo "Time Stamp Executed : $DATE"

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "Script exected in : $TOTAL_TIME Seconds"

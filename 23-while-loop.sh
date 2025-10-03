#/bin/bash

count=5

echo "Starting count down ..."

while [ $count -gt 0 ]
do 
 echo "Time Left : $count"
 sleep 1
 count=$(( count - 1 ))
done

 echo "Time up"

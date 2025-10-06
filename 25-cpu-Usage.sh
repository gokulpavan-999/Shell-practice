#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read -r Line
do
  echo "Line: $Line"
done <<< "$DISK_USAGE"

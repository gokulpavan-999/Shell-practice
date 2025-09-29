#!/bin/bash
set -e

trap 'echo "There is an error in $LINENO, Command is: $BASH_COMMAND"'ERR

echo "Hello.."
echo "Before error"
ghhgg;dhgg # here shell understands there is an error and signal is ERR
echo "After error"

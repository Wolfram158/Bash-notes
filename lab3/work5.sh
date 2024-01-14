#!/bin/bash

res=1
mode="+"

(tail -f pipe) |
while true; do
read LINE
if [[ "$LINE" == "QUIT" ]]; then
echo "exit" 
killall tail
exit 0
fi
if [[ "$LINE" == "+" ]]; then
mode="+"
elif [[ "$LINE" == "*" ]]; then
mode="*"
elif [[ "$LINE" =~ ^[0-9]+$ ]]; then
res=$(echo "$res $mode $LINE"| bc -l)
echo $res
else
echo "error: unrecognized input"
exit 1
fi
done

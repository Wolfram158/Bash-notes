#!/bin/bash

while true; do
read LINE
echo $LINE > pipe
if [[ "$LINE" == "QUIT" ]]; then
exit 0
fi
if [[ ! "$LINE" =~ ^[0-9]+$ && ! "$LINE" =~ "+" && ! "$LINE" =~ "*" ]]; then
exit 1
fi
done

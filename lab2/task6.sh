#!/bin/bash

max_mem=-1
pid_of_max1=-1

for number in $(ps ax -o pid); do
if [[ -f /proc/$number/status ]]; then
current_mem=$(cat /proc/$number/status | grep 'VmSize' | awk '{print $2}')
if [[ "$current_mem" -gt "$max_mem" ]]; then
max_mem=$current_mem
pid_of_max1=$number
fi
fi
done

echo "Result of ps: $pid_of_max1"

pid_of_max2=$(top -b -n1 | awk '{print $1,$5}' | sort -nk2 | tail -n1 | awk '{print $1}')
echo "Result of top: $pid_of_max2"

#!/bin/bash

if [[ -f output44 ]]; then
rm output44
fi

bash task4.sh

current_ppid=0
sum=0
count=0

while read p; do
ppid=$(echo "$p" | awk -F ':' '{print $2}' | awk -F '=' '{print $2}')
if [[ "$ppid" -ne "$current_ppid" ]]; then
avg=$(echo "$sum/$count" | bc -l)
sum=0
count=0
echo "Average_Running_Children_of_ParentID=$current_ppid is $avg" >> output44
current_ppid="$ppid"
fi
echo "$p" >> output44
art=$(echo "$p" | awk -F ':' '{print $3}' | awk -F '=' '{print $2}')
sum=$(echo "$sum+$art" | bc -l) 
let count+=1
done <output4

cat output44 > output4

rm output44

#!/bin/bash

if [[ -f before ]]; then 
rm before
fi
if [[ -f after ]]; then 
rm after
fi
if [[ -f temporary ]]; then
rm temporary
fi

write_size() {
for number in $(ps axo pid | egrep '[0-9]'); do
if [[ -f /proc/$number/status ]]; then
mem=$(cat /proc/$number/status | grep 'VmRSS' | awk '{print $2}')
if [[ -z "$mem" ]]; then
mem=0
fi
echo "$number $mem" >> $1
fi
done
}

write_size before
sleep 60
write_size after

while read p; do
number=$(echo $p | awk '{print $1}')
mem_before=$(echo $p | awk '{print $2}')
mem_after=$(cat after | egrep "^$number" | awk '{print $2}')
diff=$(echo "$mem_after-$mem_before" | bc -l)
cmd=$(ps -o cmd -p $number | tail -n +2)
echo "$number $cmd $diff" >> temporary
done <before

sort -nk3 temporary | tail -n3 | awk '{print $1" : "$2" : "$3}'

rm before after temporary

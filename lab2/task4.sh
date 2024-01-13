#!/bin/bash

if [[ -f output4 ]]; then
rm output4
fi

for number in $(ps -a -x -o pid);
do
if [[ -d /proc/$number ]]; then
PPid=$(cat /proc/$number/status | grep 'PPid' | awk '{print $2}')
sum_exec_runtime=$(cat /proc/$number/sched | grep 'sum_exec_runtime' | awk '{print $3}')
nr_switches=$(cat /proc/$number/sched | grep 'nr_switches' | awk '{print $3}')
ART=$(echo $sum_exec_runtime/$nr_switches | bc -l)
echo "$number $PPid $ART" >> output4
fi
done

sort -nk2 output4 > output44
cat output44 | awk '{print "ProcessID="$1" : ParentProcessID="$2" : Average_Running_Time="$3}' > output4
rm output44

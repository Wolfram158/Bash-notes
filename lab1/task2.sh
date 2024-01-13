#!/bin/bash

result=""

while read line; do
if [[ "$line" == "q" ]]; then
break
fi
result="$result $line"
done < "${1:-/dev/stdin}"

echo "$result"

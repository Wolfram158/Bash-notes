#!/bin/bash

common=0

count() {
for file in "$1"/*; do
if [[ -f "$file" ]]; then
if [[ "$file" == *.log ]]; then
let common+=1
fi
fi
if [[ -d "$file" ]]; then
count "$file"
fi
done
}

count /var/log

echo $common

#!/bin/bash

if [ ! -d ~/.trash ]; then
mkdir ~/.trash
fi

if [ ! -f "$1" ]; then
echo "File does not exist"
exit 0
fi 

complete_path="$PWD/$1"

cd ~

number=0

while [[ -f ".trash/file$number" ]]; do
let number+=1
done

ln "$complete_path" ".trash/file$number"

rm "$complete_path" && echo "$complete_path    file$number" >> ".trash.log"

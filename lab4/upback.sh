#!/bin/bash

[[ -d /home/user/restore ]] || mkdir /home/user/restore

for backup in $(ls /home/user | grep "^Backup-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}$" | sort -r); do
    date_=$(echo $backup | awk -F "-" '{print $2"-"$3"-"$4}')
    date -d date_ > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        for file in $(ls /home/user/$backup); do
            if [[ -f $file && ! $file =~ .[0-9]{4}-[0-9]{2}-[0-9]{2} ]]; then
                cp /home/user/$backup/$file /home/user/restore/$file
            fi
        done
        break
    fi
done

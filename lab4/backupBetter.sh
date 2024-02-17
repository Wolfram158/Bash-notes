#!/bin/bash

current_name() {
DD=$(date +%d)
MM=$(date +%m)
YYYY=$(date +%Y)
echo "$YYYY-$MM-$DD"
}

name=$(current_name)
signal=0
if [[ ! -d /home/user/source ]]; then
  mkdir /home/user/source
fi

for file in $(ls /home/user/); do
    if [[ $file =~ ^Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        date_=$(echo $file | awk -F "-" '{print $2"-"$3"-"$4}')
        date -d $date_ > /dev/null 2>&1
        if [[ $? -eq 0 && -d /home/user/$file ]]; then
            let diff=($(date +%s -d $name)-$(date +%s -d $date_))/86400
            if [[ $diff -le 7 ]]; then
                signal=1
                touch list_of_new
                touch list_of_two
                for unit in $(ls /home/user/source); do
                    find /home/user/$file/$unit > /dev/null 2>&1
                    if [[ $? -eq 1 ]]; then
                        cp /home/user/source/$unit /home/user/$file
                        echo $unit >> list_of_new
                    else
                        size1=$(du -b /home/user/source/$unit | awk '{print $1}')
                        size2=$(du -b /home/user/$file/$unit | awk '{print $1}')
                        if [[ $size1 -ne $size2 ]]; then
                            mv /home/user/$file/$unit /home/user/$file/$unit.$name
                            cp /home/user/source/$unit /home/user/$file/$unit
                            echo "$unit $unit.$name" >> list_of_two
                        fi
                    fi
                done
                echo "$file $name" >> /home/user/backup-report
                cat list_of_new >> /home/user/backup-report
                cat list_of_two >> /home/user/backup-report
                rm list_of_new list_of_two
                break
            fi
        fi
    fi
done

if [[ "$signal" == "0" ]]; then 
    mkdir /home/user/Backup-$name
    echo "Directory Backup-$name was made $name" >> /home/user/backup-report
    for file in $(ls /home/user/source); do
        cp /home/user/source/$file /home/user/Backup-$name/$file
    done
    ls /home/user/source >> /home/user/backup-report
fi

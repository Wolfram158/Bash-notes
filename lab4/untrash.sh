#!/bin/bash

while read line; do
  name=$(echo $line | awk '{NF--; print}')
  name_in_trash=$(echo $line | awk '{print $NF}')
  if [[ "$name" =~ $1$ ]]; then
    echo "Do you want to recover file $name? [y/n]"
    while true; do
      read response </dev/tty
      if [[ "$response" == "y" ]]; then
        while [[ -f "$name" ]]; do
          echo "File $name already exists. Enter new name."
          read new_name </dev/tty
          name=$new_name
        done
        ln "./.trash/$name_in_trash" "$name"
        rm "./.trash/$name_in_trash"
        break
      fi
      if [[ "$response" == "n" ]]; then
        break
      fi
    done
  fi
done <.trash.log

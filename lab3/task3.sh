#!/bin/bash

cp /home/user/lab3/task1.sh ~/task1.sh
echo "*/5 * * * sat ~/task1.sh" > ~/mycron

crontab ~/mycron

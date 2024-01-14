#!/bin/bash
	
while true; do
read LINE
if [[ "$LINE" == "+" ]]; then
kill -USR1 $(cat .pid)
elif [[ "$LINE" == "*" ]]; then
kill -USR2 $(cat .pid)
elif [[ "$LINE" == "TERM" ]]; then
kill -SIGTERM $(cat .pid)
exit
fi
done

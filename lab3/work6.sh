#!/bin/bash

echo $$ > .pid

res=1

add() {
let res+=2
echo $res
}

mul() {
let res*=2
echo $res
}

term() {
echo "Stopped by SIGTERM"
exit
}

trap 'add' USR1
trap 'mul' USR2
trap 'term' SIGTERM

while true; do
sleep 1
done

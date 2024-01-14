#!/bin/bash

current_time() {
date +%d.%m.%Y_%H:%M:%S
}

host="www.net_nikogo.ru"

mkdir ~/test && echo "catalog test was created succesfully" >> ~/report && touch ~/test/$(current_time)
ping -c 1 $host || echo $(current_time) " : host $host was not reached" >> ~/report

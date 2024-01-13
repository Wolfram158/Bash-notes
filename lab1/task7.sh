#!/bin/bash

grep -E -r -o -a "[A-Za-z0-9;.;-;_]+@[A-Za-z0-9]+\.[A-Za-z]{1,10}" /etc | sort -u -t ':' -k2 | awk -F ':' '{print $2}' | paste -sd "," > emails.lst

#!/bin/bash

cat /var/log/anaconda/X.log | awk '{ if ( $3 == "(WW)" ) print }' | awk '{ $3 = "Warning: "; print }' > full.log
cat /var/log/anaconda/X.log | awk '{ if ( $3 == "(II)" ) print }' | awk '{ $3 = "Information: "; print }' >> full.log
cat full.log

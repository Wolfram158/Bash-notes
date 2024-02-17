#!/bin/bash

function run() {
    awk '
       BEGIN { FS="[^a-zA-Z]+" } {
           for (i=1; i<=NF; i++) {
               words[$i]++
           }
       }
       END {
           for (w in words)
                 printf("%3d %s\n", words[w], w)
       } ' | sort -rn | awk '{ if (length($2) >= 4) print }'
}

man bash | run | head -n3

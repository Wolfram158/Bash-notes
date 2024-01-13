#!/bin/bash

man bash | tr ' ' '\n' | awk '{ if ( $1 != "" ) print }' | tr -d '\"' | tr -d '{' | tr -d '}' | tr -d '|' | tr -d '\*' | tr -d '^' | tr -d ':' | tr -d ';' | tr -d '\\' | tr -d '/' | tr -d '.' | tr -d ',' | tr -d '$' | tr -d '(' | tr -d ')' | tr -d '[' | tr -d ']' | tr -d '[0-9]' | sort | uniq -c | awk '{ if ( length($2) >= 4 ) print }' | sort -nk1 | tail -n3

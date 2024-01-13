#!/bin/bash

if [[ "$1" -eq "1" ]]
then nano
elif [[ "$1" -eq "2" ]]
then vi
elif [[ "$1" -eq "3" ]]
then links 
elif [[ "$1" -eq "4" ]]
then 
    : 
else 
echo "Unidentified option"
fi


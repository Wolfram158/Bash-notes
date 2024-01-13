#!/bin/bash

ps ax -u $USER | tail -n +2 | wc -l > output1
ps ax -u $USER | tail -n +2 | awk '{print $1":"$5}' >> output1

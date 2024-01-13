#!/bin/bash

ps -a -x | egrep '/sbin/' | awk '{print $1}' > output2

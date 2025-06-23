#!/bin/bash

# top -bn1 | grep Cpu | sed 's/..,//g' | awk '{print "CPU:", 100 - $5 "%"}'
top -bn1 | grep Cpu | sed 's/..,//g' | awk '{print "CPU:", $2 + $3 + $4 "%"}'

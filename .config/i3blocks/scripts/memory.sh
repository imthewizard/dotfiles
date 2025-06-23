#!/bin/bash

free -h | awk 'NR==2 {print "Memory:", $3, "/", $2}'

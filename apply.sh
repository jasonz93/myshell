#!/bin/bash
# Load functions and run it
for script in `ls funcs/*.sh`
do
    source $script
    `echo $script|awk -F/ '{print $NF}'|sed 's/\(.*\).sh/\1/g'`
done


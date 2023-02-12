#!/bin/bash

# Advent of Code 2018 Day 1 

input="aoc_2018-1.dat"
t=0
declare -A p_t=([0]=1) # Indexed array, we can just
                       #  search the 'keys'
while true; do 
    while IFS= read -r line; do
	let t+=line
	if [ -n "${p_t[$t]}" ]; then
	    echo "Contains" $t
	    break 2
	fi
	p_t+=([$t]=1) # set the key to an arbitrary 
    done < "$input"   #  value
    # echo $t
done

#!/bin/bash

# Advent of Code 2018 Day 2 Part 2

input="aoc_2018-2.dat"

box_ids=()

while IFS= read -r line; do
    box_ids+=($line)
done < "$input" 

for id in "${box_ids[@]}"; do
    for jd in "${box_ids[@]}"; do
	ms=$(./sc $id $jd)
	if [[ ${#ms} -eq $((${#id} - 1)) ]]; then
	    echo $ms
	    break 2
	fi
	#echo $id, $jd
    done
done
	  

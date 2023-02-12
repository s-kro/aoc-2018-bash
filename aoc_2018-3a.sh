#!/bin/bash

# Advent of Code 2018 Day 3 Part 1

input="aoc_2018-3.dat"

declare -A fabric=()

r="^#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)$"

while IFS= read -r line; do
    echo $line
    if [[ $line =~ $r ]]; then
	elf=${BASH_REMATCH[1]}
	s_x=${BASH_REMATCH[2]}
	s_y=${BASH_REMATCH[3]}
	w_x=${BASH_REMATCH[4]}
	w_y=${BASH_REMATCH[5]}
	echo $elf $s_x $s_y $w_x $w_y
	for i in $(seq $(($s_x + 1)) $(($s_x + $w_x))); do
	    echo $i
	done
    else
	echo "Line error: no match"
    fi
done < "$input" 

	  

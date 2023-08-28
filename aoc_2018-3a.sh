#!/bin/bash

# Advent of Code 2018 Day 3 Part 1

input="aoc_2018-3.dat"

declare -A fabric=()
declare -i overlap=0

r="^#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)$"

while IFS= read -r line; do
    if [[ $line =~ $r ]]; then
	elf=${BASH_REMATCH[1]}
	s_x=${BASH_REMATCH[2]}
	s_y=${BASH_REMATCH[3]}
	w_x=${BASH_REMATCH[4]}
	w_y=${BASH_REMATCH[5]}
	#echo $elf $s_x $s_y $w_x $w_y
	for i in $(seq $(($s_x + 1)) $(($s_x + $w_x))); do
	    for j in $(seq $(($s_y + 1)) $(($s_y + $w_y))); do
		if [[ ${fabric[$i,$j]} == "x" ]]; then # Note: x and y are poor
		    overlap+=1                         #  choices for the values for
		    fabric[$i,$j]="y" # already counted # already counted once vs 
		elif [[ ${fabric[$i,$j]} != "y" ]]; then # virgin fabric
		    fabric[$i,$j]="x"
		fi
	    done
	done
    else
	echo "Line error: no match"
    fi
done < "$input" 

echo "Overlapping sq inches: $overlap"	  

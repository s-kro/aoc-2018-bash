#!/bin/bash

# Advent of Code 2018 Day 3 Part 2

input="aoc_2018-3.dat"

declare -A fabric=()

r="^#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)$"

for h in $(seq 1 2); do          # a bit lazy, but we'll just re-read the elves' raw
    while IFS= read -r line; do  #   data to loop through it looking for fabric that's
	if [[ $line =~ $r ]]; then # only been 'written' once
	    elf=${BASH_REMATCH[1]}
	    s_x=${BASH_REMATCH[2]}
	    s_y=${BASH_REMATCH[3]}
	    w_x=${BASH_REMATCH[4]}
	    w_y=${BASH_REMATCH[5]}
	    #echo $elf $s_x $s_y $w_x $w_y
	    v="x"
	    for i in $(seq $(($s_x + 1)) $(($s_x + $w_x))); do
		for j in $(seq $(($s_y + 1)) $(($s_y + $w_y))); do
		    if [[ $h -eq 1 ]]; then # 'setting' the fabric
			if [[ ${fabric[$i,$j]} == "x" ]]; then
			    fabric[$i,$j]="y" # already counted
			elif [[ ${fabric[$i,$j]} != "y" ]]; then
			    fabric[$i,$j]="x" # first count
			fi
		    else # [[ $h -eq 2 ]]; # now 'read' the fabric
			if [[ ${fabric[$i,$j]} == "y" ]]; then
			    v="y" # fabric overlapped at least once 
			    break 2 #  no sense checking the rest of this		   
			fi          #  elf's fabric
		    fi
		done
	    done
	    if [[ $h -eq 2 && $v == "x" ]]; then
		echo "Elf $elf has no overlapped fabric" 
		break
	    fi
	fi
    done < "$input"
done


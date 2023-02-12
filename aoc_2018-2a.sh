#!/bin/bash

# Advent of Code 2018 Day 2 Part 1

input="aoc_2018-2.dat"

c_two=0
c_three=0

while IFS= read -r line; do
   
  #  echo $line
    chars=$(grep -o . <<< $line);
    declare -A cs=()
    for c in $chars; do
	if [ -n "${cs[$c]}" ]; then
	    cs[$c]=$((${cs[$c]} + 1))
	else
	    cs+=([$c]=1)
	fi
    done

    two=0
    three=0

    for i in "${!cs[@]}"
    do
	case ${cs[$i]} in
	    2) two=1;;
	    3) three=1;;
	esac
    done
    c_two=$(($c_two + $two))
    c_three=$(($c_three + $three))
    
done < "$input"   #  value

echo checksum: $(($c_two * $c_three))

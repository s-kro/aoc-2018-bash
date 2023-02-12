#!/bin/bash

input="aoc_2018-1.dat"
t=0

while IFS= read -r line; do
    let t=t+line
done < "$input"

echo $t

#!/bin/bash

make clean-base
for base in 2 3 5 7 11 13 17 19; do
	for nelts in {2,5,10}{,0{,0{,0}}}; do
		BASE=$base NELTS=$nelts make baseline 
	done
done

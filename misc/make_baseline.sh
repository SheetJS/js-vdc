#!/bin/bash

for base in 2 3 5 7 11 13 17 19 23; do
	for nelts in {2,5,10}{,0{,0{,0}}}; do
		OF=./test_files/baseline.$base.$nelts
		if [ ! -e $OF ]; then
			echo $base $nelts
			bash misc/generate_baseline.sh $base $nelts > $OF
		fi
	done
done

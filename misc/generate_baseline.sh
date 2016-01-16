#!/bin/bash
# generate_baseline.sh -- generate test baseline using mathematica
# Copyright (C) 2013-present  SheetJS
# usage: $0 [base:2] [nelts:10]
MCMD=math

if [ -x /Applications/Mathematica.app/Contents/MacOS/MathKernel ]; then
	MCMD=/Applications/Mathematica.app//Contents/MacOS/MathKernel
fi

SCRIPT=test_files/vdc.m
if [ ! -e $SCRIPT ]; then SCRIPT=misc/vdc.m; fi
if [ ! -e $SCRIPT ]; then SCRIPT=vdc.m; fi

$MCMD -script $SCRIPT 7 ${1:-2} ${2:-10} | awk 'NF {print $1 "\t" $2}'


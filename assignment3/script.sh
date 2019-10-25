#!/bin/bash

#By Stephen Szwiec [Stephen@Szwiec.xyz]
#this file performs operations on a file given to it via stdin as argument and saves to the current directory as output.txt

LASTNAME=$(cut -f1 -d"," $1 | tr [:upper:] [:lower:])
FIRSTNAME=$(expand $1 | cut -f2 -d" " | cut -c 1 | tr [:upper:] [:lower:])
OUTPUT=$(paste <(echo "$LASTNAME") <(echo "$FIRSTNAME") -d ''| \
	tr -s '[:space:]' '\n')
echo "$OUTPUT" > ./output.txt

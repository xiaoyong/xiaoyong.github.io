#!/bin/bash

function fibonacci {
	i=$1
	if [ $i -le 1 ]; then
		echo "$1"
	else
		(( --i ))
		first=$( fibonacci $i )
		(( --i ))
		second=$( fibonacci $i )
		echo $(( first + second ))
	fi
}

if [ -z $1 ]; then
	echo "Usage: $0 number"
else
	result=$( fibonacci $1 )
	echo "F($1) = $result"
fi

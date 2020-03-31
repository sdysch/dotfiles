#!/bin/bash
for file in i3blocks/scripts/*; do
	test=$(echo $file | sed "s/i3blocks\/scripts\///g")
	which $test
done

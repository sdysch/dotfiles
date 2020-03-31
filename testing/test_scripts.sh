#!/bin/bash
for file in scripts/*; do
	test=$(echo $file | sed "s/scripts\///g")
	which $test
done

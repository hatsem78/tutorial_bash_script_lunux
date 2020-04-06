#!/bin/bash -x

read -p "Path to be added: " path

if [ "$path" = "/home/mike/bin" ]; then
	echo $path >> $PATH
	echo "new path: $PATH"
else
	echo "did not modify PATH"
fi
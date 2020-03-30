#!/bin/bash

string_a="LINUX"
string_b="GNU"

echo "Are $string_a and $string_b strings equeal?"

[ $string_a = $string_b ]; echo $?

num_a=100
num_b=100

echo "Is $num_a equal to $num_b"

[ $num_a -eq $num_b ]; echo $?
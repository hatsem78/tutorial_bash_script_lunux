#!/bin/bash

# this bash scripo is used to backup user's home directory to /tmp/

user=$(whoami)
input=/home/${user}/trabajos/tutorial_bash_script_lunux
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

tar -czf $output $input 2> /dev/null

echo "Backup of $input completed! Detail about the output backup file:"

ls -l $output

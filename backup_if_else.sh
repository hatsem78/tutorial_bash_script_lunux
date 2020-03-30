#!/usr/bin/env bash

# this script is used to backup user's home directory to /tmp/
if [ -z $1 ]; then
    user=$(whoami)
else
    if [ ! -d "/home/$1" ]; then
        echo "Requested $1 user home directory is not exist."
        exit 1
    fi
    user=$1
fi


input=/home/${user}/trabajos/tutorial_bash_script_lunux
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

function total_files {
    find $1 -type f | wc -l
}

function total_directores {
    find $1 -type d | wc -l
}


function total_archived_directories {
    tar -tzf $1 | grep /$ | wc -l
}


function total_archived_files {
    tar -tzf $1 | grep -v /$ | wc -l
}


tar -czf $output $input 2> /dev/null

src_files=$(total_files $input)
src_directories=$(total_archived_directories $output)

arch_files=$(total_archived_files $output)
arch_directories=$( total_archived_directories $output )

echo "Files to be included: $src_files"
echo "Directories to be included: $src_directories"
echo "Files archived: $arch_files"
echo "Directories archived: $arch_directories"


if [ $src_files -eq $arch_files ]; then
    echo "Backup of $input completed!"
    echo "Details about the output backup file:"
    ls -l $output
else
    echo "Backup output of $input faild"
fi
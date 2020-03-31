#!/bin/bash

function backup {

     if [ -z $1 ]; then
        user=$(howami)
    else
        if [ ! -d "/home/$1" ]; then
            echo "Requested $1 user home directory not exist"
            exit 1
        fi
        user=$1
    fi

    input=/home/${user}/${2}
    output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

    function total_files {
        find $1 -type f | wc -l
    }

    function total_directories {
        find $1 -type d | wc - l
    }

    function total_archived_directories {
        tar -tzf $1 | grep /$ | wc -l
    }

    function total_archived_files {
        tar -tzf $1 | grep -v /$ | wc -l
    }


    tar -czf $output $input 2> /dev/null

    src_files=$( total_files $input )
    scr_directories=$( total_archived_directories $input )

    arch_files=$( total_archived_files $output )
    arch_directories=$( total_archived_directories $output )

    echo "########## $user ##########"
    echo "Files to be included: $src_files"
    echo "Directories to be included: $src_directories"
    echo "Files archived: $arch_files"
    echo "Directories archived: $arch_directories"

    if [ $src_files -eq $arch_files ]; then
        echo "Backup of $input completed!"
    	echo "Details about the output backup file:"
       	ls -l $output
    else
    	echo "Backup of $input failed!"
    fi

    exit 1

}


path=$(pwd)

#for directory in $( ls $1 );
#do
#    backup $(whoami) "trabajos/${directory}"
    #backup $(whoami) $directory
#done;
for directory in $*; do
    echo $directory
done;
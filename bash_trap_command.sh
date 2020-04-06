#!/bin/bash
LOCK="/tmp/rsync.lock"
# bash trap command
if [ ! -e $LOCK ]; then
    trap bashtrap INT
    trap "rm -f $LOCK; exit" TERM EXIT
    # bash clear screen command
    clear;
    # bash trap function is executed when CTRL-C is pressed:
    # bash prints message => Executing bash trap subrutine !
    bashtrap()
    {
        echo "CTRL+C Detected !...executing bash trap !"
    }
    # for loop from 1/10 to 10/10
    for a in `seq 1 10`; do
        echo "$a/10 to Exit."
        sleep 1;
    done
    echo "Exit Bash Trap Example!!!"


    touch $LOCK
    rsync -avz foo bar
    rm $LOCK
    trap - TERM EXIT
else
   echo "rsync ya se está ejecutando"
fi
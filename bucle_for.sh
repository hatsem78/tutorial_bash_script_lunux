#!/usr/bin/env bash

# estamos en el directorio actual con el comando ls pwd

for i in $( ls $pwd );
do
     echo -n  " $i is " ; echo $i | wc -c
done
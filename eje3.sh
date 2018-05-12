#!/bin/bash
for ((i=$1;i<$2;i++))
#for i in `seq $1 $2` 
do
        # si factor devuelve solo dos palabras es primo
        # factor 5 devuelve 5: 5
        # factor 6 devuelve  6: 2 3
        if [ $( factor $i | wc -w ) -eq 2 ];then
                echo $i;
        fi;
done



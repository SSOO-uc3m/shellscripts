#!/bin/bash
for i in $*; do
        SH=$(grep -e "^$i:" /etc/passwd | cut -d :  -f7)
        if [ -n " $SH" ]; then
                echo $i: $SH;
        else
                 echo -ERROR -$i : no existe el usuario
        fi;
 done


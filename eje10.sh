#!/bin/bash

# VARIABLES ###########################
readonly array_tipo_usu=(\* ! !! otro)
array_contador=(0 0 0 0)
n_linea=0
encontrado=0

# CODIGO ###########################
while read linea
do
                passwd=`echo  ${linea} | cut -d: -f2 `
                i=0
                while [ $i -lt ${#array_tipo_usu[@]} ]
                do
                        #if [ \{$var} = \{${array_tipo_usu[$i]}} ]
                        if [ "$passwd" = "${array_tipo_usu[$i]}" ]
                        then
                                encontrado=1
                                array_contador[$i]=$((array_contador[$i]+1))
                                break
                        else
                                i=$((i+1))
                                encontrado=0
                        fi
                done
                if [ $encontrado -eq 0 ]
                then
                                array_contador[3]=$((array_contador[3]+1))
                fi
done < shadow


echo "Resultados"
echo "----------"
i=0
while [ $i -lt ${#array_tipo_usu[@]} ]
do
        echo \{${array_tipo_usu[$i]}} = ${array_contador[$i]}
        i=$((i+1))
done
         echo \{${array_tipo_usu[0]}} Usuarios deshabilitados = ${array_contador[0]}
         echo \{${array_tipo_usu[1]}} Usuarios sin Contraseña = ${array_contador[1]}
         echo \{${array_tipo_usu[2]}} Usuarios con Contraseña expirada = ${array_contador[2]}
         echo \{${array_tipo_usu[3]}} Usuarios con Contraseña = ${array_contador[3]}



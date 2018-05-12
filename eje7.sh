#!/bin/bash
if test $# -lt 2
then
	echo "Se deben introducir dos parametros como minimo."
fi

if test -d $1
then
	destino=$1
# quitamos $1 de la lista de argumentos
shift
	for i in $*
	do
		if test -f $i
		then
			cp $i $destino
		else
			echo "El parametro no es un fichero."
		fi

	done
else
	echo "El primer parámetro no es un directorio."
fi


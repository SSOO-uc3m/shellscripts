#!/bin/bash
lineasArchivo1=$(wc -l $1 | cut -d' ' -f1)
lineasArchivo2=$(wc -l $2 | cut -d' ' -f1)

if test $lineasArchivo1 -gt $lineasArchivo2
then
	echo "El texto con mas lineas es el primero."
else
	if test $lineasArchivo2 -eq $lineasArchivo2
	then
		echo â"Los dos textos tienen las mismas lineas."
	else
		echo  "El texto con mas lineas es el segundo."
	fi
fi


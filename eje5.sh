#!/bin/bash
while who | grep $1 > /dev/null
do
	echo �"El usuario $1 está conectado"
	read -p "¿Deseas salir?" continuar
	if [[ $continuar = 's' ]]
	#if [ "$continuar" = "s" ]
	then
		break
	fi
	sleep 10
done


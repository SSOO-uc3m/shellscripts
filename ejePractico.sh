#!/bin/bash
# creamos una variable ‘creados’ donde guardaremos los usuarios que se han creado correctamente
creados=0
# creamos una variable ‘nocreados’ donde guardaremos los usuarios que NO se han creado correctamente
nocreados=0
# creamos una variable ‘numgrupos’ donde guardaremos cuantos grupos hemos creado 
numgrupos=0
# si el número de argumentos introducido es menor que 1, es decir, no se han introducido argumentos mostramos mensaje
if [ $# -lt 1 ]; then
	echo Número de argumentos incorrecto
# si no, si el número ode argumentos es mayor que 1 entonces motramos mensaje
elif [ $# -gt 1 ]; then
	echo Número de argumentos incorrecto
# si se ha introducido un solo argumento comprobamos si es “dpto.” o “estado civil”
elif [ $1 == "dpto" -o "$1" == "estadocivil" ]; then
# si el primer argumento es la palabra “dpto.” guardamos en la variable “posición” la posición del campo que deberemos tomar donde está el campo departamentos del fichero empleados, en esta caso en la posición 10
	if [ $1 == "dpto" ]; then
		posicion=10;
	elif [ $1 == "estadocivil" ]; then
		posicion=13;
	fi
#guardamos en la variable ‘listadogrupos’ los departamentos o estados civiles del fichero empleados.txt (cut -d# -f ${posición}), saltándonos la primera línea del fichero (tail -m +2, sustituyendo los espacios por _ (tr “ “ “_”, quitando los valores repetidos (sort -u) y sustituyendo las mayúsculas por minúsculas tr [A-Z] [a-z]
	listadogrupos=`tail -n +2 empleados.txt | cut -d# -f ${posicion} | tr " " "_" | sort -u | tr [A-Z] [a-z]`
# recorremos todos los grupos que tenemos en la variable listadogrupos
	for i in $listadogrupos
	do
		#vamos contando el número de grupos creados (los que llevamos más 1)
		numgrupos=`expr $numgrupos + 1`
		#creamos el grupo empezando por la letra g
		echo groupad g$i
	done
	#guardamos en variable ‘listadni’ todos los dni del ichero para luego utilizarlos para recorrer dicho fichero (a + alternativas=
	listadni=`tail -n +2 empleados.txt | cut -d# -f1`
	#recorremos todos los dni que tenemos almacenados en la variable listadni
	for i in $listadni
	do
		#guardamos en variable ‘empleado’ la línea del fichero con el dni actual
		empleado=`grep -E "^$i" empleados.txt | tr [A-Z] [a-z]`
		#guardamos en variable ‘nombre’ el campo nombre quitándole los espacios
		nombre=`echo $empleado | cut -d# -f4 | tr -d " "`
		#guardamos en variable ‘apellido1’ el campo apellido1 quitándole los espacios
		apellido1=`echo $empleado | cut -d# -f2 | tr -d " "`
		#guardamos en variable ‘apellido2’ el campo apellido2 quitándole los espacios
		apellido2=`echo $empleado | cut -d# -f3 | tr -d " "`
		#guardamos en variable ‘milogin’ el login del nuevo usuario formado por letra1-nombre.primer-apellido.segundo-apellidoa
		
		milogin=`echo $nombre | cut -c1`.${apellido1}.${apellido2}
 	        #guardamos en variable ‘dia’ el campo día de nacimiento
		dia=`echo $empleado | cut -d# -f5`
		#guardamos en variable ‘mes el campo mes de nacimiento
		mes=`echo $empleado | cut -d# -f6`
		#guardamos en variable ‘anyo el campo año de nacimiento
		anyo=`echo $empleado | cut -d# -f7`
		#guardamos en variable ‘grupo’ el campo  correspondiente al dprto. o estado civil, sustituyendo " " por _
		grupo=`echo $empleado | cut -d# -f${posicion} | tr " " "_"`
		# creamos el usuario con los datos que nos piden
		#useradd -c "$nombre $apellido1 $apellido2" -g g$grupo -s /bin/bash -e "2017/$mes/$dia" $milogin 2 >> log_creacion.txt
		
		echo useradd -c "$nombre $apellido1 $apellido2" -g g$grupo -s /bin/bash -e "2017/$mes/$dia" $milogin 
		if [ $? -eq 0 ]; then
			creados=`expr $creados + 1`
		else
			nocreados=`expr $nocreados + 1`
		fi
		# ponemos la clave al usuario recien creado
                echo passwd $milogin Op0s2016	
          	# (echo Op0s2016; echo Op0s2016) | passwd $milogin
	done
	# mostramos los resúmenes que nos pedían tutilizando las variables creadas al principio
	echo Número de departamentos/estados $numgrupos
	echo Número de empleados creados correctamente:$creados
	echo Número de empleados no creados: $nocreados
	else
		echo Argumento incorrecto
fi



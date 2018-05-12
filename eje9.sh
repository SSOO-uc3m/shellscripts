clear
echo "################AGENDA#################"
echo "#1.- ANADIR			    #"
echo "#2.- BUSCAR			    #"
echo "#3.- LISTAR			    #"
echo "#4.- ORDENAR			    #"
echo "#5.- BORRAR       		    #"
echo "#6.- BORRAR AGENDA		    #"
echo "#######################################"
echo "Introduzca opcion"
read opcion

case $opcion in
1)	echo "Nombre"
	read nombre
	echo "Correo"
	read correo
	echo "Tfono"
	read tfno
	echo "$nombre:$correo:$tfno" >> agenda
	echo "Entrada anadida";;
2) 	if test ! -f agenda
	then 
		echo "No existe agenda"	
	else
		echo "#1.- Nombre		    "
		echo "#2.- Tfno			    "
		read otra
		case $otra in
		1) 	echo "Nombre"
			read busqueda
		grep $busqueda agenda;;
		2) 	echo "Tfno"
			read busqueda
		grep "$busqueda" agenda;;
		*)	echo "Opcion incorrecta"
		esac
   	fi;;
3)	   if test ! -f agenda
  	then
		echo "No existe el fichero agenda"
 	else
		cat agenda
	fi;;
4)	 if test ! -f agenda
	 then
		echo "No existe el fichero agenda"
 	else
		sort agenda
	fi;;
5)	if test ! -f agenda
	then
		echo "No existe el fichero agenda"
	else
		rm fich_aux 2>/dev/null
		echo "Introduce en nombre a borrar"
		read borrar
		while read linea
		do
			nombre=`echo  ${linea} | cut -d: -f1 `
			if [ "$borrar" = "$nombre" ]
			then
				echo "Se borra elemento: $borrar"
				# No se escribe la linea en un fichero auxiliar
			else
				echo $linea >> fich_aux
			fi	
		done < agenda
		mv fich_aux agenda
	fi;;
6)	if test ! -f agenda
	then
		echo "No existe el fichero agenda"
	else
		rm agenda
	fi;;
*)	echo  "opcion incorrecta"
esac


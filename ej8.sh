clear
echo "################MENU#################"
echo "#1.- CREAR USUARIO		    #"
echo "#2.- BORRAR USUARIO		    #"
echo "#3.- LISTA PROCESOS USUARIO	    #"
echo "#4.- CONEXION USUARIO		    #"
echo "#######################################"
echo "Introduzca opcion"
read opcion

case $opcion in
1)	echo "Nombre USUARIO"
	read nombre
	echo "HOME USUARIO"
	read dir_home
	echo "GRUPO"
	read grupo
	echo "Shell"
	read interprete
	groupadd $grupo 2>/dev/null
	useradd ‚-d $dir_home ‚-m ‚-g $grupo ‚-s $interprete $nombre
	echo "Usuario anadido."
	passwd $nombre;;
2) 	echo "Nombre USUARIO"
	read nombre
	if grep $nombre /etc/passwd
	then 
		userdel $nombre	
	else
		echo "El usuario no existe en el Sistema"
   	fi;;
3)      echo "Nombre USUARIO"
        read nombre
	if grep $nombre /etc/passwd
	then 
		ps -u $nombre	
	else
		echo "El usuario no existe en el Sistema"
   	fi;;
4)      echo "Nombre USUARIO"
        read nombre
	if who |grep $nombre 
	then 
		echo "El usuario est√° conecta"	
	else
		echo "El usuario no est√° conectado"
   	fi;;
*)	echo  "opcion incorrecta"
esac


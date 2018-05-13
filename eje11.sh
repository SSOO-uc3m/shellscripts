while IFS='' read -r line || [[ -n "$line" ]]; do
	echo $line
done < bienvenida.txt

read -n 1 -s -r -p "Pulse cualquier tecla para continuar "

cat licencia.txt
echo -e "\nIntroduzca S si acepta la licencia"
read licencia
if [ $licencia == 'S' ]
then
    echo "Licencia aceptada."
else
    echo "No has aceptado la licencia. Saliendo."
    exit 1
fi
DIRINSTAL="/tmp/maravil"
echo "Escribe el nombre del directorio donde instalar o INTRO para el directorio por defecto"
read directorio
if [ -z "$directorio" ]; then
    echo
else
    DIRINSTAL=$directorio
fi
echo "El directorio de instalación será $DIRINSTAL"
if [ -d $DIRINSTAL ]
then
    echo "El directorio ya existe. Se instalaré el programa en él. ¿Da usted su permiso?"
    read resdir
    if [[ $resdir == 'S' ]]
    then       
        echo "Se van a copiar los archivos."
    else
        echo "Si no da usted permiso, salimos."
        exit 3
    fi
else
    echo "El directorio no existe. Vamos a crearlo. Pulse S para crearlo. ¿Da usted su permiso?"
    read resdir
    if [[ $resdir == 'S' ]]
    then
        mkdir $DIRINSTAL       
        if [[ $? != 0 ]]
        then
            echo "Error al crear el directorio."
            exit 2
        fi
    else
        echo "Si no da usted permiso, salimos."
        exit 3
    fi
fi
cp maravil.py LEAME manual.txt $DIRINSTAL

if [[ $? == 0 ]]
then
    echo "Instalación exitosa"
else
    rm -r $DIRINSTAL
fi


#!/bin/bash

#Script avanzado de José Ángel

# Ejecutar una copia de seguridad
function copiaseguridad()
{
    fecha=`date +%d-%m-%Y_%H:%M`
    test=`ls -l . | grep copia_ | wc -l`
	lim=1
	#Como límite de copias pondremos 1
    if [ $test -le $lim ];then
        zip -r copia_$fecha.zip usuarios.csv &>/dev/null
        echo "Se ha creado la copia de seguridad" >> logs.log
    else

        borracopia=`ls -tr copia_* | head -n1 | xargs rm -R`
		$borracopia
	zip -r copia_$fecha.zip usuarios.csv &>/dev/null
    fi

}

# Dar de alta a un usuario
function altausuario()
{
	read -p "Debe teclear el nombre " nombre
	read -p "Debe teclear el primer apellido " primerapellido
	read -p "Debe teclear el segundo apellido " segundoapellido
	read -p "Debe teclear el dni " dni
	echo "Esta ha sido la informacion tecleada: $nombre: $primerapellido: $segundoapellido: $dni: " >> logs.log

	if grep -w $nombre usuarios.csv &>/dev/null; then
	echo "El usuario $nombre ya existe" 
	else
		#Lo siguiente lo realizamos para generar un nombre de usuario, en mi caso con mi informacion seria jfergon678
		usuario=$(echo $nombre | cut -c1 )
		usuario=$usuario$(echo $primerapellido | cut -c1,2,3 )
		usuario=$usuario$(echo $segundoapellido | cut -c1,2,3 )
		usuario=$usuario$(echo $dni | cut -c6,7,8 )
		usuario=$(echo $usuario | tr '[:upper:]' '[:lower:]' )
		echo "$nombre:$primerapellido:$segundoapellido:$dni:$usuario" >> usuarios.csv
		echo "El usuario ya ha sido dado de alta"
		echo "El usuario es $usuario"
		echo "Usuario $nombre:$primerapellido:$segundoapellido:$dni:$usuario" >> logs.log
	fi
}

# Dar de baja a un usuario
function bajausuario()
{
	#Para realizar la baja a un usuario antes deberemos instalar el sponge que se hace con apt-get instal moreutils
    read -p "Escribe el usuario al que dar de baja " nombreusuario
    if grep $nombreusuario usuarios.csv 1>/dev/null; then
	#Cuando menciono aqui el sponge quiere decir el moreutils instalado previamente
    grep -wv $nombreusuario usuarios.csv 2>/dev/null | sponge usuarios.csv
    echo "El usuario $nombreusuario ha sido dado de baja"
    echo "Se ha borrado el usuario $nombre:$ap1:$ap2:$dni:$usuario" >> logs.log
    else
        echo "El usuario no existe en el sistema"
        menu
    fi
}

# Mostrar los usuarios
function mostrarusuarios()
{
	echo "Te mostrare los usuarios del sistema"
	cat usuarios.csv | sort -k9
}

# Mostrar logs del sistema

function mostrarlogs()
{
	cat logs.log
}

# Salir del programa

function salir()
{
	echo "Saliendo del programa"
	exit 0
}

# Menú
function menu()
{
	echo "1) Ejecutar una copia de seguridad"
	echo "2) Dar alta usuario"
	echo "3) Dar baja usuario"
	echo "4) Mostrar usuario"
	echo "5) Mostrar log del sistema"
	echo "6) Salir del programa"

	read -p "Usted debe seleccionar una de las opciones " opcion

	case $opcion in
	1)copiaseguridad
	;;
	2)altausuario
	;;
	3)bajausuario
	;;
	4)mostrarusuarios
	;;
	5)mostrarlogs
	;;
	6)salir
	;;
esac
}
menu

#!/bin/bash
read -p "Introduzca el nombre del usuario: " usuario
if [ -z $usuario ]; then
	usuario=$USER
fi

if [ $usuario = -list ]; then
	echo "Listado de usuarios"
	echo
	grep -w /bin/bash$ /etc/passwd | cut -d: -f1 | grep -v root | sort
	echo
elif ! id $usuario &> /dev/null; then
	echo "El usuario $usuario no existe en el sistema"
else
	echo "Mostramos la informacion del usuario $usuario"
	echo
	echo "UID:	$(grep -w ^$usuario /etc/passwd | cut -d: -f3)"
	echo "GID:	$(grep -w ^$usuario /etc/passwd | cut -d: -f4)"
	echo "Home:	$(grep -w ^$usuario /etc/passwd | cut -d: -f6)"
fi

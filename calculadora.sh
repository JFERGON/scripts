#!/bin/bash
falg="1"
	while [ "$falg" -eq "1" ]
do
	echo "1)Sumar"
	echo "2)Restar"
	echo "3)Dividir"
	echo "4)Multiplicar"
	echo "5)Salir"
		read check
		if [ "$check" -eq "1" ]
		then
	echo "Ingrese el primer número:"
		read a
	echo "Ingrese el segundo número:"
		read b
			resultado=`expr $a + $b`
	echo "El resultado es:$resultado"
		elif [ "$check" -eq "2" ]
		then
	echo "Ingrese el primer número:"
		read a
	echo "Ingrese el segundo número:"
		read b
			resultado=`expr $a - $b`
	echo "El resultado es:$resultado"
		elif [ "$check" -eq "3" ]
		then
	echo "Ingrese el primer número:"
		read a
	echo "Ingrese el segundo número:"
		read b
			resultado=`expr $a \* $b`
	echo "El resultado es:$resultado"
		elif [ "$check" -eq "4" ]
		then
	echo "Ingrese el primer número:"
		read a
	echo "Ingrese el segundo número:"
		read b
			resultado=`expr $a / $b`
	echo "El resultado es:$resultado"
		else
falg="0"
fi
done

#!/bin/bash
read -p "Introduzca la base: " base
read -p "Introduzca el exponente: " exponente
cont=1
acum=1

while [ $cont -le $exponente ]
do
	acum=$(($acum*$base))
	cont=$(($cont+1))
done
echo "$base elevado a $exponente es: $acum"

opt="S"
while [ $opt =="S" ]
do

function potencia { 
	read -p "¿Quieres continuar?(S/N)" opt
}
done

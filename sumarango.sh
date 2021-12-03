#!/bin/bash
read -p "Introduce el primer digito: " numero
read -p "Introduce el segundo digito: " numero
numero=0
while [ $numero -gt 0 ]
do
     rem=`expr $numero %10`
     suma=`expr $suma +rem`
     numeros=`expr $numero / 10`
done
echo "La suma de los digitos es: $suma"
exit 0

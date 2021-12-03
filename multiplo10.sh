#!/bin/bash

if [ $# -eq 1 ]
then
  resto=$(($1%10))
    if [ $resto -eq 0 ]
      then
      echo "El número que has introducido es múltiplo de 10"
      else
      echo "El número que has introducido no es múltiplo de 10"
      fi
else
      echo "No has introducido ningun número"
fi

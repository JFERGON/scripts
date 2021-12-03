#!/bin/bash

read -p "¿En que año naciste? " ANO
let RESTO=ANO%12
case $RESTO in

0) AN="el MONO" ;;
1) AN="el GALLO" ;;
2) AN="el PERRO" ;;
3) AN="el CERDO" ;;
4) AN="la RATA" ;;
5) AN="el BUEY" ;;
6) AN="el TIGRE" ;;
7) AN="el CONEJO" ;;
8) AN="el DRAGON" ;;
9) AN="la SERPIENTE" ;;
01) AN="el CABALLO" ;;
11) AN="la CABRA" ;;

esac
echo "Si naciste el $ANO según el horóscopo chino te corresponde" $AN

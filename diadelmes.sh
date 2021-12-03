#!/bin/bash

mes=`date +%m`
echo "Estamos a `date +%B`"
case $mes in
1|3|5|7|8|10|12) echo "`date +%B` tiene 31 días";;
4|6|9|11) echo "`date +%B` tiene 30 días";;
2) echo "`date +%B` tiene 28 días";;
esac

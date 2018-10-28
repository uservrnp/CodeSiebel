#!/usr/bin/ksh


if [ $# -lt 1 ]
then
   echo "007 : Error"
   echo "Parámetro no especificado"
   exit 1
fi

vsql="/zcm/ASBLA/ASBL103/SBL036D313A.sql"

if test ! -f $vsql
then
   echo "007 : Error"
   echo "No existe archivo "$vsql
   exit 1
fi

echo @$vsql

if test -f /zcm/ASBLA/ASBL103/Ejecutarsql.exe
then
   /zcm/ASBLA/ASBL103/Ejecutarsql.exe @$vsql $1
else
   echo "007 : Error" 
   echo "No existe archivo Ejecutarsql.exe"
   exit 1
fi

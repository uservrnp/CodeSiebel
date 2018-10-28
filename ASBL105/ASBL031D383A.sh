#!/usr/bin/ksh
AMBIENTE="E"

GRUPO_SBL=$AMBIENTE"SBLA/"
GRUPO=$AMBIENTE"SBL105/"
RUTA="/zcm/"$GRUPO_SBL$GRUPO
ARCHIVO_SQL="SBL031D383A.sql"

if [ $# -lt 1 ]
then
   echo "007 : Error"
   echo "Parámetro no especificado"
   exit 1
fi

vsql=$RUTA$ARCHIVO_SQL

if test ! -f $vsql
then
   echo "007 : Error"
   echo "No existe archivo "$vsql
   exit 1
fi

echo @$vsql

EXE=$RUTA"Ejecutarsql.exe"
if test -f $EXE
then
   $EXE @$vsql $1
else
   echo "007 : Error" 
   echo "No existe archivo Ejecutarsql.exe"
   exit 1
fi

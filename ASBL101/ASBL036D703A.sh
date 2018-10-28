#!/usr/bin/ksh

  

if [ $# -lt 1 ]
then
   echo "007 : Error"
   echo "Par�metro no especificado"
   exit 1
fi
 
vsql="/zcm/ASBLA/ASBL101/SBL036D703A.sql"
 
if test ! -f $vsql
then
   echo "007 : Error"
   echo "No existe archivo "$vsql
   exit 1
fi
 
echo @$vsql
 

if test -f /zcm/ASBLA/ASBL101/Ejecutarsql.exe
then
   /zcm/ASBLA/ASBL101/Ejecutarsql.exe @$vsql $1
else
   echo "007 : Error" 
   echo "No existe archivo Ejecutarsql.exe"
   exit 1
fi
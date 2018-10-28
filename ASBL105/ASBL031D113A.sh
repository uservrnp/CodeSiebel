#!/usr/bin/ksh

if [ $# -lt 1 ]
then
   echo "007 : Error"
   echo "Parámetro no especificado"
   exit 1
fi

if test -f /zcm/ASBLA/ASBL105/Generator.class
then
echo "inicio"
   java -classpath /zcm/ASBLA/ASBL105/ Generator.class /zcm/ASBLA/ASBL105/PlantillaInterfaz/filesCtl.txt /zcm/ASBLA/ASBL105/ -dia .txt $1   
echo "ok"

else
   echo "007 : Error" 
   echo "No existe archivo Generator.class"
   exit 1
fi

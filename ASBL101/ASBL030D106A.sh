#!/usr/bin/ksh
 

 

if [ $# -lt 1 ]
then
   echo "007 : Error"
   echo "Parámetro no especificado"
   exit 1
fi
 

if test -f /zcm/ASBLA/ASBL101/Generator.class
then
   java -classpath /zcm/ASBLA/ASBL101/ Generator.class /zcm/ASBLA/ASBL101/PlantillaInterfaz/filesCtl.txt /zcm/ASBLA/ASBL101/ -dia .txt $1
   java -classpath /zcm/ASBLA/ASBL103/ Generator.class /zcm/ASBLA/ASBL103/PlantillaInterfaz/filesCtl.txt /zcm/ASBLA/ASBL103/ -dia .txt $1
else
   echo "007 : Error" 
   echo "No existe archivo Generator.class"
   exit 1
fi



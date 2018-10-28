#!/usr/bin/ksh
#ejecutamos SQL Loader

#----------------------------------------------------------------------------------------------------------------------------#
PATH_DATA="/zcm/ASBLA/ASBL105/"                                                     #-Directorio con los archivos generados
#----------------------------------------------------------------------------------------------------------------------------#
PATH_ENTRADA="/var/data/sbl/entrada/"                                                  #-Directorio con los archivos generados
#----------------------------------------------------------------------------------------------------------------------------#
PATH_CONECCION="/u01/sbl/bachero/"								#-Directorio de coneccion
#----------------------------------------------------------------------------------------------------------------------------#
BD_CONEXION=`cat $PATH_CONECCION".passet"` 						#-Lectura de Conneccion


if [ $# -lt 1 ]
then
 	exit
else
	NOMBREARCHIVO="sblp-rm-"$1".txt"
	if test -f $PATH_ENTRADA$NOMBREARCHIVO
	then
		sqlldr $BD_CONEXION data=$PATH_ENTRADA$NOMBREARCHIVO control=$PATH_DATA/CSBL031D109A.ctl log=$PATH_DATA/CSBL031D109A.log bad=$PATH_DATA/CSBL031D109A.bad ROWS=1000 direct=true
	else
		echo "007 : Warning"		
		echo "Warning en Sqlldr no hay archivo de rm="$PATH_ENTRADA$NOMBREARCHIVO
		exit
	fi  				  
fi
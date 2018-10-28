#!/bin/bash
#!/usr/bin/ksh

#----------------------------------------------------------------------------------------------------------------------------#
PATH_DATA="/zcm/ASBLA/"										#-Directorio con los archivos generados
PATH_LOG="/zcm/ASBLA/logs/log/"								#-Directorio con los archivos logs LOG
PATH_BAD="/zcm/ASBLA/logs/bad/"								#-Directorio con los archivos Resumen BAD
PATH_DIS="/zcm/ASBLA/logs/discard/"							#-Directorio con los archivos Resumen DISCARD
PATH_CONTROL="/zcm/ASBLA/control"							#-Directorio con los archivos control CTL

PATH_SQL="/zcm/ASBLA/ASBL102C"
PATH_ORIGEN="/var/data/sbl/entrada/lead/"
PATH_DESTINO="/var/data/sbl/entrada/lead/backup/"
PATH_ORIGEN_TEMP="/var/data/sbl/entrada/lead/temp/"

#----------------------------------------------------------------------------------------------------------------------------#
PATH_ENTRADA="/var/data/sbl/entrada/lead/"					#-Directorio con los archivos generados
#----------------------------------------------------------------------------------------------------------------------------#
PATH_CONECCION="/u01/sbl/bachero/"							#-Directorio de coneccion
#----------------------------------------------------------------------------------------------------------------------------#
BD_CONEXION=`cat $PATH_CONECCION".passet"` 					#-Lectura de Conneccion

DD=`date +%d`
MM=`date +%m`
YY=`date +%Y`
hh=`date +%H`
mm=`date +%M`
ss=`date +%S`

date +%H%M%S

resultado=`sqlplus -s $BD_CONEXION << EOF
set serveroutput on
set feedback off
set head off
EXEC EXTERNO.XPKG_IB_SBLP_PROCESO.XSP_IB_BUSCA_FLGBLOQUEO;
EXIT;
EOF`

if [ $resultado == "1" ]; then

	sqlplus $BD_CONEXION @$PATH_SQL/ASBL036D106A.sql;

	cd $PATH_ORIGEN
	for ARCHIVO in *bloqueolead*
	do
		NOMBREARCHIVO=$ARCHIVO
		if test -f $PATH_ORIGEN$NOMBREARCHIVO
		then
			cp -rfp $PATH_ORIGEN$NOMBREARCHIVO $PATH_ORIGEN_TEMP$NOMBREARCHIVO
		else
			echo "007 : Warning"		
			echo "No se puede mover el archivo ="$PATH_ORIGEN_TEMP$NOMBREARCHIVO
			exit
		fi  				  
	done

	cd $PATH_ORIGEN_TEMP
	for ARCHIVO in *bloqueolead*
	do
		NOMBREARCHIVO=$ARCHIVO
		if test -f $PATH_ORIGEN_TEMP$NOMBREARCHIVO
		then
			sqlldr $BD_CONEXION data=$PATH_ORIGEN_TEMP$NOMBREARCHIVO control=$PATH_CONTROL/carga_lead.ctl log=$PATH_LOG${NOMBREARCHIVO:0:15}"_carga_lead.log" bad=$PATH_BAD${NOMBREARCHIVO:0:15}"_carga_lead.bad" discard=$PATH_DIS${NOMBREARCHIVO:0:15}"_carga_lead.dsc" ROWS=500 direct=true
			cp -rfp $PATH_ORIGEN_TEMP$NOMBREARCHIVO $PATH_DESTINO${NOMBREARCHIVO:0:29}"_"$YY$MM$DD"_"$hh$mm$ss".txt"
		else
			echo "007 : Warning"		
			echo "Warning en Sqlldr no hay archivo de bloqueo leads="$PATH_ORIGEN_TEMP$NOMBREARCHIVO
			exit
		fi
	done
else
	echo "El proceso todavia no termina Revisar: $resultado"
fi

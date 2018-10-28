#!/usr/bin/ksh

#ejecutamos SQL Loader
AMBIENTE="E"
IP_ORIGEN="130.30.2.86"

GRUPO_SBL=$AMBIENTE"SBLA"
GRUPO=$AMBIENTE"SBL105"

# Directorio con los archivos generados
PATH_DATA="/zcm/"$GRUPO_SBL/$GRUPO/

#-Directorio con los archivos generados
PATH_ENTRADA="/var/data/sbl/entrada/"

#-Directorio de coneccion
PATH_CONECCION="/u01/sbl/bachero/"								

#-Lectura de Conneccion
BD_CONEXION=`cat /u01/sbl/bachero/.passet"`

# 1.- Trasladamos los archivos de control de DW a la ruta de siebel

echo "\$getasciidwh dw-seg-cliente-incr.flg /var/data/sbl/entrada/dw-seg-cliente-ctl.txt" | ftp -i $IP_ORIGEN

# 2.- Comparamos si se requiere realizar el traslado o no de la data.

mes_actual=`awk '{print substr($0,1,6)}' /var/data/sbl/entrada/dw-seg-cliente-ctl.txt`
mes_cargado=`awk '{print substr($0,1,6)}' /var/data/sbl/entrada/dw-seg-cliente-sbl.txt`

if [ $mes_actual == $mes_cargado ]
then
	echo "OK"
else
	# 3. Trasladamos los datos de los segmentos de los clientes

	echo "\$getasciidwh dw-seg-cliente-incr.txt /var/data/sbl/entrada/dw-seg-cliente-incr.txt" | ftp -i $IP_ORIGEN

	# 4. Cargamos los datos del archivo a la tabla temporal
	NOMBREARCHIVO="dw-seg-cliente-incr.txt"
	ARCHIVOCONTROL="SBL031D363A"	
	sqlldr $BD_CONEXION data=$PATH_ENTRADA$NOMBREARCHIVO control=$PATH_DATA$ARCHIVOCONTROL.ctl log=$PATH_DATA$ARCHIVOCONTROL.log bad=$PATH_DATA$ARCHIVOCONTROL.bad ROWS=10000 direct=true

	# 5. Cargamos el archivo control a la tabla de control
	NOMBREARCHIVO="dw-seg-cliente-ctl.txt"
	ARCHIVOCONTROL="CSBL031D363A"
	sqlldr $BD_CONEXION data=$PATH_ENTRADA$NOMBREARCHIVO control=$PATH_DATA$ARCHIVOCONTROL.ctl log=$PATH_DATA$ARCHIVOCONTROL.log bad=$PATH_DATA$ARCHIVOCONTROL.bad ROWS=1000 direct=true

	# 6. Actualizamos los datos en el archivo de comparacion
	echo "\$getasciidwh dw-seg-cliente-incr.flg /var/data/sbl/entrada/dw-seg-cliente-sbl.txt" | ftp -i $IP_ORIGEN	
fi 
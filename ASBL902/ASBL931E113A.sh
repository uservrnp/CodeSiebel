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
BD_CONEXION=`cat $PATH_CONECCION".passet"` 						

# Trasladamos los archivos de dw a la ruta de siebel

echo "\$getasciidwh dw-seg-cliente.flg /var/data/sbl/entrada/dw-seg-cliente-ctl.txt" | ftp -i $IP_ORIGEN
echo "\$getasciidwh dw-seg-cliente-incr.flg /var/data/sbl/entrada/dw-seg-cliente-sbl.txt" | ftp -i $IP_ORIGEN	
echo "\$getasciidwh dw-seg-cliente.txt /var/data/sbl/entrada/dw-seg-cliente.txt" | ftp -i $IP_ORIGEN

# 1. Cargamos el archivo control
NOMBREARCHIVO="dw-seg-cliente-ctl.txt"
ARCHIVOCONTROL="CSBL031D363A"
sqlldr $BD_CONEXION data=$PATH_ENTRADA$NOMBREARCHIVO control=$PATH_DATA/$ARCHIVOCONTROL.ctl log=$PATH_DATA/$ARCHIVOCONTROL.log bad=$PATH_DATA/$ARCHIVOCONTROL.bad ROWS=1000 direct=true

# 2. Cargamos el archivo con datos
NOMBREARCHIVO="dw-seg-cliente.txt"
ARCHIVOCONTROL="SBL031D363A"	
sqlldr $BD_CONEXION data=$PATH_ENTRADA$NOMBREARCHIVO control=$PATH_DATA/$ARCHIVOCONTROL.ctl log=$PATH_DATA/$ARCHIVOCONTROL.log bad=$PATH_DATA/$ARCHIVOCONTROL.bad ROWS=1000 direct=true
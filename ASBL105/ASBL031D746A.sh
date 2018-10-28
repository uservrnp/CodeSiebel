#!/bin/bash
#==========================================================
JOB_NAME="ASBL031D746A"
AMBIENTE="E"
JAR_NAME="lpd_carga_ws.jar"

#==========================================================
PHASE_NUMBER="4"
PROCESS_NAME="LPD_CARGA"
APLICACION="SBLA"
GRUPO="SBL105"
GRUPO_PATH="/zcm/"$AMBIENTE$APLICACION"/"$AMBIENTE$GRUPO   #Path donde se encuentra el script shell.
JOB_PATH=$GRUPO_PATH"/"$JOB_NAME
JAVA_PATH="/usr/java6/bin"
CON_DB=`cat /u01/sbl/bachero/.passet`
INPUT_PATH="/var/data/sbl/entrada/LPDP"                    #Path donde se encuentra el archivo de texto. 
PATH_LOGJOBS=$INPUT_PATH"/logjobs"   
                
#==========================================================
clear
result=0
HOSTNAME=$(hostname)
BIN=/bin
FECHA=`$BIN/date +%Y%m%d`
HORA=`$BIN/date +%H%M`
DD=`date +%d`
MM=`date +%m`
YY=`date +%Y`
hh=`date +%H`
mm=`date +%M`
ss=`date +%S`
date +%H%M%S

cd $GRUPO_PATH

export LOG_FILE=$PROCESS_NAME"_JOB"$PHASE_NUMBER"_"$HORA.log 
printf "#=======================================\n"   | tee $LOG_FILE
printf "# $PROCESS_NAME - JOB$PHASE_NUMBER      \n"   | tee -a $LOG_FILE
printf "#                                       \n"   | tee -a $LOG_FILE
printf "#=======================================\n"   | tee -a $LOG_FILE

printf "PTO_CRTL01: $? \n"  | tee -a $LOG_FILE 

###########################################################



$JAVA_PATH/java -jar   $JOB_PATH/$JAR_NAME     $CON_DB    P    | tee -a $LOG_FILE

result=$? 
printf "Resultado del jar: $result \n"  | tee -a $LOG_FILE 



###########################################################

result=$? 
printf "Resultado Final es: $result \n" | tee -a $GRUPO_PATH"/"$LOG_FILE
printf "\n#Bye\n"                       | tee -a $GRUPO_PATH"/"$LOG_FILE
printf "EOF \n"                         | tee -a $GRUPO_PATH"/"$LOG_FILE
mv  $GRUPO_PATH"/"$LOG_FILE  $PATH_LOGJOBS"/"$FECHA"_"$JOB_NAME"_"$HORA".log"
#exit 0

#==========================================================
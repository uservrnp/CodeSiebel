#!/bin/bash
#==========================================================
JOB_NAME="ASBL031D756A"
AMBIENTE="E"

#==========================================================
PHASE_NUMBER="5"
PROCESS_NAME="LPD_CARGA"
APLICACION="SBLA"
GRUPO="SBL105"
GRUPO_PATH="/zcm/"$AMBIENTE$APLICACION"/"$AMBIENTE$GRUPO   #Path donde se encuentra el script shell.
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

cd $GRUPO_PATH

export LOG_FILE=$PROCESS_NAME"_JOB"$PHASE_NUMBER"_"$HORA.log 
printf "#=======================================\n"   | tee $LOG_FILE
printf "# $PROCESS_NAME - JOB$PHASE_NUMBER      \n"   | tee -a $LOG_FILE
printf "#                                       \n"   | tee -a $LOG_FILE
printf "#=======================================\n"   | tee -a $LOG_FILE

printf "PTO_CRTL01: $? \n"  | tee -a $LOG_FILE 

###########################################################



resultJOB5=`sqlplus -s $CON_DB <<EOF
  set serveroutput on 
  set head off 
  declare
    e_PHASE_CODE VARCHAR2(10);
    e_fue_exitoso VARCHAR2(1);
  begin
    e_PHASE_CODE:='5'; 
    e_fue_exitoso:='S';
    XPKG_IB_LPD_CRG_SBL.sp_mover_historico(e_PHASE_CODE,e_fue_exitoso); 
  end; 
  / 
  quit 
  EOF ` 
printf "Resultado del sp_prc_cargalpd: $resultJOB5 \n"  | tee  -a $LOG_FILE  




###########################################################

result=$? 
printf "Resultado Final es: $result \n" | tee -a $GRUPO_PATH"/"$LOG_FILE
printf "\n#Bye\n"                       | tee -a $GRUPO_PATH"/"$LOG_FILE
printf "EOF \n"                         | tee -a $GRUPO_PATH"/"$LOG_FILE
mv  $GRUPO_PATH"/"$LOG_FILE  $PATH_LOGJOBS"/"$FECHA"_"$JOB_NAME"_"$HORA".log"
#exit 0

#==========================================================
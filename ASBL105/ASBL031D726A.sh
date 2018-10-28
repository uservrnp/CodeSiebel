#!/bin/bash
#==========================================================
JOB_NAME="ASBL031D726A"
CTL_NAME=$JOB_NAME.ctl
AMBIENTE="E"

#==========================================================
PHASE_NUMBER="2"
PROCESS_NAME="LPD_CARGA"
APLICACION="SBLA"
GRUPO="SBL105"
GRUPO_PATH="/zcm/"$AMBIENTE$APLICACION"/"$AMBIENTE$GRUPO   #Path donde se encuentra el script shell.
JAVA_PATH="/usr/java6/bin"
CON_DB=`cat /u01/sbl/bachero/.passet`

#==========================================================
INPUT_PATH="/var/data/sbl/entrada/LPDP"                    #Path donde se encuentra el archivo de texto. 
PATH_BAD=$INPUT_PATH"/bad"                                 #Directorio con los archivos Resumen BAD.
PATH_BK=$INPUT_PATH"/bk"
PATH_DATA=$INPUT_PATH"/data"
PATH_DIS=$INPUT_PATH"/discard"                             #Directorio con los archivos Resumen DISCARD.
PATH_LOG=$INPUT_PATH"/log"                                 #Directorio con los archivos logs LOG.
PATH_TMP=$INPUT_PATH"/tmp"
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



# LIMPIANDO LA TABLA TEMPORAL T_LPD_CARGA_TMP
    result=`sqlplus -s $CON_DB <<EOF
        truncate table T_LPD_CARGA_TMP; 
        quit 
        EOF ` 
    result=`echo $result | cut -d "\n" -f 2 ` 
    printf "PTO_CRTL 1: Resultado de la limpieza de la tabla T_LPD_CARGA_TMP: $result \n"  | tee  -a  $GRUPO_PATH"/"$LOG_FILE

    result=`sqlplus -s $CON_DB <<EOF
        set serveroutput on 
        set head off 
        exec XPKG_IB_LPD_CRG_SBL.sp_ins_LogCargaLpd('2.1','INFO','$result' ); 
        quit 
        EOF ` 

        
    cd $PATH_DATA
    contador=0
    for ARCHIVO in T_LPD*
    do
        NOMBREARCHIVO=$ARCHIVO
        if test -f $PATH_DATA"/"$NOMBREARCHIVO
        then
            contador=1
        else
            contador=0
        fi                    
    done
    printf "PTO_CRTL 2: Fin de contar archivos de carga. $? \n"  | tee  -a  $GRUPO_PATH"/"$LOG_FILE

cero=0
if [ $contador -ne $cero ] ; then           
                
                cd $PATH_DATA
                for ARCHIVO in T_LPD*
                do
                    NOMBREARCHIVO=$ARCHIVO
                    printf "*** EJECUTANDO SQLLDR *** \n con el archivo "$PATH_DATA"/"$ARCHIVO"\n"  | tee  -a $GRUPO_PATH"/"$LOG_FILE  
                    
                        if test -f $PATH_DATA"/"$NOMBREARCHIVO
                        then
                            sqlldr $CON_DB data=$PATH_DATA"/"$NOMBREARCHIVO control=$GRUPO_PATH"/"$CTL_NAME log=$PATH_LOG"/"$NOMBREARCHIVO".log" bad=$PATH_BAD"/"$NOMBREARCHIVO".bad" discard=$PATH_DIS"/"$NOMBREARCHIVO".dsc" ROWS=10000 direct=true 
                            resultSQLLDR=$?
                            printf "Resultado del SQLLDR: $resultSQLLDR \n"  | tee -a   $GRUPO_PATH"/"$LOG_FILE
                            result=`sqlplus -s $CON_DB <<EOF
                              set serveroutput on 
                              set head off 
                              exec XPKG_IB_LPD_CRG_SBL.sp_ins_LogCargaLpd('2.2','INFO','Resultado del SQLLDR: $resultSQLLDR' ); 
                              quit 
                              EOF ` 

                                if [ $resultSQLLDR -ne $cero ] ; then  
                                    printf "*** ERROR en el SQLLDR: "$PATH_DATA"/"$NOMBREARCHIVO" \n"  | tee -a   $GRUPO_PATH"/"$LOG_FILE
                                    result=`sqlplus -s $CON_DB <<EOF
                                      set serveroutput on 
                                      set head off 
                                      exec XPKG_IB_LPD_CRG_SBL.sp_ins_LogCargaLpd('2.2','INFO','*** ERROR en el SQLLDR: $PATH_DATA/$NOMBREARCHIVO' ); 
                                      quit 
                                      EOF ` 
                                    mv  $GRUPO_PATH"/"$LOG_FILE  $PATH_LOGJOBS"/"$FECHA"_"$JOB_NAME"_"$HORA".log"
                                    exit
                                 else
                                    mv  $PATH_DATA"/"$NOMBREARCHIVO     $PATH_BK"/"$NOMBREARCHIVO"_"$YY$MM$DD"_"$hh$mm$ss".txt"
                                fi
                            
                        fi
                done    
                
                printf "PTO_CRTL 4: Fin de ejecutar SQLLDR. $? \n"  | tee  -a  $GRUPO_PATH"/"$LOG_FILE
else
            printf " *** No existe archivos para procesar (T_LPD*). \n"  | tee  -a $GRUPO_PATH"/"$LOG_FILE 
            result=`sqlplus -s $CON_DB <<EOF
                set serveroutput on 
                set head off 
                exec XPKG_IB_LPD_CRG_SBL.sp_ins_LogCargaLpd('2.2','INFO','No existe archivos para procesar (T_LPD*).' ); 
                quit 
                EOF ` 
    
fi 
    
   printf "PTO_CRTL 5: Fin del if principal (contador>0). $? \n"  | tee  -a  $GRUPO_PATH"/"$LOG_FILE
   
###########################################################

result=$? 
printf "Resultado Final es: $result \n" | tee -a $GRUPO_PATH"/"$LOG_FILE
printf "\n#Bye\n"                       | tee -a $GRUPO_PATH"/"$LOG_FILE
printf "EOF \n"                         | tee -a $GRUPO_PATH"/"$LOG_FILE
mv  $GRUPO_PATH"/"$LOG_FILE  $PATH_LOGJOBS"/"$FECHA"_"$JOB_NAME"_"$HORA".log"
#exit 0

#==========================================================
LOAD DATA
CHARACTERSET WE8ISO8859P1
APPEND
INTO TABLE "EXTERNO"."TMP_BLOQUEO_LEADS"
FIELDS TERMINATED BY "|"
TRAILING NULLCOLS
(
CODUNICO                   CHAR(14) "LTRIM(RTRIM(UPPER(:CODUNICO)))",
ESTADOLEAD                 CHAR(1)  "LTRIM(RTRIM(UPPER(:ESTADOLEAD)))",
CODCAMPANA                 CHAR(8)  "LTRIM(RTRIM(UPPER(:CODCAMPANA)))",
TIPODOC                    CHAR(2)  "LTRIM(RTRIM(UPPER(:TIPODOC)))",
NUMERODOC                  CHAR(11) "LTRIM(RTRIM(UPPER(:NUMERODOC)))",
CODRESPUESTA               CHAR(2)  "LTRIM(RTRIM(UPPER(:CODRESPUESTA)))",
ORIGEN              	   CHAR(3)  "LTRIM(RTRIM(UPPER(:ORIGEN)))",
RESPONSABLE                CHAR(8)  "LTRIM(RTRIM(UPPER(:RESPONSABLE)))",
FECHA                      CHAR(14) "LTRIM(RTRIM(UPPER(:FECHA)))",
CUENTA 			   CHAR(12) "LTRIM(RTRIM(UPPER(:CUENTA )))",
ALTA			   CHAR(4) "LTRIM(RTRIM(UPPER(:ALTA)))",
APP 			   CHAR(4) "LTRIM(RTRIM(UPPER(:APP)))",
CODSITTC  		   CHAR(2) "LTRIM(RTRIM(UPPER(:CODSITTC)))",
DESSITTC  		   CHAR(50) "LTRIM(RTRIM(UPPER(:DESSITTC)))",
CODBLOQUEO 		   CHAR(2) "LTRIM(RTRIM(UPPER(:CODBLOQUEO)))",
DESBLOQUEO  		   CHAR(50) "LTRIM(RTRIM(UPPER(:DESBLOQUEO)))",
EXPEDIENTE  		   CHAR(50) "LTRIM(RTRIM(UPPER(:EXPEDIENTE)))",
ESTADOADQ  		   CHAR(50) "LTRIM(RTRIM(UPPER(:ESTADOADQ)))"
)
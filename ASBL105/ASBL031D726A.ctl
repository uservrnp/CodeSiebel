LOAD DATA
INFILE * 
APPEND    
INTO TABLE EXTERNO.T_LPD_CARGA_TMP
FIELDS TERMINATED BY '|'
TRAILING NULLCOLS
(   
    TDOC_ID           ,
    LPD_NRODOC        ,
    LPD_CODUNICO      ,
    LPD_APEPATERNO    ,
    LPD_APEMATERNO    ,
    LPD_PRINOMBRE     ,
    LPD_SEGNOMBRE     ,
    LPD_TELEFONOFIJO  ,
    LPD_CELULAR       ,
    LPD_EMAIL         ,
    LPD_DOMICILIO     ,
    LPD_CODEMPRESA    ,
    LPD_TIPO          ,
    LPD_DATO          ,  
    LPD_FECHA         ,
    LPD_CODEXPED      ,
    CANA_ID           ,
    LPD_APLICACION    ,
    LPD_CREADO        ,
    LPD_CREADO_POR    ,
    LPD_DISPOSITIVO   
)  
    
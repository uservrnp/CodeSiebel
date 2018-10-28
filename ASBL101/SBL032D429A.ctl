load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dw-acc-renta.txt'
 truncate
 into table EXTERNO.X_IB_DWH_RENTABILIDAD
 (  COMMONCOAID  position (001:014) char(14),
    SLDPROMRENTA position (015:030) char(16),
    SPREAD       position (031:046) char(16),
    UTLOPERACUM  position (047:062) char(16),
    MARGENFINAN  position (063:078) char(16),
    INGNOFINAN   position (079:094) char(16),
    CODIGOUNICO  position (095:114) char(20),
    CODMES       position (115:120) char(6),
    FECHAPROCESO position (121:128) char(8),
    FAMILIA      position (129:208) char(80),
    PRODUCTO     position (209:288) char(80),
    ORDEN        SEQUENCE(COUNT,1)
 )

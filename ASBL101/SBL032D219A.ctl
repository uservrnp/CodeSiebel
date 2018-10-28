load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dw-acc-prosp.txt'
 truncate
 into table EXTERNO.X_IB_DWH_PROSPECTO
 (  NOMBREEMPRESA    position (001:200) char(200),
    CIIU             position (201:205) char(5),
    CLASIFRIESGOSBS  position (206:206) char(1),
    COLOCACIONSBS    position (207:222) char(16),
    INDIRECTOSSBS    position (223:238) char(16),
    BCOPRINCIPAL     position (239:244) char(6),
    RANGOFACTINI     position (245:260) char(16),
    RANGOFACTFIN     position (261:276) char(16),
    RUC              position (277:288) char(12),
    TELEFONO         position (289:300) char(12),
    DIRECCIONEMPRESA position (301:364) char(64),
    UBIGEOCD         position (365:370) char(6),
    MTOIMPORTACION   position (371:386) char(16),
    MTOEXPORTACION   position (387:402) char(16),
    CODMES           position (403:408) char(6),
    FECHAPROCESO     position (409:416) char(8),
    NUMCLIENTES      position (417:432) char(16),
    ORDEN            SEQUENCE(COUNT,1)
 )


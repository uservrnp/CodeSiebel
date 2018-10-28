load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dw-agc-direc.txt'
 truncate
 into table EXTERNO.X_IB_DWH_DIRECCION_PROSPECTO
 (  RUC          position (001:012) char(12),
    DIRECCION    position (013:102) char(90),
    UBIGEO       position (103:108) char(6),
    CODMES       position (109:114) char(6),
    FECHAPROCESO position (115:122) char(8),
    ORDEN        SEQUENCE(COUNT,1)
 )
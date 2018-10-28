load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dw-acc-merca.txt'
 truncate
 into table EXTERNO.X_IB_DWH_MERCADO
 (  CODIGOUNICO  position(001:020) char(20),
    RUC          position(021:040) char(20),
    CODCUENTARCC position(041:054) char(14),
    DESCUENTARCC position(055:104) char(50),
    MTOBCP       position(105:120) char(16),
    MTOSCT       position(121:136) char(16),
    MTOBBV       position(137:152) char(16),
    MTOIBK       position(153:168) char(16),
    MTOBIF       position(169:184) char(16),
    MTOOTROS     position(185:200) char(16),
    PORCIBK      position(201:206) char(6),
    CODMES       position(207:212) char(6),
    MTOTOTALSBS  position(213:228) char(16),
    FECHAPROCESO position(229:236) char(8),
    ORDEN        SEQUENCE(COUNT,1)
 )
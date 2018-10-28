load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/pe-clie.txt'
 truncate
 into table EXTERNO.X_IB_PER_CLIENTE
 (  CODIGOUNICO   position (001:010) char(10),
    TIPODOCUMENTO position (011:012) char(2),
    NRODOCUMENTO  position (013:032) char(20),
    NOMBREEMPRESA position (033:132) char(100),
    TELEFONO      position (133:332) char(200),
    FAX           position (333:352) char(20),
    ORDEN         SEQUENCE(COUNT,1)
 )
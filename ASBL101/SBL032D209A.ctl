load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dw-acc-clie.txt'
 truncate
 into table EXTERNO.X_IB_DWH_CLIENTE
 (  CODIGOUNICO   position (001:020) char(20),
    CODDOC        position (021:032) char(12),
    ESTADO        position (033:052) char(20),
    RENTAANUAL    position (053:068) char(16),
    COLOCACIONSBS position (069:084) char(16),
    INDIRECTOSSBS position (085:100) char(16),
    PORCIBK       position (101:103) char(3),
    BCOPRINCIPAL  position (104:109) char(6),
    PAGOPLAN      position (110:125) char(16),
    PAGOPROV      position (126:141) char(16),
    NUMEMPLEADOS  position (142:148) char(7),
    MTOIMPOR      position (149:164) char(16),
    MTOEXPO       position (165:180) char(16),
    NUMEMPLIBK    position (181:187) char(7),
    CODMES        position (188:193) char(6),
    FECHAPROCESO  position (194:201) char(8)
 )

load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dwh-posi-cliente-20140519.txt'
 truncate
 into table EXTERNO.X_IB_PCL_POSICIONCLIENTE
 (  SALDOMN          position (001:015) CHAR(15),
    SALDOME          position (016:030) CHAR(15),
    TRANSACCIONMN    position (031:045) CHAR(15),
    TRANSACCIONME    position (046:060) CHAR(15),
    CODIGOUNICO      position (061:070) CHAR(10),
    CLAVEDWH         position (071:080) CHAR(10),
    FECHAPROCESO     position (086:093) CHAR(8),
    CODIGOAPLICACION position (094:096) CHAR(3),
    FECHAPAGO        position (097:102) CHAR(6),
    FILLER           position (103:130) CHAR(28),
    ORDEN            SEQUENCE(COUNT,1)
 )

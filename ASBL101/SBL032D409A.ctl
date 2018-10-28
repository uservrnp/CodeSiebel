load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dw-agc-alerta.txt'
 truncate
 into table EXTERNO.X_IB_DWH_ALERTAD
 (  ALERTACD      position (001:002) char(2),
    CODUNICOCLI   position (003:012) char(10),
    NOMBRECLIENTE position (013:087) char(75),
    SEGMENTO      position (088:088) char(1),
    MONTO         position (089:104) char(16),
    COMMONCOA     position (105:114) char(10),
    FECDIA        position (115:124) char(10),
    SECTORISTA    position (125:134) char(10),
    FECHAPROCESO  position (135:142) char(8),
    ORDEN         SEQUENCE(COUNT,1)
 )

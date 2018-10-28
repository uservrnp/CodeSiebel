load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dw-agc-alertm.txt'
 truncate
 into table EXTERNO.X_IB_DWH_ALERTAM
 (  ALERTACD      position (001:002) char(2),
    CODUNICOCLI   position (003:016) char(14),
    SUMUTILIDAD   position (017:032) char(16),
    NOMBRECLIENTE position (033:107) char(75),
    PERIODO       position (108:113) char(6),
    SEGMENTO      position (114:114) char(1),
    SECTORISTA    position (115:124) char(10),
    FECHAPROCESO  position (125:132) char(8),
    ORDEN         SEQUENCE(COUNT,1)
 )

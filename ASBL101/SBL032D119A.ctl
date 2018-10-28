load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/pe-dir-clie.txt'
 truncate
 into table EXTERNO.X_IB_PER_DIRECCION_CLIENTE
 (  CODIGOUNICO   position (001:010) char(10),
    IDDIRECCION   position (011:020) char(10),
    PRINCIPAL     position (021:021) char(1),
    DIRECCION     position (022:121) char(100),
    TIPOVIA       position (122:131) char(10),
    NUMERO_MZ     position (132:136) char(5),
    NUMERO_LOTE   position (137:141) char(5),
    INTERIOR      position (142:146) char(5),
    URBANIZACION  position (147:246) char(100),
    DISTRITO      position (247:252) char(6),
    PROVINCIA     position (253:258) char(6),
    DEPARTAMENTO  position (259:264) char(6),
    PAIS          position (265:268) char(4),
    TIPODIRECCION position (269:271) char(3),
    CODIGOPOSTAL  position (272:274) char(3),
    ESTADO        position (276:276) char(1),
    ORDEN         SEQUENCE(COUNT,1)
 ) 

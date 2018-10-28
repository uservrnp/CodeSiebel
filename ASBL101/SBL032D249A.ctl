load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dw-agc-bcos.txt'
 truncate
 into table EXTERNO.X_IB_DWH_BANCO
 when INTERFAZ = '01'
 (  INTERFAZ    position (001:002) char(2),
    CODEMPRESA  position (003:012) char(10),
    NBREMPRESA  position (013:212) char(200)
 )

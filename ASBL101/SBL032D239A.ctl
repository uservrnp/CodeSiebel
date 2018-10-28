load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dw-agc-telef.txt'
 truncate
 into table EXTERNO.X_IB_DWH_TELEFONO_PROSPECTO
 (  RUC          position (001:012) char(12),
    TELEFONO     position (013:024) char(12),
    CODMES       position (025:030) char(6),
    FECHAPROCESO position (031:038) char(8)
 )

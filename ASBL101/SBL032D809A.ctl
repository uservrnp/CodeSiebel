load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/aprp072z-tipogar-20140519.txt'
 truncate
 into table EXTERNO.X_IB_APR_GARANTIA
 (CODIGOUNICO  position(001:010) char(10),
  TIPOGARANTIA position(011:014) char(4),
  IMPORTE      position(015:029) char(15)
 )

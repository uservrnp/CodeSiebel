load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/tabla-grueco-20140519.txt'
 truncate
 into table EXTERNO.X_IB_PCL_GRUPOECONOMICO
 (CODIGO      position(001:004) CHAR(4),
  DESCRIPCION position(005:054) CHAR(50)
 )

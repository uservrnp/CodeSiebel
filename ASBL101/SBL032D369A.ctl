load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/tabla-ciiu-20140519.txt'
 truncate
 into table EXTERNO.X_IB_PCL_ACTIVIDADECONOMICA
 (CODIGO      position(001:004) CHAR(4),
  DESCRIPCION position(005:054) CHAR(50)
 )

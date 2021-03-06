load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/tasafond-20140519.txt'
 truncate
 into table EXTERNO.X_IB_RNT_TASAFONDEO
 (SIGANO     position (001:004) char(4),
  MES        position (005:006) char(2),
  DIA        position (007:008) char(2),
  RANGO1     position (009:014) char(6),
  RANGO2     position (015:020) char(6),
  TAS_ACT_MN position (021:029) char(9),
  TAS_ACT_ME position (030:038) char(9),
  TAS_PAS_MN position (039:047) char(9),
  TAS_PAS_ME position (048:056) char(9),
  TAS_CEX_ME position (057:065) char(9),
  SPREAD_VAR position (066:070) char(5),
  ORDEN      SEQUENCE(COUNT,1)
  )

load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/sbl-alerta-agcmr-20140519.txt'
 truncate
 into table EXTERNO.X_IB_PCL_ALERTAT
 (CODIGOUNICO      position(001:010) CHAR(10),
  CODIGOALERTA     position(011:012) CHAR(2),
  CODIGOAPLICATIVO position(013:015) CHAR(3),
  NROCUENTA        position(016:029) CHAR(14),
  CODIGOCONCEPTO   position(030:031) CHAR(2),
  TIPOCONCEPTO     position(032:033) CHAR(2),
  FECHAVENCIMIENTO position(034:041) CHAR(8),
  CODIGOCATEGORIA  position(042:043) CHAR(2),
  FILLER           position(044:072) CHAR(29),
  FECHAPROCESO     position(073:080) CHAR(8),
  TIPODATA         position(072:072) CHAR(1),
  ORDEN            SEQUENCE(COUNT,1)
)

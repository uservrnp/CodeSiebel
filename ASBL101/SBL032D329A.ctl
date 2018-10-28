load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dwh-alerta-agcmr-20140519.txt'
 truncate
 into table EXTERNO.X_IB_PCL_ALERTA
 (CODIGOUNICO      position(001:010) CHAR(10),
  CODIGOALERTA     position(011:012) CHAR(2),
  CODIGOPRODUCTO   position(013:022) CHAR(10),
  TIPOALERTA       position(023:052) CHAR(30),
  MONTOTOTAL       position(053:067) CHAR(15),
  DATOANTERIOR     position(068:097) CHAR(30),
  DATOACTUAL       position(098:127) CHAR(30),
  NROCHEQUESCS     position(128:129) CHAR(2),
  NROCHEQUESSS     position(130:131) CHAR(2),
  FECHAVENCIMIENTO position(132:139) CHAR(8),
  FILLER           position(140:142) CHAR(3),
  FECHAPROCESO     position(143:150) CHAR(8),
  TIPODATA         position(072:072) CHAR(1),
  ORDEN            SEQUENCE(COUNT,1)
)


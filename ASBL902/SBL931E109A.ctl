load data
characterset WE8MSWIN1252
infile '/var/data/sbl/entrada/dw-agc-cliep.txt'
truncate
into table EXTERNO.X_IB_DWHP_CLIENTE
(
CODIGOUNICO   position(001:014) CHAR(14),
MARGEN_DWH   position(015:034) CHAR(20),
SHAREOFWALLET_DWH position(035:039) CHAR(5),
VINCULACION_DHW position(040:044) CHAR(5),
CEM_DWH position(045:058) CHAR(14),
RENTABILIDAD_DWH position(059:072) CHAR(14),
CALIFICACIONEXTERNA position(073:073) CHAR(1),
TIENDAPREFERIDA_COD	position(074:083) CHAR(10),
COLOCACIONSBS_DWH position(084:097) CHAR(14),
BANCOPRINCIPAL_COD  position(098:107) CHAR(10),
NROBANCOSDEUDA_DWH   position(108:112) CHAR(5),
SATISFACCION position(113:132) CHAR(20),
CODIGOAFP  position(133:152) CHAR(20),
CODIGOMES  position(153:158) CHAR(6),
FLAGPLANILLA  position(159:159) CHAR(1)
)
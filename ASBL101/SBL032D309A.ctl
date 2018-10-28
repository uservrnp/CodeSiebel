load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/aco.txt'
 truncate
 into table EXTERNO.X_IB_PCL_SECTORISTAREGISTRO
 (  SECTORISTA position (001:009) char(09),
    CARGO      position (011:030) char(20),
    NOMBRE     position (031:070) char(40),
    REGISTRO   position (071:078) char(08),
    PLAZA      position (079:081) char(03),
    TIENDA     position (082:101) char(20)
 )

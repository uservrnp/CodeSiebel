load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/clcred-cliente-20140519.txt'
 truncate
 into table EXTERNO.X_IB_PCL_LINEACREDITO_ACUM
 (  NUMLINEA    position (001:008) char(8),
    NUMPRODU    position (009:011) char(3),
    NOMPRODU    position (012:051) char(40),
    TIPLINEA    position (052:052) char(1),
    IMPAPROB    position (053:067) char(15),
    IMPUTILI    position (068:082) char(15),
    IMPDISPO    position (083:097) char(15),
    PORUTILI    position (098:102) char(5),
    TIPMONED    position (103:105) char(3),
    ESTADO      position (106:106) char(1),
    FECINICI    position (107:114) char(8),
    FECVENCI    position (115:122) char(8),
    CODIGOUNICO position (123:132) char(10),
    PROMULTI    position (133:146) char(14),
    NOMMULTI    position (147:167) char(21),
    FECGENER    position (168:175) char(8),
    FILLER      position (176:250) char(75),
    ORDEN       SEQUENCE(COUNT, 1)
 )

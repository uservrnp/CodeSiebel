load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/pe-mae-dist.txt'
 infile '/var/data/sbl/entrada/pe-mae-prov.txt'
 infile '/var/data/sbl/entrada/pe-mae-dept.txt'
 infile '/var/data/sbl/entrada/pe-mae-pais.txt'
 infile '/var/data/sbl/entrada/pe-mae-tipodir.txt'
 truncate
 into table EXTERNO.X_IB_PER_DISTRITO
 when INTERFAZ = '01'
 (  INTERFAZ     position (001:002) char(2),
    DISTRITO     position (003:008) char(6),
    DESCRIPCION  position (009:108) char(100),
    CODIGOPOSTAL position (109:112) char(4),
    PROVINCIA    position (113:114) char(2),
    DEPARTAMENTO position (115:116) char(2)
 )
 into table EXTERNO.X_IB_PER_PROVINCIA
 when INTERFAZ = '02'
 (  INTERFAZ     position (001:002) char(2),
    PROVINCIA    position (003:004) char(2),
    DEPARTAMENTO position (005:006) char(2),
    DESCRIPCION  position (007:106) char(100)
 )
 into table EXTERNO.X_IB_PER_DEPARTAMENTO
 when INTERFAZ = '03'
 (  INTERFAZ     position (001:002) char(2),
    DEPARTAMENTO position (003:004) char(2),
    DESCRIPCION  position (005:104) char(100)
 )
 into table EXTERNO.X_IB_PER_PAIS
 when INTERFAZ = '04'
 (  INTERFAZ     position (001:002) char(2),
    PAIS         position (003:006) char(4),
    DESCRIPCION  position (007:106) char(100)
 )
 into table EXTERNO.X_IB_PER_TIPODIRECCION
 when INTERFAZ = '05'
 (  INTERFAZ      position (001:002) char(2),
    TIPODIRECCION position (003:003) char(1),
    DESCRIPCION   position (004:053) char(50)
 )

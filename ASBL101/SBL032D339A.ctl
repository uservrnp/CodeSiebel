load data
 characterset WE8MSWIN1252
 infile '/var/data/sbl/entrada/dwh-posi-product-20140519.txt'
 truncate
 into table EXTERNO.X_IB_PCL_PRODUCTO
 (  COMMONCOA   position (001:010) char(10),
    FAMILIA     position (011:050) char(40),
    PRODUCTO    position (051:090) char(40),
    TIPO        position (091:130) char(40)
 )

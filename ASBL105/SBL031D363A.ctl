load data
 characterset WE8MSWIN1252
 truncate
 into table EXTERNO.X_SEGMENTO_TMP
 (  CODIGOMES   position(001:006) CHAR(6) "ltrim(rtrim(:CODIGOMES))",
        CODIGO_UNICO   position(007:016) CHAR(10) "ltrim(rtrim(:CODIGO_UNICO))",
        SEGMENTO   position(017:021) CHAR(5) "ltrim(rtrim(:SEGMENTO))",
        SUBSEGMENTO   position(022:026) CHAR(5) "ltrim(rtrim(:SUBSEGMENTO))",
        NIVEL_SERVICIO   position(027:031) CHAR(5) "ltrim(rtrim(:NIVEL_SERVICIO))",
        SEGMENTO_NS   position(032:036) CHAR(5) "ltrim(rtrim(:SEGMENTO_NS))",
        SEGMENTO_SS   position(037:041) CHAR(5) "ltrim(rtrim(:SEGMENTO_SS))",
        SEGMENTO_SS_NS   position(042:046) CHAR(5) "ltrim(rtrim(:SEGMENTO_SS_NS))",
        HOMOLOGACION   position(047:048) CHAR(2) "ltrim(rtrim(:HOMOLOGACION))",
        FLAG_REGISTRO   position(049:049) CHAR(1) "ltrim(rtrim(:FLAG_REGISTRO))",
        SEGENTOHOM    position(049:049) CHAR(10) "ltrim(rtrim(:SEGENTOHOM))",
 )

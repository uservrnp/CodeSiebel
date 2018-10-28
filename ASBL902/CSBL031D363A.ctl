load data
 characterset WE8MSWIN1252
 truncate
 into table EXTERNO.X_SEGMENTO_CONTROL
 (  CODIGOMES   position(001:006) CHAR(6) "ltrim(rtrim(:CODIGOMES))",
		INTERFASE   position(007:036) CHAR(30) "ltrim(rtrim(:INTERFASE))",
		TOTAL_REGISTROS   position(037:046) CHAR(10) "ltrim(rtrim(:TOTAL_REGISTROS))"
 )
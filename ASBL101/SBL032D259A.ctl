load data
characterset WE8MSWIN1252
infile '/var/data/sbl/entrada/dw-agenda-volvent.txt'
truncate
into table EXTERNO.X_IB_DWH_FACTURACION
(      CODIGOUNICO           position (001:010) char(10),    
       IMPORTE               position (011:023) char(13),
       FECHAESTADOFINANCIERO position (024:031) char(08),
       FECHAPROCESO          position (032:039) char(08)
)


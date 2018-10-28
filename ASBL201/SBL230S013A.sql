WHENEVER SQLERROR EXIT SQL.SQLCODE
set serveroutput on size 400000
set feedback off
set verify off

var err_code varchar2(10);
var err_msg varchar2(200);

declare
error_pkg      exception;
begin
null;
EXTERNO.XPKG_IB_PROCESO.XSP_IB_DEPURAR_LEADS(&1);				
if :err_code <> '000' then
   raise error_pkg;
end if;
exception
when others then
     raise_application_error(-20001,:err_code||' '||:err_msg);
end;
/

print err_code;
print err_msg;

exit

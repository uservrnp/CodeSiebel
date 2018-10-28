#!/usr/bin/ksh

vsql="/zcm/ASBLA/ASBL105/SBL031D133A.sql"

if test ! -f $vsql
then
   echo "007 : Error"
   echo "No existe archivo "$vsql
   exit 1
fi
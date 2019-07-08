#!/bin/ksh

(( $# != 2 )) && { print "usage is $0 db_service_name app_service_name"; exit; }

typeset -u dbsrvname=$1
typeset -u appsrvname=$2

cnxsys="sys/Koek1081@$dbsrvname as sysdba"

sqlplus -s $cnxsys <<!
set echo on
set lines 100
DECLARE
  srvname varchar2(40);
  cnt number;
BEGIN
  srvname := '$appsrvname';
  select count(1) into cnt from v_\$active_services where NETWORK_NAME = srvname;
  if cnt = 0 then
    sys.dbms_system.ksdwrt(3,'Starting service '||srvname);
    dbms_service.start_service(srvname);
  end if;
  dbms_service.start_service(srvname);
END;
/
!
lsnrctl services 

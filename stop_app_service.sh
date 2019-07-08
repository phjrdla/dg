#!/bin/ksh

(( $# != 2 )) && { print "usage is $0 db_service_name app_service_name"; exit; }

typeset -u dbsrvname=$1
typeset -u appsrvname=$2

cnxsys="sys/Koek1081@$dbsrvname as sysdba"

sqlplus -s $cnxsys <<!
set echo on
set lines 100
BEGIN
  dbms_service.stop_service('$appsrvname');
END;
/
!


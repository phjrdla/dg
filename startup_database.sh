#!/bin/ksh

(( $# != 1 )) && { print "usage is $0 static_service_name"; exit; }

typeset -u srvname=$1
cnxsys="sys/Koek1081@$srvname as sysdba"
#print $cnxsys

sqlplus -s $cnxsys  <<!
set echo on
startup
!


#!/bin/ksh

cat <<!
This is $0
Returns database role (primary/standby)
!

typeset -u srvname
while [[ -z "$srvname" ]]
do
  read srvname?"Enter database or service name (q to quit) :"
  [[ $srvname = 'Q' ]] && exit
done
print "Database/Service is $srvname"

cnxsys="sys/Koek1081@$srvname as sysdba"

sqlplus -s $cnxsys  <<!
set echo on
set lines 100
SELECT name, open_mode, database_role
FROM V\$DATABASE
/
!


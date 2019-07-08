#!/bin/ksh
SCRIPTS_HOME='/home/oracle/scripts'

#[[ $# != 1 ]] && { print "Usage is : $0 database_name"; exit; }

typeset -u srvname
while [[ -z "$srvname" ]]
do
  read srvname?"Enter database or service name (q to quit) :"
  [[ $srvname = 'Q' ]] && exit
done
print "Database/Service is $srvname"

cnx='system/Koek1081'

sqlplus -s $cnx@$srvname @$SCRIPTS_HOME/new_dg_psby_diag.sql

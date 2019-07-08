#!/bin/ksh

cat <<!
This is $0
Validates in details a database
!

typeset -u srvname
while [[ -z "$srvname" ]]
do
  read srvname?"Enter primary database or service name (q to quit) :"
  [[ $srvname = 'Q' ]] && exit
done
print "Primary database/Service is $srvname"

typeset -u dbname
while [[ -z "$dbname" ]]
do
  read dbname?"Enter database name (q to quit) :"
  [[ $dbname = 'Q' ]] && exit
done
print "Database is $dbname"

cnxsys="sys/Koek1081@$srvname"

dgmgrl <<!
connect $cnxsys
validate database verbose $dbname
!

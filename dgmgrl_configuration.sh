#!/bin/ksh

cat <<!
This is $0
Shows Data Guard configuration
!

typeset -u srvname
while [[ -z "$srvname" ]]
do
  read srvname?"Enter primary database or service name (q to quit) :"
  [[ $srvname = 'Q' ]] && exit
done
print "Primary database/Service is $srvname"

cnxsys="sys/Koek1081@$srvname"

dgmgrl <<!
connect $cnxsys
show configuration verbose
!

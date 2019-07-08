#!/bin/ksh

#[[ $# != 1 ]] && { print "Usage is : $0 database_name"; exit; }

typeset -u srvname
while [[ -z "$srvname" ]]
do
  read srvname?"Enter database or service name (q to quit) :"
  [[ $srvname = 'Q' ]] && exit
done
print "Database/Service is $srvname"

cnx='system/Koek1081'

sqlplus -s $cnx@$srvname <<!
set lines 200
column network_name format a30 trunc
select service_id, network_name, creation_date
from v\$active_services
where network_name is not null
order by network_name
/
!

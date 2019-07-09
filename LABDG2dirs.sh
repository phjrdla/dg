#!/bin/sh

OLD_UMASK=`umask`
umask 0027
mkdir -p /u01/app/oracle
mkdir -p /u01/app/oracle/admin/LABDG2/adump
mkdir -p /u01/app/oracle/admin/LABDG2/dpdump
mkdir -p /u01/app/oracle/admin/LABDG2/pfile
mkdir -p /u01/app/oracle/audit
mkdir -p /u01/app/oracle/cfgtoollogs/dbca/LABDG2
mkdir -p /u01/app/oracle/product/12.2/dbhome_1/dbs
mkdir -p /u02/oradata
mkdir -p /u02/oradata/LABDG2
mkdir -p /u03/oradata/LABDG2
mkdir -p /u04/fast_recovery_area/LABDG2
mkdir -p /u04/oradata

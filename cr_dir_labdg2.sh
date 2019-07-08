mkdir -p /u01/oradata/labdg
mkdir -p /u02/oradata/labdg
mkdir -p /u03/oradata/labdg
mkdir -p /u04/oradata/labdg
mkdir -p /u01/app/oracle/admin/labdg2/adump
mkdir -p /u02/oradata/LABDG2/controlfile
mkdir -p /u04/oradata/LABDG2/controlfile
mkdir -p /u04/fast_recovery_area/labdg2

chown -R oracle:oinstall /u01
chmod -R 775 /u01
chown -R oracle:oinstall /u02
chmod -R 775 /u02
chown -R oracle:oinstall /u03
chmod -R 775 /u03
chown -R oracle:oinstall /u04
chmod -R 775 /u04


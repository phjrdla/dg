connect target sys/Koek1081@LABDG1_dgmgrl;
connect auxiliary sys/Koek1081@LABDG2_dgmgrl;
run {
allocate channel prmy1 type disk;
allocate channel prmy2 type disk;

allocate auxiliary channel aux1 type disk;
allocate auxiliary channel aux2 type disk;

duplicate target database
for standby
from active database
spfile
parameter_value_convert
  'LABDG1','LABDG2'
set db_unique_name='LABDG2'
set db_file_name_convert
  'LABDG1','LABDG2'
set log_file_name_convert
  'LABDG1','LABDG2'
using compressed backupset section size 512M
nofilenamecheck
;}

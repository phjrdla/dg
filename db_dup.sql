connect target sys/Koek1081@labdg1_dgmgrl
connect auxiliary sys/Koek1081@labdg2_dgmgrl
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
  'labdg1','labdg2'
set db_unique_name='labdg2'
set db_file_name_convert
  'labdg1','labdg2'
set log_file_name_convert
  'labdg1','labdg2'
using compressed backupset section size 512M
nofilenamecheck
;}

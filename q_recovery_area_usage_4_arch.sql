set lines 200
set pages 60

select percent_space_used,percent_space_reclaimable,number_of_files 
from v$recovery_area_usage 
where file_type='ARCHIVED LOG';
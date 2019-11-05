select sequence#
      ,to_char(first_time, 'DD-MON-YY HH24:MI:SS') FT
      ,to_char(next_time, 'DD-MON-YY HH24:MI:SS') NT
      ,to_char(completion_time,'DD-MON-YY HH24:MI:SS') CT
from v$archived_log
where first_time > (sysdate-1)
order by  sequence# desc
select thread#, min(sequence#), min(min_date), count(*) from (
select thread#, sequence#, count(*), max(first_time) min_date
from v$archived_log
where first_time > (sysdate-2)
group by thread#, sequence#
having count(*) <2
order by 1,2
)
group by thread#
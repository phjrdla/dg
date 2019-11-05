select TYPE, ITEM, to_char(TIMESTAMP, 'DD-MON-YYYY HH24:MI:SS') 
from v$recovery_progress 
where ITEM='Last Applied Redo'
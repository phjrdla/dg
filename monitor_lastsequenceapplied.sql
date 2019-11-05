select ads.dest_id,
max(sequence#) CurrentSequence,
max(log_sequence) LastArchived,
max(applied_seq#) LastSequenceApplied
from v$archived_log al, v$archive_dest ad, v$archive_dest_status ads
where ad.dest_id=al.dest_id
and al.dest_id=ads.dest_id
group by ads.dest_id;
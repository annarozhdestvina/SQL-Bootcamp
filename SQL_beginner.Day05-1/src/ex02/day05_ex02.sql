create index idx_person_name on person (upper(name));
set enable_seqscan = off;
explain analyze select person.id from person where name = 'NATALY';
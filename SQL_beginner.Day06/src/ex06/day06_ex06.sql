CREATE SEQUENCE seq_person_discounts
start with 1
increment by 1
minvalue 0
maxvalue 10000
cycle;
select setval ('seq_person_discounts', (select count(*) from person_discounts) + 1);


alter table person_discounts
alter id set default nextval ('seq_person_discounts');
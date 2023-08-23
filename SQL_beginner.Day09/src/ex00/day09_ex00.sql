create table if not exists person_audit 
(
  id bigint primary key,
  
  created  timestamp with time zone not null
    default (current_timestamp at time zone 'UTC'),
  ---timestamp when a new event has been created. 
  ---Default value is a current timestamp and NOT NULL
  type_event char(1)
    default ('I'),
  ---possible values I (insert), D (delete), U (update). 
  ---Default value is ‘I’. NOT NULL. 
  ---Add check constraint ch_type_event with possible values ‘I’, ‘U’ and ‘D’
  row_id bigint not null,
  ---copy of person.id. NOT NULL
  name varchar,
  ---copy of person.name (no any constraints)
  age  integer,
  ---copy of person.age (no any constraints)
  gender varchar,  
  ---copy of person.gender (no any constraints)
  address  varchar  
  ---copy of person.address (no any constraints)
);

alter table person_audit add constraint ch_type_event check ( type_event in ('I','U', 'D') );

create function fnc_trg_person_insert_audit() returns trigger as $$
begin
  insert into person_audit 
  values(
    (select count(*) from person_audit) + 1,
    current_timestamp,
    'I',
    new.id,
    new.name,
    new.age,
    new.gender,
    new.address
  );
  return new;
end;
$$ language plpgsql;

create trigger trg_person_insert_audit 
after insert
on person
for each row
execute function fnc_trg_person_insert_audit();


-- insert into person(id, name, age, gender, address) VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
-- select * from person;
-- select * from person_audit;
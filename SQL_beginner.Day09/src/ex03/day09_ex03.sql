drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;
drop function fnc_trg_person_insert_audit, fnc_trg_person_update_audit, fnc_trg_person_delete_audit;
truncate table person_audit;


create function fnc_trg_person_audit() returns trigger as $$
begin
  if (TG_OP = 'DELETE') then
    insert into person_audit 
    values(
      (select count(*) from person_audit) + 1,
      current_timestamp,
      'D',
      old.id,
      old.name,
      old.age,
      old.gender,
      old.address
    );
    return old;
  elsif (TG_OP = 'INSERT') then
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
  elsif (TG_OP = 'UPDATE') then
    insert into person_audit 
    values(
      (select count(*) from person_audit) + 1,
      current_timestamp,
      'U',
      old.id,
      old.name,
      old.age,
      old.gender,
      old.address
    );
    return old;
  end if;
end;
$$ language plpgsql;

create trigger trg_person_audit  
after insert or update or delete
on person
for each row
execute function fnc_trg_person_audit();



-- insert into person(id, name, age, gender, address) 
-- values(10, 'Damir', 22, 'male', 'Irkutsk'); 
-- update person set name = 'Bulat' where id = 10; 
-- update person set name = 'Damir' where id = 10; 
-- delete from person where id = 10;

-- select * from person_audit;
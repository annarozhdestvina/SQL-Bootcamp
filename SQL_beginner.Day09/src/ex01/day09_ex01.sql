create function fnc_trg_person_update_audit() returns trigger as $$
begin
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
end;
$$ language plpgsql;

create trigger trg_person_update_audit
after update
on person
for each row
execute function fnc_trg_person_update_audit();


UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10;

select * from person_audit;
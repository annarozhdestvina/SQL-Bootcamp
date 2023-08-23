create function fnc_trg_person_delete_audit() returns trigger as $$
begin
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
end;
$$ language plpgsql;

create trigger trg_person_delete_audit
after delete
on person
for each row
execute function fnc_trg_person_delete_audit();
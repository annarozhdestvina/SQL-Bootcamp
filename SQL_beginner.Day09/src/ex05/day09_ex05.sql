drop function fnc_persons_male, fnc_persons_female;


create function fnc_persons(in pgender varchar default 'female' )
returns table(id bigint, name varchar, age integer, gender varchar, address varchar) as $$
    select * from person where gender = pgender;
$$ language sql;  


-- select *
-- from fnc_persons(pgender := 'male');

-- select *
-- from fnc_persons();